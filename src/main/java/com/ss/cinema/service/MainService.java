package com.ss.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.EventDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.mappers.MainMapper;

@Service
public class MainService {

	@Autowired
	private MainMapper mapper;

//	예매율 순 10개의 영화 목록 가져오기
	public List<movieDTO> getReserveTop() {
		return mapper.getReserveTop();
	}

//	상영 예정인 영화 목록 10개 가져오기
	public List<movieDTO> getScheduledRelease() {
		return mapper.getScheduledRelease();
	}

//	이벤트 배너의 이벤트 리스트 가져오기
	public List<EventDTO> getEvent() {
		return mapper.getEventList();
	}

//	회원의 장바구니의 갯수 가져오기
	public Integer countBasket(String sessionId) {
		return mapper.countBasket(sessionId);
	}
	
}
