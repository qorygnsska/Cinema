package com.ss.cinema.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String myMovie(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page) {

		String sessionId = (String)session.getAttribute("sessionId");
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

		return "mypage/myMovie";
	}
}
