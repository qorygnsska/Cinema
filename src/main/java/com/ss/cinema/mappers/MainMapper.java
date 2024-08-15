package com.ss.cinema.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.EventDTO;
import com.ss.cinema.dto.movieDTO;

@Mapper
public interface MainMapper {

//	예매율 순으로 영화 10개 목록 가져오기
	List<movieDTO> getReserveTop();

//	상영예정일 순으로 영화 10개 목록 가져오기
	List<movieDTO> getScheduledRelease();

//	이벤트 리스트 가져오기
	List<EventDTO> getEventList();

//	회원의 장바구니의 총 개수 가져오기
	Integer countBasket(String sessionId);

}
