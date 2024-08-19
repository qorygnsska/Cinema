package com.ss.cinema.controller.mypage;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import javax.servlet.ServletContext;
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
	@Autowired
	ServletContext servletContext;

	@RequestMapping("/profileupload")
	public String profileupload(MultipartFile file, HttpSession session, RedirectAttributes redirectAttributes) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		MemberDTO member = myStampservice.getStmap(sessionId);
		
		String uploadDir = servletContext.getRealPath("/resources/img/profile/");

		try {
			// 파일을 저장할 디렉토리 생성
			File uploadDirFile = new File(uploadDir);
			if (!uploadDirFile.exists()) {
				uploadDirFile.mkdirs();
			}

			// 파일 이름 중복 방지를 위한 UUID 추가
			String originalFilename = file.getOriginalFilename();
			String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
			String filename = UUID.randomUUID().toString() + extension;
			File destinationFile = new File(uploadDir + filename);

			// 파일을 지정된 디렉토리에 저장
			Files.copy(file.getInputStream(), destinationFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
			
			// 이미지 파일명 업데이트
			member.setMemberImg(filename);
			myEditservice.updateImg(member);
			
			redirectAttributes.addFlashAttribute("imgsuccessMessage", "프로필 사진 변경 완료!");
		} catch (IOException e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("imgfailMessage", "프로필 사진 변경 실패!");
		}

		// 파일 업로드 및 처리 완료 후 리다이렉트
		return "redirect:/myMovie";
	}
}
