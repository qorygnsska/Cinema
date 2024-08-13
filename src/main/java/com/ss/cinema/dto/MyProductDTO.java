package com.ss.cinema.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyProductDTO {
	
	private int productPayNo;			// 주문번호
	private int productNo;				// 상품번호
	private String productName;			// 상품이름
	private String productImage;  		// 상품사진
	private int basketCount;			// 수량
	private int paymentPrice;			// 총액
	private String paymentType;			// 결제수단
	private String cardCompanyName;		// 카드사명
	private Date paymentDate;			// 결제일
}
