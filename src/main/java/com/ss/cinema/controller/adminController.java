package com.ss.cinema.controller;

import com.ss.cinema.dto.CinemaDTO;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
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
import javax.servlet.http.HttpServletResponse;

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
//---------------------------------------------------------------------------------------------------------------------------//
    

    @GetMapping("/adminMain")
    public String adminMain(@RequestParam(value = "page", required = false) String page,
            @RequestParam(value = "search", required = false) String search,
            @RequestParam(value = "pageNumber", required = false) Integer pageNumber, // Integer로 변경
            @RequestParam(value = "movieNo", required = false) Integer movieNo,
            @RequestParam(value = "cinemaRLG", required = false) String cinemaRLG,
            @RequestParam(value = "cinemaBLG", required = false) String cinemaBLG,
            @RequestParam(value = "cinemaScreenDate", required = false) String cinemaScreenDate,
            @RequestParam(value = "theaterName", required = false) String theaterName,
            Model model) {

// pageNumber가 null이거나 잘못된 값이 들어왔을 경우 기본값 설정
if (pageNumber == null || pageNumber < 1) {
pageNumber = 1;
}

if ("userList".equals(page)) {
return userList(search, model);
} else if ("addSchedule".equals(page)) {
return showAddScheduleForm(model);
} else if ("movieList".equals(page)) {
return movieList(model, pageNumber);
} else if ("productList".equals(page)) {
return productList(model, pageNumber);
} else if ("scheduleList".equals(page)) {
return listSchedules(movieNo, cinemaRLG, cinemaBLG, cinemaScreenDate, theaterName, model);
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

            // 메인 이미지 파일 처리
            if (!movie.getMovieMainImageFile().isEmpty()) {
                String fileName = movie.getMovieMainImageFile().getOriginalFilename();
                String uploadDir = projectPath + "\\src\\main\\webapp\\resources\\img\\movie\\poster";
                movie.setMovieMainImage(fileName);

                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(uploadDir + File.separator + fileName);
                movie.getMovieMainImageFile().transferTo(serverFile);

                System.out.println("메인 이미지 파일 저장 성공: " + serverFile.getAbsolutePath());
            } else {
                movie.setMovieMainImage(null); // 파일이 없을 경우 null로 설정
            }

            // 서브 이미지1 파일 처리
            if (!movie.getMovieSubImageFile().isEmpty()) {
                String fileName = movie.getMovieSubImageFile().getOriginalFilename();
                String uploadDir = projectPath + "\\src\\main\\webapp\\resources\\img\\movie\\poster";
                movie.setMovieSubImage(fileName);

                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(uploadDir + File.separator + fileName);
                movie.getMovieSubImageFile().transferTo(serverFile);

                System.out.println("서브 이미지1 파일 저장 성공: " + serverFile.getAbsolutePath());
            } else {
                movie.setMovieSubImage(null); // 파일이 없을 경우 null로 설정
            }

            // 서브 이미지2 파일 처리
            if (!movie.getMovieSsubImageFile().isEmpty()) {
                String fileName = movie.getMovieSsubImageFile().getOriginalFilename();
                String uploadDir = projectPath + "\\src\\main\\webapp\\resources\\img\\movie\\poster";
                movie.setMovieSsubImage(fileName);

                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(uploadDir + File.separator + fileName);
                movie.getMovieSsubImageFile().transferTo(serverFile);

                System.out.println("서브 이미지2 파일 저장 성공: " + serverFile.getAbsolutePath());
            } else {
                movie.setMovieSsubImage(null); // 파일이 없을 경우 null로 설정
            }

            // 트레일러 파일 처리
            if (!movie.getMovieTrailerFile().isEmpty()) {
                String fileName = movie.getMovieTrailerFile().getOriginalFilename();
                
                // 파일 확장자 확인
                if (!fileName.endsWith(".mp4")) {
                    System.out.println("트레일러 파일이 mp4 형식이 아닙니다: " + fileName);
                    model.addAttribute("error", "트레일러 파일은 mp4 형식이어야 합니다.");
                    return "admin/addMovie";
                }
                
                String uploadDirTeaser = projectPath + "\\src\\main\\webapp\\resources\\img\\movie\\teaser";
                movie.setMovieTrailer(fileName);

                File dir = new File(uploadDirTeaser);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(uploadDirTeaser + File.separator + fileName);
                movie.getMovieTrailerFile().transferTo(serverFile);

                System.out.println("트레일러 파일 저장 성공: " + serverFile.getAbsolutePath());
            } else {
                movie.setMovieTrailer(null); // 파일이 없을 경우 null로 설정
            }

            // 메인 썸네일 파일 처리
            if (!movie.getMovieMainThumbnailFile().isEmpty()) {
                String fileName = movie.getMovieMainThumbnailFile().getOriginalFilename();
                String uploadDir = projectPath + "\\src\\main\\webapp\\resources\\img\\movie\\Thumbnail";
                movie.setMovieMainThumbnail(fileName);

                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(uploadDir + File.separator + fileName);
                movie.getMovieMainThumbnailFile().transferTo(serverFile);

                System.out.println("메인 썸네일 파일 저장 성공: " + serverFile.getAbsolutePath());
            } else {
                movie.setMovieMainThumbnail(null); // 파일이 없을 경우 null로 설정
            }

            // 서브 썸네일1 파일 처리
            if (!movie.getMovieSubThumbnailFile().isEmpty()) {
                String fileName = movie.getMovieSubThumbnailFile().getOriginalFilename();
                String uploadDir = projectPath + "\\src\\main\\webapp\\resources\\img\\movie\\Thumbnail";
                movie.setMovieSubThumbnail(fileName);

                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(uploadDir + File.separator + fileName);
                movie.getMovieSubThumbnailFile().transferTo(serverFile);

                System.out.println("서브 썸네일1 파일 저장 성공: " + serverFile.getAbsolutePath());
            } else {
                movie.setMovieSubThumbnail(null); // 파일이 없을 경우 null로 설정
            }

            // 서브 썸네일2 파일 처리
            if (!movie.getMovieSsubThumbnailFile().isEmpty()) {
                String fileName = movie.getMovieSsubThumbnailFile().getOriginalFilename();
                String uploadDir = projectPath + "\\src\\main\\webapp\\resources\\img\\movie\\Thumbnail";
                movie.setMovieSsubThumbnail(fileName);

                File dir = new File(uploadDir);
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(uploadDir + File.separator + fileName);
                movie.getMovieSsubThumbnailFile().transferTo(serverFile);

                System.out.println("서브 썸네일2 파일 저장 성공: " + serverFile.getAbsolutePath());
            } else {
                movie.setMovieSsubThumbnail(null); // 파일이 없을 경우 null로 설정
            }

            // 영화 데이터 저장
            adminService.addMovie(movie);
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("파일 처리 중 예외 발생: " + e.getMessage());
        }
        return "redirect:/admin/adminMain?page=addMovie"; // redirect가 아니라 forward로 설정시, 제출 후, adminmain내 addmovie.jsp로.
    }
    //영화 정보 가져오기.
    @GetMapping("/movieList")
    public String movieList(Model model, @RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber) {
        int pageSize = 1000;
        List<movieDTO> movies = adminService.getMovies(pageNumber, pageSize);
        long totalMovies = adminService.countMovies();
        int totalPages = (int) Math.ceil((double) totalMovies / pageSize);

        model.addAttribute("movies", movies);
        model.addAttribute("currentPage", pageNumber);
        model.addAttribute("totalPages", totalPages);

        return "admin/adminMain"; // movieList.jsp로 포워드
    
    }
    // 영화 삭제
    @PostMapping("/deleteMovie")
    public String deleteMovie(@RequestParam(value = "movieNo", required = false) Integer movieNo) {
            adminService.deleteMovie(movieNo);
            return "redirect:/admin/adminMain?page=movieList";

    }

    

//#product
    @GetMapping("/addProduct")
    public String addProductForm() {
        return "admin/addProduct";
    }
    @PostMapping("/addProduct")
    public String addProduct(@ModelAttribute ProductDTO product, Model model, HttpServletResponse response) {
        // productCode가 없으면 기본값 설정
        if (product.getProductCode() == null || product.getProductCode().isEmpty()) {
            product.setProductCode("001"); // 기본값 설정
        }
        try {
            String projectPath = "C:\\fullstack_project2\\Cinema";
            String imageUploadDir = projectPath + "\\src\\main\\webapp\\resources\\img\\store";

            // 이미지 저장 디렉토리가 없으면 생성
            File imageDir = new File(imageUploadDir);
            if (!imageDir.exists()) {
                imageDir.mkdirs();
            }

            // 업로드된 파일을 저장
            MultipartFile productImageFile = product.getProductImageFile();
            if (productImageFile != null && !productImageFile.isEmpty()) {
                String imageFileName = productImageFile.getOriginalFilename();
                File serverFile = new File(imageUploadDir + File.separator + imageFileName);

                // 이미지 파일이 이미 존재하는지 확인
                if (serverFile.exists()) {
                    model.addAttribute("errorMessage", "이미 존재하는 이미지 파일입니다. 다른 이름을 선택하세요.");
                    // 스크립트를 사용해 페이지를 다시 로드하도록 설정
                    response.setContentType("text/html; charset=UTF-8");
                    response.getWriter().write("<script>alert('이미 존재하는 이미지 파일입니다. 다른 이름을 선택하세요.'); window.location.href='/cinema/admin/adminMain?page=addProduct';</script>");
                    return null; // 더 이상 실행하지 않고 리턴
                }
                // 서버에 파일 저장
                productImageFile.transferTo(serverFile);

                // 저장된 파일의 경로를 설정
                product.setProductImage(imageFileName);

                System.out.println("이미지 파일 저장 성공: " + serverFile.getAbsolutePath());
            } else {
                System.out.println("업로드된 이미지 파일이 없습니다.");
            }

            // 상품 정보 저장
            adminService.addProduct(product);

        } catch (IOException e) {
        	   e.printStackTrace();
               String errorMessage = "이미지 파일 저장 중 오류 발생: " + e.getMessage();
               model.addAttribute("errorMessage", errorMessage);
               return "admin/addProduct"; // 에러 메시지와 함께 다시 추가 페이지로
        }
        return "redirect:/admin/adminMain?page=addProduct";
    }
    @GetMapping("/admin/productList")
    public String productList(Model model, @RequestParam(value = "pageNumber", defaultValue = "1") int pageNumber) {
        int pageSize = 10;
        List<ProductDTO> products = adminService.getProducts(pageNumber, pageSize);
        long totalProducts = adminService.countProducts();
        int totalPages = (int) Math.ceil((double) totalProducts / pageSize);


        // 시작 번호 계산 (페이지 번호에 따른 연속적인 번호 부여)
        int startNumber = (pageNumber - 1) * pageSize + 1;        
        
        model.addAttribute("products", products);
        model.addAttribute("currentPage", pageNumber);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("startNumber", startNumber);  // 시작 번호 추가
        return "admin/adminMain"; // productList.jsp로 이동
    }

    @GetMapping("/deleteProduct")
    public String deleteProduct(@RequestParam("id") int productId) {
        adminService.deleteProduct(productId);
        return "redirect:/admin/adminMain?page=productList"; 
    }
    
    
    
    
// #유저 리스트 
    @GetMapping("/userList")
    public String userList(@RequestParam(value = "search", required = false) String search, Model model) {
        List<MemberDTO> members;
        members = adminService.getAllMembers();

        // 모델에 회원 목록을 추가
        model.addAttribute("members", members);
        return "/admin/adminMain";  // 여기서 "userList.jsp"가 아닌 "adminMain.jsp"로 반환하는 것에 유의
    }


    @GetMapping("/editUser")
    public String editUserForm(@RequestParam("id") String id, Model model) {
        MemberDTO member = adminService.getMemberById(id);
        model.addAttribute("member", member);
        return "admin/editUser";
    }

    @PostMapping("/editUser")
    public String editUser(@ModelAttribute MemberDTO member) {
        adminService.updateMember(member);
        return "redirect:/admin/adminMain?page=userList";
    }

    @GetMapping("/deleteUser")
    public String deleteUser(@RequestParam("id") String id) {
        adminService.deleteMember(id);
        return "redirect:/admin/adminMain?page=userList";
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
    public String addSchedule(@ModelAttribute CinemaDTO cinemaDTO, @ModelAttribute TheaterDTO theaterDTO) {
        System.out.println("cinemaMovieNo: " + cinemaDTO.getCinemaMovieNo());  // 디버깅용 출력
        adminService.addSchedule(cinemaDTO, theaterDTO);
        return "redirect:/admin/adminMain?page=scheduleList";
    }

    @GetMapping("/scheduleList")
    public String listSchedules(@RequestParam(required = false) Integer movieNo,
            @RequestParam(required = false) String cinemaRLG,
            @RequestParam(required = false) String cinemaBLG,
            @RequestParam(required = false) String cinemaScreenDate,
            @RequestParam(required = false) String theaterName,
            Model model) {
// 서비스 메서드 호출
List<TheaterDTO> schedules = adminService.getMovieSchedule(movieNo, cinemaRLG, cinemaBLG, cinemaScreenDate, theaterName);
model.addAttribute("schedules", schedules);
        // 뷰 이름 반환
        return "admin/adminMain";
    }
    
    @PostMapping("/deleteSchedule")
    public String deleteSchedule(@RequestParam("theaterNo") Integer theaterNo, RedirectAttributes redirectAttributes) {
        try {
            boolean isDeleted = adminService.deleteSchedule(theaterNo);
            if (isDeleted) {
                redirectAttributes.addFlashAttribute("message", "상영 시간이 성공적으로 삭제되었습니다.");
            } else {
                redirectAttributes.addFlashAttribute("error", "상영 시간을 삭제하는데 실패했습니다.");
            }
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "삭제 중 문제가 발생했습니다. 관리자에게 문의하세요.");
            e.printStackTrace();  // 추가적으로 에러를 로그로 출력
        }
        return "redirect:/admin/adminMain?page=scheduleList"; // 삭제 후 상영 시간표 목록으로 리다이렉트
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