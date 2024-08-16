package com.ss.cinema.mappers;

import com.ss.cinema.dto.JunBasketDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface JunBasketMapper {

    // 특정 회원의 장바구니 항목들을 조회
    List<JunBasketDTO> selectBasketItemsByMemberId(String memberId);

    // 장바구니 항목을 삭제
    void deleteBasketItemBySessionAndBasketNo(Map<String, Object> params);

    // 자식 테이블의 레코드를 삭제하는 메서드
    void deleteChildRecordsByBasketNo(@Param("basketNo") int basketNo);
    
    // 부모 테이블(BASKET)의 레코드를 삭제하는 메서드
    void deleteBasketItemBySessionAndBasketNo(@Param("sessionId") String sessionId, @Param("basketNo") int basketNo);
   
        void updateBasketQuantity(@Param("basketNo") Long basketNo, @Param("quantity") int quantity);
    
   
        // 자식 테이블(PAYMENT_PRODUCT)에서 해당 BASKET_NO와 관련된 레코드를 삭제
        void deletePaymentProductsByBasketNos(int basketNo);

        // 부모 테이블(BASKET)에서 해당 세션과 BASKET_NO에 해당하는 레코드를 삭제
        void deleteBasketItemBySessionAndBasketNos(Map<String, Object> params);    
        
        
        
        
        
        
        
        
}