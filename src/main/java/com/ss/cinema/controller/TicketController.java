package com.ss.cinema.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.service.TicketService;

@Controller
public class TicketController {

	@Autowired
	private TicketService ticketService;
	
	@RequestMapping("/ticket/ticket")
	public String ticketMenu(Model model, CinemaDTO cinemaDTO, TheaterDTO theaterDTO) {
		System.out.println("TicketController ticketMenu");
		
		
		// 예매율 순
		List<movieDTO> movieList = ticketService.getMovieList(cinemaDTO);
		System.out.println(movieList);
		// 상영관 리스트
		List<CinemaDTO> cinemaList = ticketService.getLocalList(movieList);
		System.out.println(cinemaList);
		
		model.addAttribute("movieList", movieList);
		model.addAttribute("cinemaList", cinemaList);
		
		return "ticket/ticket";
	}
	
	
	@RequestMapping("/d")
	public String ticketSeate(Model model, CinemaDTO cinemaDTO, TheaterDTO TheaterDTO) {
		
		
		
		
		return "ticket/ticketSeat";
	}
}
