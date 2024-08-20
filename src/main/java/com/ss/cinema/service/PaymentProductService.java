package com.ss.cinema.service;

import java.util.List;
import java.util.Map;

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


		public void updateBasketStatus(int basketNo) {
			System.out.println("updateBasketStatus 탐 2 "  + basketNo);
			
			PaymentProductMapper.updateBasketStatus(basketNo);
			
		}

		public void insertPayment(Map<String, Object> dbMap) {
			System.out.println("insertPayment 탐");
			System.out.println("insertPayment data : " + dbMap);
			PaymentProductMapper.insertPayment(dbMap);
			
		}
		
		public PaymentDTO selectPaymentNo(Map<String, Object> dbMap) {
			System.out.println("selectPaymentNo 탐");
			System.out.println("selectPaymentNo??? : " + dbMap);
			return PaymentProductMapper.selectPaymentNo(dbMap);
			
		}

		public void insertPaymentProduct(Map<String, Object> map) {
			System.out.println("insertPaymentProduct 탐");
			PaymentProductMapper.insertPaymentProduct(map);
		}


	        
	    
}
