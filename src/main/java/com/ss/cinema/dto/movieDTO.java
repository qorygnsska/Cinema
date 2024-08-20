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
	private String movieMainImage;		// 메인 이미지 경로
	private String movieSubImage;		// 서브1 이미지 경로
	private String movieSsubImage;		// 서브2 이미지 경로
	private String movieTrailer;		// 예고편
	private String movieMainTrailer;	// 메인 예고편
	private String movieSubTrailer;		// 서브1 예고편
	private String movieSsubTrailer;	// 서브2 예고편
	private String movieMainThumbnail;	// 메인 썸네일
	private String movieSubThumbnail;	// 서브1 썸네일
	private String movieSsubThumbnail;	// 서브2 썸네일
	private Double ratingStarAVG;		// 별점 평균
	private int movieReservation;	// 예매율
	

	private MultipartFile movieMainImageFile; // 업로드된 이미지 파일을 저장
	private MultipartFile movieSubImageFile; // 추가 이미지 파일을 저장
	private MultipartFile movieSsubImageFile; // 추가 이미지 파일을 저장
	private MultipartFile movieTrailerFile;		// 예고편
	private MultipartFile movieMainThumbnailFile; 
	private MultipartFile movieSubThumbnailFile;
	private MultipartFile movieSsubThumbnailFile;
}
