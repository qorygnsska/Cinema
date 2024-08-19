package com.ss.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JunPaymentProductDTO {
	    
	    private Long paymentProductNo;          // 제품 결제 내역 NO(PK)
	    private Long paymentProductPaymentNo;   // 결제 내역 NO(RF)
	    private Long paymentProductBasketNo;    // 장바구니 NO(RF)
}
