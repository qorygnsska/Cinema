package com.ss.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductDTO {
    private int productNo;               // 제품 NO(PK)
    private int productPrice;            // 제품 가격
    private String productName;          // 제품 이름
    private String productOrigin;        // 제품 원산지
    private String productImage;         // 제품 이미지
}
