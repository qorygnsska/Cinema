package com.ss.cinema.mappers;

import java.util.List;

import com.ss.cinema.dto.movieDTO;

public interface MovieMapper {

	// 영화 제목, 이미지 가져오기
	List<movieDTO> getMovieListInfo();
	

}
