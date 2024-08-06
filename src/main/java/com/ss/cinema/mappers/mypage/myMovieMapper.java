package com.ss.cinema.mappers.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.MyMovieDTO;

@Mapper
public interface myMovieMapper {
	
	// 영화 예매내역 가져오기
	List<MyMovieDTO> getMoviePayment(String id);

}
