package com.ss.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SeatDTO {
	private int seatNo; 			// 좌석 NO
	private int seatTheaterNo; 		// 상영관 NO
	private int seatRow;			// 행
	private int seatCol;			// 열
}
