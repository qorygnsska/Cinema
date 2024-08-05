package com.ss.cinema.controller;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
	
	
	// 예매 메뉴 선택 화면
	@RequestMapping("/ticket")
	public String ticketMenu(Model model, CinemaDTO cinemaDTO, TheaterDTO theaterDTO) {
		System.out.println("TicketController ticketMenu");
		
		model.addAttribute("ticketPage", "ticketMenu");

		return "ticket/ticket";
	}
	
	
	
	// 좌석 선택 화면
	@RequestMapping("/ticket/seat")
	public String ticketSeate(Model model, @ModelAttribute movieDTO movieDTO , @ModelAttribute CinemaDTO cinemaDTO, @ModelAttribute TheaterDTO TheaterDTO,
								String cinemaLocation, String screenDate, String theaterTime) {
		
		model.addAttribute("ticketPage", "ticketSeat");
		model.addAttribute("cinemaLocation", cinemaLocation);
		model.addAttribute("screenDate", screenDate);
		model.addAttribute("theaterTime", theaterTime);
		
		return "ticket/ticket";
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
	public List<CinemaDTO> cinemaList(Model model, @RequestBody List<Map<String, Object>> menuList) { 	 
		System.out.println("TicketController cinemaList");
 
		List<CinemaDTO> cinemaList = ticketService.getCinemaList(menuList);
 
		System.out.println("cinemaList : " + cinemaList);
		
		return cinemaList; 
	}
	
	

	
	
	//영화관 날짜 리스트 ajax
	@RequestMapping("/ticket/cinemaDateList")
	@ResponseBody
	public List<CinemaDTO> getCinemaDateList(Model model, @RequestBody List<Map<String, Object>> menuList) { 	 
		System.out.println("TicketController getCinemaDateList");
 
		List<CinemaDTO> cinemaDateList = ticketService.getCinemaDateList(menuList);
		System.out.println("cinemaDateList: " + cinemaDateList);
		return cinemaDateList; 
	}
	
	
	
	
	//상영관 리스트 ajax
	@RequestMapping("/ticket/theaterList")
	@ResponseBody
	public List<TheaterDTO> getTheaterList(Model model, @RequestBody List<Map<String, Object>> menuList) { 	 
		System.out.println("TicketController getTheaterList");
 
		List<TheaterDTO> theaterList = ticketService.getTheaterList(menuList);
		System.out.println("getTheaterList: " + theaterList);
		return theaterList; 
	}
	 
}
