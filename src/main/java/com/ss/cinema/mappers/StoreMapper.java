package com.ss.cinema.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.BasketDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.ProductDTO;

@Mapper
public interface StoreMapper {
	
	// 스토어 리스트 팝콘 정보 가져오기
	List<ProductDTO> getStoreListInfo();
	
	// 스토어 상세 정보 가져오기
	ProductDTO getStoreDetailInfo(ProductDTO productDTO);
	
	// 같은 상품이 장바구니에 있는지 확인
	int checkBasket(BasketDTO basketDTO);

	// 장바구니 데이터 보내기
	int insertBasket(BasketDTO basketDTO);
	
	// 장바구니 수량 업데이트
	int updateBasketCount(BasketDTO basketDTO);
	
	
	// 멤버 id 가져오기
//	MemberDTO getMemberById(String memId);

}
