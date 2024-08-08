package com.ss.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
