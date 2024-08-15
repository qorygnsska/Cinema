package com.ss.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BasketDTO {
	private int basketNo;				// 장바구니 NO
	private int basketProductNo;		// 제품 NO
	private int basketCount;			// 제품 수량
	private String basketMemberId;		// 회원 ID
	private String basketStatusChar;	// 장바구니 상태(결제여부)

}
