package com.ss.cinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.dto.EventDTO;
import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.service.EventService;
import com.ss.cinema.service.StoreService;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	
	@RequestMapping("/eventList")
	public String eventList(Model model) {
		System.out.println("EventController 안 eventList() 실행");
		
		// 스토어 리스트 정보 가져오기
		List<EventDTO> eventList = eventService.getEventListInfo();
		System.out.println(eventList);
		model.addAttribute("eventList", eventList);
		
		return "event/eventList";
	}
	
	@RequestMapping("/eventDetail")
	public String eventDetail(Model model, EventDTO eventDTO) {
		System.out.println("EventController 안 eventDetail() 실행");
		
		// 스토어 상세 정보 가져오기
		EventDTO event = eventService.getEventDetailInfo(eventDTO);
		System.out.println("event : " + event );
		model.addAttribute("event", event);
		
		return "event/eventDetail";
	}

}
