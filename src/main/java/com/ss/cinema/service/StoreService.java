package com.ss.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.BasketDTO;
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

	// 장바구니 데이터 보내기
	public void addProductToBasket(BasketDTO basketDTO) {
		System.out.println("StoreService 안 getStoreDetailInfo() 실행");
		System.out.println("basketDTO : " + basketDTO);
		
		int result = storeMapper.insertBasket(basketDTO);
		
		if(result > 0) {
	        System.out.println("장바구니에 성공적으로 추가되었습니다.");
	    } else {
	        System.out.println("장바구니 추가에 실패했습니다.");
	    }
	}
	
	// 멤버 id 가져오기
//	public MemberDTO getMemberById(String memId) {
//
//		return storeMapper.getMemberById(memId);
//	}

}
