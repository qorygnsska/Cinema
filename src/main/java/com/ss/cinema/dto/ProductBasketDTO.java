package com.ss.cinema.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ProductBasketDTO {
    private int productBasketNo;         // 제품 장바구니 번호 (Primary Key)
    private int productBasketMemberId;   // 회원 ID (Foreign Key)
    private int productBasketProductNo;  // 제품 번호 (Foreign Key)
    private int productBasketCount;      // 제품 수량
}
