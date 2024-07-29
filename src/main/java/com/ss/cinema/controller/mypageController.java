package com.ss.cinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class mypageController {

	@RequestMapping("/myMovie")
	public String myMovie() {
		return "mypage/myMovie";
	}
	
	@RequestMapping("/myMovieCart")
	public String myMovieCart() {
		return "mypage/myMovieCart";
	}
	@RequestMapping("/movieList")
	public String movieList() {
		return "movie/movieList";
	}
	
}
