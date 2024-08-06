package com.ss.cinema.controller;

import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.service.adminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.ServletContext;

@Controller
@RequestMapping("/admin")
public class adminController {

    @Autowired
    private adminService adminService;

    @GetMapping("/adminMain")
    public String adminMain(@RequestParam(value = "page", required = false) String page, Model model) {
        if ("userList".equals(page)) {
            return "redirect:/admin/userList";
        }
        return "admin/adminMain";
    }

    @GetMapping("/addMovie")
    public String showAddMovieForm() {
        return "admin/addMovie";
    }

    
    @PostMapping("/addMovie")
    public String addMovie(@ModelAttribute movieDTO movie, @RequestParam("movieImage") MultipartFile movieImage, @RequestParam("movieTrailer") MultipartFile movieTrailer) {
        try {
            // 파일 저장 경로 설정
            String imageUploadDir = Paths.get("src/main/webapp/resources/img/poster").toString();
            String trailerUploadDir = Paths.get("src/main/webapp/resources/img/teaser").toString();

            File imageDir = new File(imageUploadDir);
            if (!imageDir.exists()) {
                imageDir.mkdirs();
            }

            File trailerDir = new File(trailerUploadDir);
            if (!trailerDir.exists()) {
                trailerDir.mkdirs();
            }

            // 이미지 파일 저장
            if (!movieImage.isEmpty()) {
                String imageFileName = movieImage.getOriginalFilename();
                File imageFile = new File(imageUploadDir + File.separator + imageFileName);
                movieImage.transferTo(imageFile);
                movie.setMovieImage("/resources/img/poster/" + imageFileName);
            }

            // 예고편 파일 저장
            if (!movieTrailer.isEmpty()) {
                String trailerFileName = movieTrailer.getOriginalFilename();
                File trailerFile = new File(trailerUploadDir + File.separator + trailerFileName);
                movieTrailer.transferTo(trailerFile);
                movie.setMovieTrailer("/resources/img/teaser/" + trailerFileName);
            }

            adminService.addMovie(movie);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/admin/adminMain";
    }

    @GetMapping("/addProduct")
    public String addProductForm() {
        return "admin/addProduct"; 
    }

    @PostMapping("/addProduct")
    public String addProduct(@ModelAttribute ProductDTO product, @RequestParam("productImage") MultipartFile productImage) {
        try {
            // 파일 저장 경로 설정
            String imageUploadDir = Paths.get("src/main/webapp/resources/img/product").toString();

            File imageDir = new File(imageUploadDir);
            if (!imageDir.exists()) {
                imageDir.mkdirs();
            }

            // 이미지 파일 저장
            if (!productImage.isEmpty()) {
                String imageFileName = productImage.getOriginalFilename();
                File imageFile = new File(imageUploadDir + File.separator + imageFileName);
                productImage.transferTo(imageFile);
                product.setProductImage("/resources/img/product/" + imageFileName);
            }

            adminService.addProduct(product);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:/admin/adminMain";
    }

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
        return "admin/userList"; 
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

    // 상영 시간표 추가
    @GetMapping("/addSchedule")
    public String showAddScheduleForm(Model model) {
        return "admin/addSchedule";
    }

    @PostMapping("/addSchedule")
    public String addSchedule(@ModelAttribute TheaterDTO theaterDTO) {
        adminService.addSchedule(theaterDTO);
        return "redirect:/admin/scheduleList";
    }

    // 상영 시간표 목록
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