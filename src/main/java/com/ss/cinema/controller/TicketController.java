package com.ss.cinema.controller;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.service.TicketService;

@Controller
public class TicketController {

	@Autowired
	private TicketService ticketService;
	
	
	

	@RequestMapping("/ticket")
	public String ticketMenu(Model model, CinemaDTO cinemaDTO, TheaterDTO theaterDTO) {
		System.out.println("TicketController ticketMenu");

		return "ticket/ticket";
	}
	
	
	

	@RequestMapping("/f")
	public String ticketSeate(Model model, CinemaDTO cinemaDTO, TheaterDTO TheaterDTO) {

		return "ticket/ticketSeat";
	}
	
	
	

	// 영화 리스트 ajax
	@RequestMapping("/ticket/movieList")
	@ResponseBody
	public List<movieDTO> movieList(Model model, @RequestBody List<Map<String, Object>> menuList) {
		System.out.println("TicketController movieList");
		
	
		
		List<movieDTO> movieList = ticketService.getMovieList(menuList);
		
		System.out.println("movieList : " + movieList);
		
		return movieList;
	}
	
	
	
	

	
	//영화관 리스트 ajax
	@RequestMapping("/ticket/cinemaList")
	@ResponseBody
	public List<CinemaDTO> cinemaList(Model model, @RequestBody List<movieDTO> movieList) { 	 
		System.out.println("TicketController cinemaList");
 
		List<CinemaDTO> cinemaList = ticketService.getCinemaList(movieList);
 
		System.out.println("cinemaList : " + cinemaList);
		
		return cinemaList; 
	}
	
	

	
	
	//영화관 날짜 리스트 ajax
	@RequestMapping("/ticket/cinemaDateList")
	@ResponseBody
	public List<TheaterDTO> getCinemaDateList(Model model, @RequestBody List<movieDTO> movieList) { 	 
		System.out.println("TicketController getCinemaDateList");
 
		List<TheaterDTO> cinemaDateList = ticketService.getCinemaDateList(movieList);
		System.out.println("cinemaDateList: " + cinemaDateList);
		return cinemaDateList; 
	}
	 
}
