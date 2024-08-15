package com.ss.cinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.service.JunBasketService;

@Controller
@RequestMapping("/basket")
public class BasketPayController {
	   @Autowired
	    private BasketPayController BasketPayController;
	   
	   @RequestMapping("/basketPay")
	    public String basketPaybasketPay() {
	        return "basket/basketPay";
	    }
}
