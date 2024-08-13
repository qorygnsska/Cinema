package com.ss.cinema.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.EventDTO;
import com.ss.cinema.dto.ProductDTO;

@Mapper
public interface EventMapper {
	
	// 이벤트 리스트 정보 가져오기
	List<EventDTO> getEventListInfo();
	
	// 스토어 상세 정보 가져오기
	EventDTO getEventDetailInfo(EventDTO eventDTO);
	

}
