package com.ss.cinema;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		return "home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		model.addAttribute("main", "member/login");
		return "home";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		model.addAttribute("main", "member/join");
		return "home";
	}
	
	@RequestMapping(value = "/movieList", method = RequestMethod.GET)
	public String movieList(Locale locale, Model model) {
		model.addAttribute("main", "movie/movieList");
		return "home";
	}
<<<<<<< HEAD
=======
	
	@RequestMapping(value = "/ticket", method = RequestMethod.GET)
	public String ticket(Locale locale, Model model) {
		model.addAttribute("main", "ticket/ticket");
		return "home";
	}
>>>>>>> 5641835ec7a81e08930321d52ea7166fba89766f
}