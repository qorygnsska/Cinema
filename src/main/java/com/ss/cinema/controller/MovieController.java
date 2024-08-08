package com.ss.cinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.ReviewDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
    private MovieService movieService;

    @RequestMapping("/movieList")
    public String movieList(Model model) {
        System.out.println("MovieController 안 movieList() 실행");
        
        // 영화 리스트 정보 가져오기
        List<movieDTO> movieList = movieService.getMovieListInfo();
        System.out.println(movieList);
        model.addAttribute("movieList", movieList);
        
        return "movie/movieList";
    }
	
	@RequestMapping("/movieDetail")
	public String movieDetail(Model model,movieDTO movieDTO) {
		System.out.println("MovieController 안 movieDetail() 실행");
		
		// 영화 정보 가져오기
		movieDTO movie = movieService.getMovieDetailInfo(movieDTO);
		System.out.println("MovieDTO : " + movie);
		model.addAttribute("movie", movie);
		
		return "movie/movieDetail";
	}
}
