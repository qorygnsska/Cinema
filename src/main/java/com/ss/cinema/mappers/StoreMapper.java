package com.ss.cinema.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.ProductDTO;

@Mapper
public interface StoreMapper {
	
	// 스토어 리스트 정보 가져오기
	List<ProductDTO> getStoreListInfo();

}
