package com.ss.cinema.mappers.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ss.cinema.dto.MyMovieDTO;

@Mapper
public interface myMovieMapper {
	
	// 영화 예매내역 가져오기
	List<MyMovieDTO> getMoviePayment(String id);
	
	// 페이지별 영화 예매내역 가져오기
	List<MyMovieDTO> getPageMoviePayment(@Param("limit") int limit, @Param("offset") int offset, @Param("id") String id);

	void writeReview(@Param("movieNo") int movieNo, @Param("star") int star, @Param("reContent") String reContent, @Param("id") String id);

}
