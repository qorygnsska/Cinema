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
    	System.out.println("MovieService 안 getMovieTitlesAndImages() 실행");
        
    	return movieMapper.getMovieListInfo();
    }

}
