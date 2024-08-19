package com.ss.cinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.JunPaymentProductDTO;
import com.ss.cinema.dto.PaymentDTO;
import com.ss.cinema.mappers.PaymentProductMapper;

@Service
public class PaymentProductService {

	   @Autowired
	    private PaymentProductMapper PaymentProductMapper;

	   public void savePayment(PaymentDTO paymentDTO) {
	        PaymentProductMapper.insertPayment(paymentDTO);
	    }

	    public int verifyPayment(String impUid) {
	        PaymentDTO payment = PaymentProductMapper.selectPaymentByImpUid(impUid);
	        return payment != null ? payment.getPaymentPrice() : 0;
	    }

	    public void savePaymentData(List<JunPaymentProductDTO> paymentProductDTOList) {
	        for (JunPaymentProductDTO paymentProduct : paymentProductDTOList) {
	            PaymentProductMapper.insertPaymentProduct(paymentProduct);
	            PaymentProductMapper.updateBasketStatus(paymentProduct.getPaymentProductBasketNo(), 'Y');
	        }
	    }

	    public PaymentDTO getPaymentById(Long paymentNo) {
	        return PaymentProductMapper.selectPaymentById(paymentNo);
	    }

	    public List<JunPaymentProductDTO> getPaymentProducts(Long paymentNo) {
	        return PaymentProductMapper.selectPaymentProductsByPaymentNo(paymentNo);
	    }

	    public void savePaymentProduct(JunPaymentProductDTO junPaymentProductDTO) {
	        PaymentProductMapper.insertPaymentProduct(junPaymentProductDTO);
	    }

	    public void updateBasketStatus(Long basketNo, char status) {
	        PaymentProductMapper.updateBasketStatus(basketNo, status);
	    }


	            // 결제 취소 관련 로직 추가 가능
	        
	    
}
