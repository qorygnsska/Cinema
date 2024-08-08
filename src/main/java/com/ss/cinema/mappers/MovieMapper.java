package com.ss.cinema.mappers;

import java.util.List;

import com.ss.cinema.dto.movieDTO;

public interface MovieMapper {

	// 영화 리스트 정보 가져오기
	List<movieDTO> getMovieListInfo();

	// 영화 상세 정보 가져오기
	movieDTO getMovieDetailInfo(movieDTO movieDTO);
	

}
