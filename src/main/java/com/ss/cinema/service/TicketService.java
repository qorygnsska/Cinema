package com.ss.cinema.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.mappers.TicketMapper;

@Service
public class TicketService {

	@Autowired
	private TicketMapper ticketMapper;
	
	// 영화 리스트 Mapper
	public List<movieDTO> getMovieList(List<Map<String, Object>> menuList) {
		System.out.println("TicketService getMovieList");
		
		// HashMap으로 초기화
        Map<String, Object> menuHashMap = new HashMap<>();
        
        for(Map<String, Object> map : menuList) {
        	for(Map.Entry<String, Object> entry : map.entrySet()) {
        		if(entry.getValue().toString().isEmpty()) {
        			menuHashMap.put(entry.getKey(), null);
        		}else {
        			menuHashMap.put(entry.getKey(), entry.getValue());
        		}
        		
        	}
        }
        
        
		System.out.println("TicketController movieList menuListMap : " + menuHashMap);
		
		return ticketMapper.getMovieList(menuHashMap);
	}

	// 영화관 리스트 Mapper
	public List<CinemaDTO> getCinemaList(List<movieDTO> movieList) {
		System.out.println("TicketService getCinemaList");
		
		return ticketMapper.getCinemaList(movieList);
	}

	
	// 영화관 날짜 리스트 Mapper
	public List<TheaterDTO> getCinemaDateList(List<movieDTO> movieList) {
		System.out.println("TicketService getCinemaDateList");
		
		return ticketMapper.getCinemaDateList(movieList);
	}



}
