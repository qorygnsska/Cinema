package com.ss.cinema.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TheaterDTO {
	private int theaterNo; 			// 상영관 NO(PK)
	private Date theaterStartTime; 	// 시작시간
	private Date theaterEndTime; 	// 종료시간
	private String theaterName; 	// 몇관
	private int theaterCinemaNo; 	// 영화관 NO(RF)
}