package com.ss.cinema;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.cinema.dto.EventDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.key.appKey;
import com.ss.cinema.service.MainService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
//		List<movieDTO> reserveTopMovieList = mainService.getReserveTop();
//		System.out.println(reserveTopMovieList);
		List<EventDTO> eventList = mainService.getEvent();
		model.addAttribute("eventList", eventList);
		return "/common/main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		appKey appKey = new appKey();
		model.addAttribute("naverUrl", appKey.getNaver_href());
		model.addAttribute("kakaoUrl", appKey.getKakao_href());
		model.addAttribute("googleUrl", appKey.getGoogle_href());
		
		return "/member/login";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		return "/member/joinTos";
	}
	
	@RequestMapping(value = "/joinOk", method = RequestMethod.GET)
	public String joinOk(Locale locale, Model model) {
		return "/member/join";
	}
	
	@RequestMapping(value = "/scheduledRelease", method = RequestMethod.GET)
	public String scheduledRelease(Locale locale, Model model) {
		List<movieDTO> scheduledRelease = mainService.getScheduledRelease();
		model.addAttribute("scheduledRelease", scheduledRelease);
		return "/common/main";
	}

}