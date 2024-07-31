package com.ss.cinema.service;

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
	
	public List<movieDTO> getMovieList(Map<String, String> menuMap) {
		System.out.println("TicketService getMovieList");
		
		return ticketMapper.getMovieList(menuMap);
	}

	public List<CinemaDTO> getCinemaList(List<movieDTO> movieList) {
		System.out.println("TicketService getLocalList");
		
		return ticketMapper.getCinemaList(movieList);
	}

}
