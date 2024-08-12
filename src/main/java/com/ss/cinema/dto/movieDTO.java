package com.ss.cinema.dto;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class movieDTO {
	private int movieNo; // 영화 NO(PK)
	private String movieTitle; // 영화제목
	private Date movieStartDate; // 개봉일
	private Date movieEndDate; // 종료일
	private String movieDirector; // 감독
	private String movieActor; // 배우
	private String movieGenre; // 장르
	private String movieAgeLimit; // 연령제한
	private int movieShowtime; // 상영시간
	private String movieNationality; // 국적
	private String movieSummary; // 줄거리
	private String movieImage; // 이미지 경로
	private String movieImage2; // 이미지 경로
	private String movieImage3; // 이미지 경로
	private String movieTrailer; // 예고편
	private Double ratingStarAVG; // 별점 평균

	private MultipartFile movieImageFile; // 업로드된 이미지 파일을 저장
	private MultipartFile movieImageFile2; // 추가 이미지 파일을 저장
	private MultipartFile movieImageFile3; // 추가 이미지 파일을 저장
	private MultipartFile movieTrailerFile;// 업로드된 트레일러 파일을 저장

}
