package com.ss.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.mappers.StoreMapper;

@Service
public class StoreService {
	
	@Autowired
	private StoreMapper storeMapper;
	
	// 스토어 리스트 팝콘 정보 가져오기
	public List<ProductDTO> getStoreListInfo(){
		System.out.println("StoreService 안 getStoreListInfo() 실행");
		
		return storeMapper.getStoreListInfo();
	}
	
	// 스토어 상세 정보 가져오기
	public ProductDTO getStoreDetailInfo(ProductDTO productDTO) {
		System.out.println("StoreService 안 getStoreDetailInfo() 실행");
		
		return storeMapper.getStoreDetailInfo(productDTO);
	}
	
//	// 멤버 id 가져오기
//	public MemberDTO getMemberById(String memId) {
//
//		return storeMapper.getMemberById(memId);
//	}

}
