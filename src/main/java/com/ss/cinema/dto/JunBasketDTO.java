package com.ss.cinema.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JunBasketDTO {
    private Long basketNo;          // 장바구니 NO
    private Long basketProductNo;   // 제품 NO
    private int basketCount;        // 제품 수량
    private String basketMemberId;  // 회원 ID
    private char basketStatus;      // 장바구니 상태(결제 여부)
    private ProductDTO product; // 연관된 Product 정보를 포함
    private MemberDTO memberId;
}
