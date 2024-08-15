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
    public String movieList(Model model, @RequestParam(defaultValue = "reservation")String sort, @RequestParam(value = "search", required = false) String search) {
        System.out.println("MovieController 안 movieList() 실행");
        
//        List<movieDTO> movieList;
        
        // 영화 리스트 정보 가져오기
        List<movieDTO> movieList = movieService.getMovieListInfo();
        System.out.println(movieList);
        
        // 현재개봉작 예매율순 정렬, 검색 X
        if("reservation".equals(sort) && (search == null || search.isEmpty())) {
        	System.out.println("현재개봉작 예매율순 정렬");
        	movieList = movieService.sortReservation();
        // 현재개봉작 별점순 정렬, 검색 X
        } else if(!"reservation".equals(sort) && (search == null || search.isEmpty())){
        	System.out.println("현재개봉작 별점순 정렬");
        	movieList = movieService.sortmovieRating();
        // 검색 O
        }else if("reservation".equals(sort) && search != null && !search.isEmpty()) {
        	System.out.println("검색 내용 : " + search);
        	movieList = movieService.searchMovieTitle(search);
        }
        
        
        model.addAttribute("movieList", movieList);
        
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
