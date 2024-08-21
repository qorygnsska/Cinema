package com.ss.cinema.mappers.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ss.cinema.dto.MyReviewDTO;
import com.ss.cinema.dto.ReviewDTO;

@Mapper
public interface myReviewMapper {
	
	// 리뷰 작성
	void writeReview(@Param("movieNo") int movieNo, @Param("ticketNo") int ticketNo, @Param("star") int star, @Param("reContent") String reContent, @Param("id") String id);
	
	// 리뷰 내역 가져오기
	List<ReviewDTO> getReview(String id);
	
	// 페이지별 리뷰 가져오기
	List<MyReviewDTO> getPageReview(@Param("limit") int limit, @Param("offset") int offset, @Param("id") String id);
	
	// 리뷰 삭제
	void deleteReview(int no);

	int checkReview(@Param("movieNo") int movieNo, @Param("memberId") String memberId, @Param("ticketNo") int ticketNo);
}
