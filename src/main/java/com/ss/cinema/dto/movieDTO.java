package com.ss.cinema.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class movieDTO {
	private	int movieNo; 				// 영화 NO(PK)
	private String movieTitle;			// 영화제목
	private Date  movieStartDate;		// 개봉일
	private Date movieEndDate;			// 종료일
	private String movieDirector;		// 감독
	private String movieActor;			// 배우
	private String movieGenre;			// 장르
	private String movieAgeLimit;		// 연령제한
	private int movieShowtime;			// 상영시간
	private String movieNationality;	// 국적
	private String movieSummary;		// 줄거리
	private String movieImage;			// 이미지 경로
	private String movieTrailer;		// 예고편
}
