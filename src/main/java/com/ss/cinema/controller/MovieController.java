package com.ss.cinema.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
    public String movieList(Model model, @RequestParam(defaultValue = "reservation")String sort, @RequestParam(value = "search", required = false) String search, @RequestParam(defaultValue = "current") String select) {
        System.out.println("MovieController 안 movieList() 실행");
        
//        List<movieDTO> movieList;
        
        // 영화 리스트 정보 가져오기
        List<movieDTO> movieList = movieService.getMovieListInfo();
//        System.out.println(movieList);
        
        // 현재상영작 예매율순 정렬, 검색 X
        if("reservation".equals(sort) && "current".equals(select) && (search == null || search.isEmpty())) {
        	System.out.println("현재개봉작 예매율순 정렬");
        	movieList = movieService.sortCurrentReAservationMovie();
        // 현재상영작 별점순 정렬, 검색 X
        } else if(!"reservation".equals(sort) && "current".equals(select) && (search == null || search.isEmpty())){
        	System.out.println("현재개봉작 별점순 정렬");
        	movieList = movieService.sortCurrentMovieRatingMovie();
        // 상영예정작, 정렬X, 검색 X
        } else if("reservation".equals(sort) && !"current".equals(select) && (search == null || search.isEmpty())) {
        	System.out.println("상영예정작");
        	movieList = movieService.sortUpcomingMovie();
        }
        // 검색 O
        else if("reservation".equals(sort) && search != null && !search.isEmpty()) {
        	System.out.println("검색 내용 : " + search);
        	movieList = movieService.searchMovieTitle(search);
        }
        
        
        model.addAttribute("movieList", movieList);
        model.addAttribute("selectedMenu", select);
        model.addAttribute("sortedMenu", sort);
        
        return "movie/movieList";
    }
	
	@RequestMapping("/movieDetail")
	public String movieDetail(Model model, movieDTO movieDTO, @RequestParam(defaultValue = "1") int page, HttpSession session) {
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
		
		// 회원 id 가져오기
		String memId = (String) session.getAttribute("sessionId");
		System.out.println("회원ID : " + memId);
		
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
		model.addAttribute("id", memId);
		
		return "movie/movieDetail";
	}
	
	// 리뷰 좋아요 업데이트
	@RequestMapping(value = "updateReviewLike")
	@ResponseBody
	public ResponseEntity<String> updateReviewLike(@RequestBody Map<String, Object> requestData){
		System.out.println("MovieController 안 updateReviewLike() 실행");
		
		String reviewNoStr = (String) requestData.get("reviewNo");
		int reviewNo = Integer.parseInt(reviewNoStr);
		String action = (String) requestData.get("action");
		
		System.out.println("reviewNo : " + reviewNo);
		System.out.println("action : " + action);
		
		try {
            if ("increase".equals(action)) {
            	movieService.increaseLikeCount(reviewNo);
            } else if ("decrease".equals(action)) {
            	movieService.decreaseLikeCount(reviewNo);
            }
            return ResponseEntity.ok("Success");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
	}
	
}
