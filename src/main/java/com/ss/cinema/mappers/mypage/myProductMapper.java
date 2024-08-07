package com.ss.cinema.mappers.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ss.cinema.dto.MyProductDTO;

@Mapper
public interface myProductMapper {
	
	// 상품 결제내역 가져오기
	List<MyProductDTO> getProPayment(String id);
	
	// 페이지당 상품 결제내역 가져오기
	List<MyProductDTO> getPageProPayment(@Param("limit") int limit, @Param("offset") int offset, @Param("id") String id);
}
