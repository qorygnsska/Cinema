package com.ss.cinema.mappers;

import com.ss.cinema.dto.JunBasketDTO;
import com.ss.cinema.dto.MemberDTO;

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



    
    
    // 자식 테이블(PAYMENT_PRODUCT)에서 해당 BASKET_NO와 관련된 레코드를 삭제
    void deletePaymentProductsByBasketNos(int basketNo);

    // 부모 테이블(BASKET)에서 해당 세션과 BASKET_NO에 해당하는 레코드를 삭제
    void deleteBasketItemBySessionAndBasketNos(Map<String, Object> params);    

    // 특정 회원의 정보를 조회하는 메서드
    MemberDTO getMemberInfo(String memberId); 
    //장바구니 수량 업데이트
    void updateBasketQuantity(@Param("basketNo") Long basketNo, @Param("basketCount") int basketCount);
    /**
     * 선택된 장바구니 항목을 basketNos를 기준으로 조회합니다.
     * @param basketNos 조회할 장바구니 번호 목록
     * @return 장바구니 항목 리스트
     */
    List<JunBasketDTO> getBasketItemsByBasketNos(@Param("basketNos") List<Long> basketNos);
}
        
        
