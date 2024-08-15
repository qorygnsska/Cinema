package com.ss.cinema.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.ProductDTO;

@Mapper
public interface StoreMapper {
	
	// 스토어 리스트 팝콘 정보 가져오기
	List<ProductDTO> getStoreListInfo();
	
	// 스토어 상세 정보 가져오기
	ProductDTO getStoreDetailInfo(ProductDTO productDTO);
	
	// 멤버 id 가져오기
//	MemberDTO getMemberById(String memId);

}
