package com.ss.cinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.TheaterDTO;

@Controller
public class MovieController {
	
	@RequestMapping("/movieList")
	public String movieList() {
		System.out.println("MovieController 안 movieList() 실행");
		
		return "movie/movieList";
	}
	
	@RequestMapping("/movieDetail")
	public String movieDetail() {
		System.out.println("MovieController 안 movieDetail() 실행");
		
		return "movie/movieDetail";
	}
}
