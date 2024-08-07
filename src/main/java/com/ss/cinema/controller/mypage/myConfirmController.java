package com.ss.cinema.controller.mypage;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.service.mypage.myStampService;

@Controller
public class myConfirmController {

	@Autowired
	private myStampService myStampservice;

	@RequestMapping("/myConfirm")
	public String myConfirm(Model model, HttpSession session, RedirectAttributes redirectAttributes) {
		
		String sessionId = (String)session.getAttribute("sessionId");
		
		// 로그인 체크
		if(sessionId == null) {
			redirectAttributes.addFlashAttribute("loginMessage", "로그인 상태가 아닙니다!"); 
			return "redirect:/login";
		}
				
		// 로그인 아이디 멤버 정보 가져오기
		MemberDTO member = myStampservice.getStmap(sessionId);

		// 스탬프 개수 9와 비교
		if (member.getMemberStamp() >= 9) {
			member.setMemberStamp(member.getMemberStamp() - 9);
			member.setMemberCoupon(member.getMemberCoupon() + 1);

			// 스탬프, 쿠폰 개수 수정해서 업데이트
			myStampservice.setCoupon(member);
		}
		model.addAttribute("member", member);
		
		return "mypage/myConfirm";
	}

}
