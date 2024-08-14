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
	
	// 결제내역 지우기
	void deletePayment(int pno);
	
	// 티켓내역 지우기
	void deleteTicket(int tno);
	
	// 좌석삭제
	void deleteSeat(@Param("row") int row, @Param("col") int col, @Param("theater") int theater);

}
