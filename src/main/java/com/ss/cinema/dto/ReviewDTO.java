package com.ss.cinema.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReviewDTO {
	private int reviewNo;
    private String reviewMemberId;
    private int reviewMovieNo;
    private String reviewContent;
    private Date reviewWriteDate;
    private int reviewStarRating;
    private int reviewLikeCount;
    private int reviewTotal;	// 영화별 리뷰 총 개수

}
