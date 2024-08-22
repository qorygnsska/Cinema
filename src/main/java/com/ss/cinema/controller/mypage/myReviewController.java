package com.ss.cinema.controller.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.MyReviewDTO;
import com.ss.cinema.dto.ReviewDTO;
import com.ss.cinema.service.mypage.myReviewService;
import com.ss.cinema.service.mypage.myStampService;

@Controller
public class myReviewController {

	@Autowired
	private myStampService myStampservice;

	@Autowired
	private myReviewService myReviewservice;

	@RequestMapping("/myReview")
	public String myReview(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page,
			RedirectAttributes redirectAttributes) {

		String sessionId = (String) session.getAttribute("sessionId");

		// 로그인 체크
		if (sessionId == null) {
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

		List<ReviewDTO> review = myReviewservice.getReview(sessionId);

		// 페이지네이션
		int pageSize = 5; // 페이지에서 보여 줄 데이터의 수
		int totalPages = (int) Math.ceil((double) review.size() / pageSize);

		// 페이지별 리뷰 가져오기
		List<MyReviewDTO> pagereview = myReviewservice.getPageReview(page, pageSize, sessionId);
		System.out.println(pagereview);

		model.addAttribute("currentPage", page);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("pagereview", pagereview);

		return "mypage/myReview";
	}

	// 리뷰 작성
	@RequestMapping("/writeReview")
	public String writeReview(int movieNo, int ticketNo, int star, String reContent, HttpSession session,
			RedirectAttributes redirectAttributes) {
		String sessionId = (String) session.getAttribute("sessionId");
		System.out.println("티켓 : " + ticketNo);
		System.out.println("영화번호 : " + movieNo);
		System.out.println("별점" + star);
		System.out.println("내용" + reContent);

		myReviewservice.writeReview(movieNo, ticketNo, star, reContent, sessionId);
		redirectAttributes.addFlashAttribute("reviewMessage", "리뷰작성이 완료되었습니다!");
		return "redirect:/myMovie";
	}

	// 리뷰 삭제
	@RequestMapping("/deleteReview")
	public String deleteReview(int no, RedirectAttributes redirectAttributes) {
		myReviewservice.deleteReview(no);
		redirectAttributes.addFlashAttribute("delreviewMessage", "리뷰삭제가 완료되었습니다!");
		return "redirect:/myReview";

	}

	@RequestMapping("/checkReviewStatus")
	@ResponseBody
	public ResponseEntity<Map<String, Boolean>> checkReviewStatus(@RequestParam int movieNo,
			@RequestParam String memberId, @RequestParam int ticketNo) {

		// 리뷰 체크
		int checkReview = myReviewservice.checkReview(movieNo, memberId, ticketNo);
		
		boolean check = (checkReview > 0);

		// JSON 객체 생성
		Map<String, Boolean> response = new HashMap<String, Boolean>();
		response.put("check", check);

		// JSON 응답 반환
		return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(response);
	}

}
