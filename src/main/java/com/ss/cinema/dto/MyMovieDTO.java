package com.ss.cinema.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyMovieDTO {
	
	private int movieNo;			// 영화번호
	private String movieTitle;		// 영화제목
	private String movieImage;		// 영화사진
	private Date cinemaScreenDate;	// 상영일
	private Date theaterStartTime;	// 시작시간
	private Date theaterEndTime;	// 종료시간
	private String cinemaRlg;		// 시 이름
	private String cinemaBlg;		// 구 이름
	private int theaterNO; 			// 관 번호
	private String theaterName;		// 관 이름
	private String ticketSeat;		// 좌석
	private int ticketNo;			// 티켓번호
	private int ticketTeen;			// 청소년 수
	private int ticketAdult;		// 일반 수
	private int ticketSenior;		// 우대 수
	private int ticketCoupon;		// 쿠폰 사용 개수
	private int paymentNo;			// 결제번호
	private String paymentType;		// 결제수단
	private int paymentPrice;		// 결제금액
	private Date paymentDate;		// 결제일
	private String paymentImpUid;	// 아임포트 uid
}


