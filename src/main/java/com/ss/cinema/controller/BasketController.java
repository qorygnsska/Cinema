package com.ss.cinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.service.BasketService;

@Controller
@RequestMapping("/basket")
public class BasketController {
	   @Autowired
	    private BasketService BasketService;
	   
	   @RequestMapping("/basketMain")
	    public String basketMain() {
	        return "basket/basketMain";
	    }
	   
	   
	   
}
