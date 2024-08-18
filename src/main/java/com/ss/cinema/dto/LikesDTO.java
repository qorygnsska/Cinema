package com.ss.cinema.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LikesDTO {
	private int likesNo;			// 좋아요 NO
	private int likesReviewNo;		// 좋아요 누른 리뷰 번호
	private String likesMemberId;	// 좋아요 누른 회원 ID

}
