package com.ss.cinema;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ss.cinema.dto.EventDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.key.appKey;
import com.ss.cinema.service.MainService;
import com.ss.cinema.service.mypage.myStampService;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private MainService mainService;
	
	@Autowired
	private myStampService stampService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Locale locale, HttpSession session, Model model) {
		List<EventDTO> eventList = mainService.getEvent();
		List<movieDTO> list = mainService.getReserveTop();
		model.addAttribute("eventList", eventList);
		model.addAttribute("movieChartList", list);
		
		List<movieDTO> trailerList = new ArrayList();
		trailerList.add(list.get(0));
		trailerList.add(list.get(1));
		trailerList.add(list.get(2));
		model.addAttribute("trailerList", trailerList);
		if(session.getAttribute("sessionId") != null) {
			String id = (String) session.getAttribute("sessionId");
			Integer countBasket = mainService.countBasket(id);
			if(countBasket != null && countBasket > 0) {
				session.setAttribute("countBasket", countBasket);
			}else {
				session.removeAttribute("countBasket");
			}
			MemberDTO member = stampService.getStmap(id);
			model.addAttribute("member", member);
		}
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
	
	@RequestMapping(value = "/termsOfUse", method = RequestMethod.GET)
	public String termsOfUse(Locale locale, Model model) {
		return "/common/termsOfUse";
	}
	
	@RequestMapping(value = "/privacyPolicy", method = RequestMethod.GET)
	public String privacyPolicy(Locale locale, Model model) {
		return "/common/privacyPolicy";
	}
	
}