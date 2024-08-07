package com.ss.cinema.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.MyProductDTO;
import com.ss.cinema.mappers.mypage.myProductMapper;

@Service
public class myProductService {
	@Autowired
	myProductMapper myProductmapper;

	// 상품 결제내역 가져오기
	public List<MyProductDTO> getProPayment(String id) {
		
		return myProductmapper.getProPayment(id);
		
	}
	
	// 페이지당 상품 결제내역 가져오기
	public List<MyProductDTO> getPageProPayment(int page, int pageSize, String sessionId) {
		int limit = pageSize;
		int offset = (page - 1) * pageSize;
		return myProductmapper.getPageProPayment(limit, offset, sessionId);
	}

}
