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
	public String main(Locale locale, Model model) {
		return "/common/main";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		model.addAttribute("main", "member/login");
		return "/member/login";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		model.addAttribute("main", "member/join");
		return "/member/join";
	}

}