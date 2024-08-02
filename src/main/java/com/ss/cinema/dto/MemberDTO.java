package com.ss.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDTO {

	private String memberId;		// 회원 ID(PK)
	private String memberName;		// 회원 이름
	private String memberPassword;	// 비번
	private char memberGender;		// 성별
	private String mebmerJumin;		// 주민번호
	private String memberPhone;		// 전화번호
	private String memberEmail;		// 이메일
	private int memberCoupon;		// 쿠폰
	private char memberAdmin;		// 어드민 여부
	private int memberStamp;		// 스탬프

}
