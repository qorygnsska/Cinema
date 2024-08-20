package com.ss.cinema.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.cinema.dto.LikesDTO;
import com.ss.cinema.dto.ReviewDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.mappers.MovieMapper;

@Service
public class MovieService {
	
	@Autowired
    private MovieMapper movieMapper;

	// 영화 리스트 정보 가져오기
    public List<movieDTO> getMovieListInfo() {
    	System.out.println("MovieService 안 getMovieListInfo() 실행");
        
    	return movieMapper.getMovieListInfo();
    }
    
    // 영화 상세정보 가져오기
    public movieDTO getMovieDetailInfo(movieDTO movieDTO) {
    	System.out.println("MovieService 안 getMovieDetailInfo() 실행");
        
    	return movieMapper.getMovieDetailInfo(movieDTO);
    }
    
    // 영화 리뷰 정보 가져오기
    public List<ReviewDTO> getMovieReviewInfo(movieDTO movieDTO) {
    	System.out.println("MovieService 안 getMovieReviewInfo() 실행");
    	
    	return movieMapper.getMovieReviewInfo(movieDTO);
    }
    
    // 영화별 리뷰 총 개수
    public ReviewDTO getReviewTotal(movieDTO movieDTO) {
    	System.out.println("MovieService 안 getReviewTotal() 실행");
    	
    	return movieMapper.getReviewTotal(movieDTO);
    }
    
    
    // 영화별 예매율
    public movieDTO getMovieReservationInfo(movieDTO movieDTO) {
    	System.out.println("MovieService 안 getMovieReservationInfo() 실행");
        
    	return movieMapper.getMovieReservationInfo(movieDTO);
    }
    
    // 예매율순 정렬
    public List<movieDTO> sortReservation(){
    	System.out.println("MovieService 안 sortReservation() 실행");
        
    	return movieMapper.sortReservation();
    }
    
    // 별점순 정렬
    public List<movieDTO> sortmovieRating(){
    	System.out.println("MovieService 안 sortmovieRating() 실행");
        
    	return movieMapper.sortmovieRating();
    }
    
    // 영화 검색
    public List<movieDTO> searchMovieTitle(String title){
    	System.out.println("MovieService 안 searchMovieTitle() 실행");
    	return movieMapper.searchMovieTitle(title);
    }
    
    // 현재개봉작 예매율순 정렬
    public List<movieDTO> sortCurrentReAservationMovie(){
    	System.out.println("MovieService 안 sortCurrentReAservationMovie() 실행");
    	
    	return movieMapper.sortCurrentReAservationMovie();
    }
    
    // 현재개봉작 별점순 정렬
    public List<movieDTO> sortCurrentMovieRatingMovie(){
    	System.out.println("MovieService 안 sortCurrentMovieRatingMovie() 실행");
    	
    	return movieMapper.sortCurrentMovieRatingMovie();
    }
    
    // 상영예정작
    public List<movieDTO> sortUpcomingMovie(){
    	System.out.println("MovieService 안 sortUpcomingMovie() 실행");
    	
    	return movieMapper.sortUpcomingMovie();
    }

//	public void increaseLikeCount(int reviewId) {
//		System.out.println("MovieService 안 increaseLikeCount() 실행");
//		
//		movieMapper.updateLikeCount(reviewId, 1);
//		
//	}
//
//	public void decreaseLikeCount(int reviewId) {
//		System.out.println("MovieService 안 decreaseLikeCount() 실행");
//		
//		movieMapper.updateLikeCount(reviewId, -1);
//	}
    
    // 좋아요 확인
    @Transactional
    public int checkLikes(int reviewNo, String memberId) {
    	System.out.println("MovieService 안 checkLikes() 실행");
    	
    	return movieMapper.checkLikes(reviewNo, memberId);
    }
    
    // 좋아요 추가
    @Transactional
    public void AddLikes(int reviewNo, String memberId) {
    	System.out.println("MovieService 안 AddLikes() 실행");
    	
    	movieMapper.AddLikes(reviewNo, memberId);
    }
    
    
    // 좋아요 삭제
    @Transactional
    public void deleteLikes(int reviewNo, String memberId) {
    	System.out.println("MovieService 안 deleteLikes() 실행");
    	
    	movieMapper.deleteLikes(reviewNo, memberId);
    }
    
    // 내가 누른 좋아요 확인
	public List<ReviewDTO> checkMyLike(int movieNo, String memId) {
		System.out.println("MovieService 안 checkMyLike() 실행");
    	
    	return movieMapper.checkMyLike(movieNo, memId);
	}
    
}
