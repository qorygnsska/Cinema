package com.ss.cinema.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EventController {
	
	@RequestMapping("/eventList")
	public String eventList() {
		System.out.println("EventController 안 eventList() 실행");
		
		return "event/eventList";
	}
	
	@RequestMapping("/eventDetail")
	public String eventDetail() {
		System.out.println("EventController 안 eventDetail() 실행");
		
		return "event/eventDetail";
	}

}
