package com.ss.cinema.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class myReviewController {
	
	@RequestMapping("/myReview")
	public String myReview() {
		
		return "mypage/myReview";
	}
}
