package com.ss.cinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mypageController {

	@RequestMapping("/myMovie")
	public String myMovie() {
		return "mypage/myMovie";
	}
	
	@RequestMapping("/myProduct")
	public String myProduct() {
		return "mypage/myProduct";
	}
	
	@RequestMapping("/myStamp")
	public String myStamp() {
		return "mypage/myStamp";
	}
	
	@RequestMapping("/myEdit")
	public String myEdit() {
		return "mypage/myEdit";
	}
	
}
