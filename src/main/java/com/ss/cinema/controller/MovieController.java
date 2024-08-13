package com.ss.cinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public String movieList(Model model, String sort) {
        System.out.println("MovieController 안 movieList() 실행");
        
        // 영화 리스트 정보 가져오기
        List<movieDTO> movieList = movieService.getMovieListInfo();
        System.out.println(movieList);
        
        // 영화 예매율 가져오기
//        List<movieDTO> movieReservation = movieService.getMovieReservation();
//        System.out.println("예매율 : " + movieReservation);
        
        // 예매율순 정렬
        if("reservation".equals(sort)) {
        	movieList = movieService.sortReservation();
        // 별점순 정렬
        } else {
        	movieList = movieService.sortmovieRating();
        }
        
        model.addAttribute("movieList", movieList);
//        model.addAttribute("movieReservation", movieReservation);
        
        return "movie/movieList";
    }
	
	@RequestMapping("/movieDetail")
	public String movieDetail(Model model, movieDTO movieDTO, @RequestParam(defaultValue = "1") int page) {
		System.out.println("MovieController 안 movieDetail() 실행");
		
		// 영화별 정보 가져오기
		movieDTO movie = movieService.getMovieDetailInfo(movieDTO);
		System.out.println("movie : " + movie);
		
		// 영화별 리뷰 정보 가져오기
		List<ReviewDTO> review = movieService.getMovieReviewInfo(movieDTO);
		System.out.println("review : " + review);
		
		// 영화별 리뷰 총 개수 가져오기
		ReviewDTO reviewTotal = movieService.getReviewTotal(movieDTO);
		System.out.println("리뷰 총 개수 : " + reviewTotal);
		
		// 페이지네이션
		int reviewPage = 5;
		int totalReview = review.size();
		int totalPage = (int) Math.ceil((double) totalReview / reviewPage);
		int start = (page -1) * reviewPage;
		int end = Math.min(start + reviewPage, totalReview);
		
		List<ReviewDTO> paginatedReview = review.subList(start, end);
		
		// 영화별 예매율 정보
		movieDTO movieReservationInfo = movieService.getMovieReservationInfo(movieDTO);
		System.out.println("예매율 : " + movieReservationInfo.getMovieReservation());
		
		
		model.addAttribute("movie", movie);
		model.addAttribute("review", paginatedReview);
		model.addAttribute("currentPage", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("reviewTotal", reviewTotal);
		model.addAttribute("movieReservationInfo", movieReservationInfo.getMovieReservation());
		
		return "movie/movieDetail";
	}
	
}
