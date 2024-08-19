package com.ss.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ss.cinema.dto.JunPaymentProductDTO;
import com.ss.cinema.dto.PaymentDTO;
import com.ss.cinema.mappers.PaymentProductMapper;

@Service
public class PaymentProductService {

	   @Autowired
	    private PaymentProductMapper PaymentProductMapper;

	    @Transactional
	    public void processPayment(PaymentDTO paymentDTO, List<Long> basketNos) {
	        // 1. 결제 정보 저장
	    	PaymentProductMapper.insertPaymentData(paymentDTO);

	        // 2. 장바구니 상태 업데이트
	    	PaymentProductMapper.updateBasketStatus(basketNos);

	        // 3. 결제된 제품 정보 저장
	        for (Long basketNo : basketNos) {
	            JunPaymentProductDTO paymentProduct = new JunPaymentProductDTO();
	            paymentProduct.setPaymentProductPaymentNo(paymentDTO.getPaymentNo());
	            paymentProduct.setPaymentProductBasketNo(basketNo);
	            PaymentProductMapper.insertPaymentProduct(paymentProduct);
	        }
	    }


	            // 결제 취소 관련 로직 추가 가능
	        
	    
}
