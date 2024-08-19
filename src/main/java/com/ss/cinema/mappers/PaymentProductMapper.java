package com.ss.cinema.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ss.cinema.dto.JunPaymentProductDTO;
import com.ss.cinema.dto.PaymentDTO;
@Mapper
public interface PaymentProductMapper {
    
    
  
	void updateBasketStatus(int basketNo);

	void insertPayment(Map<String, Object> dbMap);
	
	PaymentDTO selectPaymentNo(Map<String, Object> dbMap);

	void insertPaymentProduct(Map<String, Object> map);


	

    
}
