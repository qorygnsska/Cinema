package com.ss.cinema.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.CardDTO;
import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.SeatDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.mappers.TicketMapper;

@Service
public class TicketService {

	@Autowired
	private TicketMapper ticketMapper;
	
	// 영화 리스트 Mapper
	public List<movieDTO> getMovieList(List<Map<String, Object>> menuList) {
		
		// HashMap으로 초기화
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getMovieList(menuHashMap);
	}

	// 영화관 리스트 Mapper
	public List<CinemaDTO> getCinemaList(List<Map<String, Object>> menuList) {
		
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getCinemaList(menuHashMap);
	}

	
	
	// 영화관 날짜 리스트 Mapper
	public List<CinemaDTO> getCinemaDateList(List<Map<String, Object>> menuList) {
		
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getCinemaDateList(menuHashMap);
	}
	
	public List<TheaterDTO> getTheaterList(List<Map<String, Object>> menuList) {
		
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getTheaterList(menuHashMap);
	}

	private Map<String, Object> MapSet(List<Map<String, Object>> menuList){
		// HashMap으로 초기화
        Map<String, Object> menuHashMap = new HashMap<String, Object>();
        
        for(Map<String, Object> map : menuList) {
        	for(Map.Entry<String, Object> entry : map.entrySet()) {
        		if(entry.getValue().toString().isEmpty()) {
        			menuHashMap.put(entry.getKey(), null);
        		}else {
        			menuHashMap.put(entry.getKey(), entry.getValue());
        		}
        		
        	}
        }
		
        return menuHashMap;
	}
	
	
	// 좌석 리스트
	public List<SeatDTO> getSeatList(Map<String, Object> theaterNo) {
		
		return ticketMapper.getSeatList(theaterNo);
	}

	public List<CardDTO> getCardList() {
		
		return ticketMapper.getCardList();
	}

	public MemberDTO getMemberById(String memId) {
		
		return ticketMapper.getMemberById(memId);
	}


	

}
