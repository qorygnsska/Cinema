package com.ss.cinema.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ss.cinema.dto.JunPaymentProductDTO;
import com.ss.cinema.dto.PaymentDTO;

public interface PaymentProductMapper {
    
    
    
    // 결제 정보 삽입
    void insertPaymentData(PaymentDTO paymentDTO);

    // 장바구니 상태 업데이트
    void updateBasketStatus(List<Long> basketNos);

    // 결제된 제품 정보 삽입
    void insertPaymentProduct(JunPaymentProductDTO paymentProduct);

    
}
