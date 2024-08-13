package com.ss.cinema.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MyReviewDTO {
	private int reviewNo;
	private int movieNo;
	private String movieTitle;
	private String movieMainImage;
	private String reviewContent;
	private int reviewLikeCount;
	private int reviewStarRating;
	private Date reviewWriteDate;
}