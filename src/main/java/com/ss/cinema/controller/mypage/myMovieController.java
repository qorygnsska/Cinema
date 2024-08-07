package com.ss.cinema.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.MyMovieDTO;
import com.ss.cinema.service.mypage.myMovieService;
import com.ss.cinema.service.mypage.myStampService;

@Controller
public class myMovieController {

	@Autowired
	private myStampService myStampservice;
	@Autowired
	private myMovieService myMovieservice;

	@RequestMapping("/myMovie")
	public String myMovie(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page, RedirectAttributes redirectAttributes) {

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
		
		// 영화 예매내역 가져오기
		List<MyMovieDTO> moviepayment = myMovieservice.getMoviePayment(sessionId);
		
		model.addAttribute("moviepayment", moviepayment);
		
		// 페이지네이션
		int pageSize = 5; // 페이지에서 보여 줄 데이터의 수
		int totalPages = (int) Math.ceil((double) moviepayment.size() / pageSize);
		
		// 페이지당 영화 예매내역 가져오기
		List<MyMovieDTO> pagemoviepayment = myMovieservice.getPageMoviePayment(page, pageSize, sessionId);
		
		model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pagemoviepayment", pagemoviepayment);

		return "mypage/myMovie";
	}
}
