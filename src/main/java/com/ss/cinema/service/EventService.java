package com.ss.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.EventDTO;
import com.ss.cinema.mappers.EventMapper;

@Service
public class EventService {
	
	@Autowired
	private EventMapper eventMapper;
	
	// 이벤트 리스트 정보 가져오기
	public List<EventDTO> getEventListInfo(){
		System.out.println("eventService 안 getEventListInfo() 실행");
		
		return eventMapper.getEventListInfo();
	}
	
	
	// 이벤트 상세 정보 가져오기
	public EventDTO getEventDetailInfo(EventDTO eventDTO) {
		System.out.println("EventService 안 getEventDetailInfo() 실행");
		
		return eventMapper.getEventDetailInfo(eventDTO);
	}

}
