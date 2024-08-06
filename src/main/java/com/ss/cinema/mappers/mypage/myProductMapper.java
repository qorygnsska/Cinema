package com.ss.cinema.mappers.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.MyProductDTO;

@Mapper
public interface myProductMapper {
	
	// 상품 결제내역 가져오기
	List<MyProductDTO> getProPayment(String id);
}
