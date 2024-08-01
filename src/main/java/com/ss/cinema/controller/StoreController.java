package com.ss.cinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreController {
	
	@RequestMapping("/storeList")
	public String movieList() {
		System.out.println("StoreController 안 storeList() 실행");
		
		return "store/storeList";
	}
	
	@RequestMapping("/storeDetail")
	public String movieDetail() {
		System.out.println("StoreController 안 storeDetail() 실행");
		
		return "store/storeDetail";
	}

}
