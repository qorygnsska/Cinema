package com.ss.cinema.controller;

import java.util.List;

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
	
	@RequestMapping("/")
	public String ticketMenu(Model model, CinemaDTO cinemaDTO, TheaterDTO theaterDTO) {
		System.out.println("TicketController ticketMenu");
		
		// 페이지 전환 시
		List<movieDTO> movieList = ticketService.getMovieList(cinemaDTO);
		
		model.addAttribute("movieList",movieList);
		
		return "ticket/ticket";
	}
	
}
