package com.ss.cinema.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ss.cinema.dto.ReviewDTO;
import com.ss.cinema.dto.movieDTO;

@Mapper
public interface MovieMapper {

	// 영화 리스트 정보 가져오기
	List<movieDTO> getMovieListInfo();

	// 영화 상세 정보 가져오기
	movieDTO getMovieDetailInfo(movieDTO movieDTO);
	
	// 영화 리뷰 정보 가져오기
	movieDTO getMovieReviewInfo(@Param("movieNo") int movieNo, @Param("ReviewDTO") ReviewDTO reviewDAO);
	

}
