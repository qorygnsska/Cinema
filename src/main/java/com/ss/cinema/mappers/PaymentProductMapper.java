package com.ss.cinema.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ss.cinema.dto.JunPaymentProductDTO;
import com.ss.cinema.dto.PaymentDTO;

public interface PaymentProductMapper {
    
    
    
    // 결제 내역 저장
    void insertPayment(PaymentDTO paymentDTO);
    
    // 결제 정보 조회 (IMP_UID로)
    PaymentDTO selectPaymentByImpUid(String impUid);

    // 결제 내역 ID로 결제 정보 조회
    PaymentDTO selectPaymentById(Long paymentNo);

    // 결제 내역 ID로 결제된 상품 리스트 조회
    List<JunPaymentProductDTO> selectPaymentProductsByPaymentNo(Long paymentNo);

    // 제품 결제 내역 저장
    void insertPaymentProduct(JunPaymentProductDTO junPaymentProductDTO);

    // 장바구니 상태 업데이트
    void updateBasketStatus(Long basketNo, char status);
    
}
