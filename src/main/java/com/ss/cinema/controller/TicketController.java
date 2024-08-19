package com.ss.cinema.controller;



import java.io.IOException;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.SeatDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.key.appKey;
import com.ss.cinema.service.TicketService;



@Controller
@RequestMapping("/ticket")
public class TicketController {

	@Autowired
	private TicketService ticketService;
	
	
	
	// 영화 선택화면
	@RequestMapping("")
	public String ticketMenu(Model model, CinemaDTO cinemaDTO, TheaterDTO theaterDTO) {
		
		model.addAttribute("ticketPage", "ticketMenu");

		return "ticket/ticket";
	}
	
	

	// 좌석 선택 화면
	@RequestMapping("/seat")
	public String ticketSeate(Model model, @ModelAttribute movieDTO movieDTO , @ModelAttribute CinemaDTO cinemaDTO, @ModelAttribute TheaterDTO theaterDTO,
								String cinemaLocation, String screenDate, String theaterTime) {

		model.addAttribute("ticketPage", "ticketSeat");
		model.addAttribute("cinemaLocation", cinemaLocation);
		model.addAttribute("screenDate", screenDate);
		model.addAttribute("theaterTime", theaterTime);
		
		
		return "ticket/ticket";
	}
	
	
	// 결제 선택 화면
	@RequestMapping("/pay")
	public String ticketPay(Model model, @ModelAttribute movieDTO movieDTO , @ModelAttribute CinemaDTO cinemaDTO, @ModelAttribute TheaterDTO theaterDTO,
								String cinemaLocation, String screenDate, String theaterTime, 
								String ticketTeen, String ticketAdult, String ticketSenior, 
								String leftSeatNum, String leftPerson, String ticketPrice,
								HttpSession sesstion) {
		
		
		
		String memId = (String) sesstion.getAttribute("sessionId");
		
		MemberDTO memberDTO = ticketService.getMemberById(memId);
		
		model.addAttribute("memberDTO", memberDTO);
		
		model.addAttribute("ticketPage", "ticketPay");
		model.addAttribute("cinemaLocation", cinemaLocation);
		model.addAttribute("screenDate", screenDate);
		model.addAttribute("theaterTime", theaterTime);
		
		model.addAttribute("ticketTeen", ticketTeen);
		model.addAttribute("ticketAdult", ticketAdult);
		model.addAttribute("ticketSenior", ticketSenior);
		
		
		model.addAttribute("leftSeatNum", leftSeatNum);
		model.addAttribute("leftPerson", leftPerson);
		model.addAttribute("ticketPrice", ticketPrice);
		
		int couponMax = 0;
		
		if(!ticketTeen.isEmpty()) {
			couponMax += Integer.parseInt(ticketTeen);
		}
		
		if(!ticketAdult.isEmpty()) {
			couponMax += Integer.parseInt(ticketAdult);
		}
		
		if(!ticketSenior.isEmpty()) {
			couponMax += Integer.parseInt(ticketSenior);
		}

		
		model.addAttribute("couponMax", Integer.toString(couponMax));

		
		return "ticket/ticket";
	}
	
	
	
	// 결제 완료화면
	@RequestMapping("/ticketEnd")
	public String ticketEnd(Model model) {

		return "ticket/ticketEnd";
	}
	
	
	
	// 영화 리스트 ajax
	@RequestMapping("/movieList")
	@ResponseBody
	public List<movieDTO> movieList(Model model, @RequestBody List<Map<String, Object>> menuList) {
		
		List<movieDTO> movieList = ticketService.getMovieList(menuList);
		
		return movieList;
	}
	
	
	
	

	// 영화관 리스트 ajax
	@RequestMapping("/cinemaList")
	@ResponseBody
	public List<CinemaDTO> cinemaList(Model model, @RequestBody List<Map<String, Object>> menuList) { 	 
 
		List<CinemaDTO> cinemaList = ticketService.getCinemaList(menuList);
		
		return cinemaList; 
	}
	
	
	// 영화관 날짜 리스트 ajax
	@RequestMapping("/cinemaDateList")
	@ResponseBody
	public List<CinemaDTO> getCinemaDateList(Model model, @RequestBody List<Map<String, Object>> menuList) { 	 
 
		List<CinemaDTO> cinemaDateList = ticketService.getCinemaDateList(menuList);
		
		return cinemaDateList; 
	}
	
	
	// 상영관 리스트 ajax
	@RequestMapping("/theaterList")
	@ResponseBody
	public List<TheaterDTO> getTheaterList(Model model, @RequestBody List<Map<String, Object>> menuList) { 	 
 
		List<TheaterDTO> theaterList = ticketService.getTheaterList(menuList);


		return theaterList; 
	}
	
	
	// 좌석 리스트 ajax
	@RequestMapping("/seatList")
	@ResponseBody
	public List<SeatDTO> getSeatList(Model model, @RequestBody Map<String, Object> theater) { 	 

		List<SeatDTO> seatList = ticketService.getSeatList(theater);

		return seatList; 
	}
	
	
	// 멤버 id 체크
	@RequestMapping("/getSessionId")
	@ResponseBody
	public String getSessionId(HttpSession session) { 	 
				
		return (String) session.getAttribute("sessionId"); 
	}
	
	// 좌석 체크
	@RequestMapping("/checkSeat")
	@ResponseBody
	public int checkSeat(Model model, @RequestBody Map<String, Object> insertMap) { 	 
		
		int seatCnt = ticketService.checkSeat(insertMap);
		
		return seatCnt; 
	}
	
	// 티켓 추가
	@RequestMapping("/insertTicket")
	@ResponseBody
	public Map<String, String> insertTicket(Model model, @RequestBody Map<String, Object> insertMap) { 	 
		
		ticketService.insertTicket(insertMap);
		
		return null; 
	}
	
	

}

