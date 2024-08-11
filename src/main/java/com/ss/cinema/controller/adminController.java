package com.ss.cinema.controller;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.service.adminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.InitBinder;

import java.beans.PropertyEditorSupport;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/admin")
public class adminController {

    @Autowired
    private adminService adminService;

    

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
    	
        final SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
        timeFormat.setLenient(false);

        binder.registerCustomEditor(Date.class, "theaterStartTime", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                try {
                    setValue(timeFormat.parse(text));
                } catch (ParseException e) {
                    setValue(null);
                }
            }

            @Override
            public String getAsText() {
                Date value = (Date) getValue();
                return (value != null ? timeFormat.format(value) : "");
            }
        });

        binder.registerCustomEditor(Date.class, "theaterEndTime", new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) {
                try {
                    setValue(timeFormat.parse(text));
                } catch (ParseException e) {
                    setValue(null);
                }
            }

            @Override
            public String getAsText() {
                Date value = (Date) getValue();
                return (value != null ? timeFormat.format(value) : "");
            }
        });
    }

    

    @GetMapping("/adminMain")
    public String adminMain(@RequestParam(value = "page", required = false) String page,
                            @RequestParam(value = "search", required = false) String search,
                            @RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber,
                            Model model) {
        if ("userList".equals(page)) {
            return userList(search, pageNumber, model);
        } else if ("addSchedule".equals(page)) {
            return showAddScheduleForm(model);
        }
        model.addAttribute("currentPage", page);
        return "admin/adminMain";
    }
//addMovie.jsp, MovieList.jsp
    @GetMapping("/addMovie")
    public String showAddMovieForm() {
        return "admin/addMovie";
    }
   
    @GetMapping("/checkMovieTitle")
    public ResponseEntity<Boolean> checkMovieTitle(@RequestParam("movieTitle") String movieTitle) {
        boolean exists = adminService.isMovieTitleExists(movieTitle);
        return ResponseEntity.ok(exists);
    }
    @Autowired
    private ServletContext servletContext; // 주입받는 부분은 그대로 유지

    @PostMapping("/addMovie")
    public String addMovie(@ModelAttribute movieDTO movie, Model model) {
        try {
            String projectPath = "C:\\fullstack_project2\\Cinema";
            
            // 이미지 파일 처리
            if (!movie.getMovieImageFile().isEmpty()) {
                String fileName = movie.getMovieImageFile().getOriginalFilename();
                String uploadDir = projectPath + "\\src\\main\\webapp\\resources\\img\\movie\\poster";
                movie.setMovieImage("/resources/img/movie/poster/" + fileName);

                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(uploadDir + File.separator + fileName);
                movie.getMovieImageFile().transferTo(serverFile);

                System.out.println("이미지 파일 저장 성공: " + serverFile.getAbsolutePath());
            }

            // 트레일러 파일 처리
            if (!movie.getMovieTrailerFile().isEmpty()) {
                String fileName = movie.getMovieTrailerFile().getOriginalFilename();
                String uploadDirTeaser = projectPath + "\\src\\main\\webapp\\resources\\img\\movie\\teaser";
                movie.setMovieTrailer("/resources/img/movie/teaser/" + fileName);

                File dir = new File(uploadDirTeaser);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(uploadDirTeaser + File.separator + fileName);
                movie.getMovieTrailerFile().transferTo(serverFile);

                System.out.println("트레일러 파일 저장 성공: " + serverFile.getAbsolutePath());
            }

            // 영화 데이터 저장
            adminService.addMovie(movie);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("파일 처리 중 예외 발생: " + e.getMessage());
        }
        return  "redirect:/admin/adminMain?page=addMovie"; // redirect가 아니라 forward로 설정시, 제출 후, adminmain내 addmovie.jsp로.
    }

//#product
    @GetMapping("/addProduct")
    public String addProductForm() {
        return "admin/addProduct";
    }

    @PostMapping("/addProduct")
    public String addProduct(@ModelAttribute ProductDTO product, @RequestParam("productImage") MultipartFile productImage) {
        try {
            String imageUploadDir = Paths.get("src/main/webapp/resources/img/store").toString();

            File imageDir = new File(imageUploadDir);
            if (!imageDir.exists()) {
                imageDir.mkdirs();
            }

            if (!productImage.isEmpty()) {
                String imageFileName = productImage.getOriginalFilename();
                File imageFile = new File(imageUploadDir + File.separator + imageFileName);
                productImage.transferTo(imageFile);
                product.setProductImage("/resources/img/store/" + imageFileName);
            }

            adminService.addProduct(product);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/admin/adminMain";
    }
// #유저 리스트 
    @GetMapping("/userList")
    public String userList(@RequestParam(value = "search", required = false) String search,
                           @RequestParam(value = "page", defaultValue = "1") int page, Model model) {
        int pageSize = 15;
        List<MemberDTO> members;
        long totalMembers;
        if (search != null && !search.isEmpty()) {
            members = adminService.searchMembersByName(search, page, pageSize);
            totalMembers = adminService.countMembersByName(search);
        } else {
            members = adminService.getAllMembers(page, pageSize);
            totalMembers = adminService.countAllMembers();
        }
        int totalPages = (int) Math.ceil((double) totalMembers / pageSize);

        model.addAttribute("members", members);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("search", search);
        return "admin/adminMain";
    }

    @GetMapping("/editUser")
    public String editUserForm(@RequestParam("id") Long id, Model model) {
        MemberDTO member = adminService.getMemberById(id);
        model.addAttribute("member", member);
        return "admin/editUser";
    }

    @PostMapping("/editUser")
    public String editUser(@ModelAttribute MemberDTO member) {
        adminService.updateMember(member);
        return "redirect:/admin/userList";
    }

    @GetMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") Long id) {
        adminService.deleteMember(id);
        return "redirect:/admin/userList";
    }
//#상영 시간표 컨트롤러
    @GetMapping("/addSchedule")
    public String showAddScheduleForm(Model model) {
        List<movieDTO> movies = adminService.getAllMovies();
        Map<Integer, Integer> movieShowtimes = new HashMap<Integer, Integer>();
        for (movieDTO movie : movies) {
            movieShowtimes.put(movie.getMovieNo(), movie.getMovieShowtime());
        }

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            String movieShowtimesJson = objectMapper.writeValueAsString(movieShowtimes);
            model.addAttribute("movieShowtimesJson", movieShowtimesJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        model.addAttribute("movies", movies);
        model.addAttribute("currentPage", "addSchedule");
        return "admin/adminMain";
    }

    @PostMapping("/addSchedule")
    public String addSchedule(@ModelAttribute TheaterDTO theaterDTO) {
        adminService.addSchedule(theaterDTO);
        return "redirect:/admin/scheduleList";
    }

    @GetMapping("/scheduleList")
    public String listSchedules(Model model) {
        model.addAttribute("schedules", adminService.getAllSchedules());
        return "admin/scheduleList";
    }
}

    
    
    
    









//// 회원 리스트 페이지
//@GetMapping("/userList")
//public String userList(Model model) {
//	System.out.println("유저 리스트");
//    List<MemberDTO> members = adminService.getAllMembers();
//    model.addAttribute("members", members);
// 	System.out.println(members);
//    return "admin/userList"; 