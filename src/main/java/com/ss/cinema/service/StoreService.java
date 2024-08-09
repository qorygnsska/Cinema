package com.ss.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.mappers.StoreMapper;

@Service
public class StoreService {
	
	@Autowired
	private StoreMapper storeMapper;
	
	// 스토어 리스트 정보 가져오기
	public List<ProductDTO> getStoreListInfo(){
		System.out.println("StoreService 안 getStoreListInfo() 실행");
		
		return storeMapper.getStoreListInfo();
	}

}
