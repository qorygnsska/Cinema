package com.ss.cinema.controller.mypage;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.service.mypage.myEditService;
import com.ss.cinema.service.mypage.myStampService;

@Controller
public class myProfileController {
	
	@Autowired
	myStampService myStampservice;
	@Autowired
	myEditService myEditservice;
	
	@CacheEvict
	@RequestMapping("/profileupload")
	public String profileupload(MultipartFile file, HttpSession session, RedirectAttributes redirectAttributes) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		MemberDTO member = myStampservice.getStmap(sessionId);
		
		String projectPath = "C:\\fullstack_project2\\Cinema";
		
		 try {
	            // 파일을 저장할 경로 설정
			 	String uploadDir = projectPath + "\\src\\main\\webapp\\resources\\img\\profile\\";
	            File uploadDirFile = new File(uploadDir);
	            if (!uploadDirFile.exists()) {
	                uploadDirFile.mkdirs();
	            }

	            // 파일을 지정된 디렉토리에 저장
	            String filename = file.getOriginalFilename();
	            File destinationFile = new File(uploadDir + filename);
	            Files.copy(file.getInputStream(), destinationFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
	            
	            
	            System.out.println("성공");
	            member.setMemberImg(filename);
	            myEditservice.updateImg(member);
	            
	            redirectAttributes.addFlashAttribute("imgsuccessMessage", "프로필 사진 변경 완료!");
	            return "redirect:/myMovie"; // 성공 시 리다이렉트

	        } catch (IOException e) {
	            e.printStackTrace();
	            System.out.println("실패");
	            redirectAttributes.addFlashAttribute("imgfailMessage", "프로필 사진 변경 실패!");
	            return "redirect:/myMovie"; // 실패 시 리다이렉트
	        }
	}
}
