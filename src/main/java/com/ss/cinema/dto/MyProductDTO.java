package com.ss.cinema.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyProductDTO {
	
	private int paymentNo;				// 주문번호
	private Date paymentDate;			// 결제일
	private int paymentPrice;			// 총액
	private String paymentType;			// 결제수단
	private int productNo;				// 상품번호
	private String productImage;  		// 상품사진
	private String productName;			// 상품제목
	private String productInfo;			// 상품 상세정보
	private int totalCount;				// 총 수량
	
	
}
