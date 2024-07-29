package com.ss.cinema.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CinemaDTO {
	private int cinemaNo;				// 영화관 No(PK)
	private String cinemaRLG;			// 광역자치단체
	private String cinemaBLG;			// 기초자치단체
	private int cinemaMovieNo;			// 영화 No(RF)
	private Date cinemaScreenDatee;		// 상영날짜
}
