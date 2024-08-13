package com.ss.cinema.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;


@Data
@NoArgsConstructor
@AllArgsConstructor

public class ProductDTO {
    private int productNo;               // 제품 NO(PK)
    private String productCode;          // 제품 코드
    private int productPrice;            // 제품 가격
    private String productName;          // 제품 이름
    private String productOrigin;        // 제품 원산지
    private String productImage;         // 제품 이미지
    private String productContent;		 // 제품 내용
    
    private MultipartFile productImageFile; // 업로드된 이미지 파일을 저장
}
