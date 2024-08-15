package com.ss.cinema.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.ReviewDTO;
import com.ss.cinema.dto.movieDTO;

@Mapper
public interface MovieMapper {

	// 영화 리스트 정보 가져오기
	List<movieDTO> getMovieListInfo();

	// 영화 상세 정보 가져오기
	movieDTO getMovieDetailInfo(movieDTO movieDTO);
	
	// 영화 리뷰 정보 가져오기
	List<ReviewDTO> getMovieReviewInfo(movieDTO movieDTO);
	
	// 영화별 리뷰 총 개수
	ReviewDTO getReviewTotal(movieDTO movieDTO);
	
	// 영화별 예매율
	movieDTO getMovieReservationInfo(movieDTO movieDTO);
	
	// movieList 예매율순 정렬
	List<movieDTO> sortReservation();
	
	// movieList 별점순 정렬
	List<movieDTO> sortmovieRating();
	
	// 영화 검색
	List<movieDTO> searchMovieTitle(@Param("movieTitle") String movieTitle);
	
	
}
