package com.ss.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CardDTO {
	  private int cardNo;				// 카드사 NO(PK)
	  private String cardCompanyName;	// 카드사 이름
	  private int cardDiscount;			// 할인율
	  private String cardImage;			// 카드 아이콘
}
