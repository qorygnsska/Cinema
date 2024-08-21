package com.ss.cinema.service.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.MyReviewDTO;
import com.ss.cinema.dto.ReviewDTO;
import com.ss.cinema.mappers.mypage.myReviewMapper;

@Service
public class myReviewService {

	@Autowired
	private myReviewMapper myReviewmapper;

	// 리뷰 작성
	public void writeReview(int movieNo, int ticketNo, int star, String reContent, String id) {

		myReviewmapper.writeReview(movieNo, ticketNo, star, reContent, id);

	}
	
	// 리뷰 가져오기
	public List<ReviewDTO> getReview(String id){
		return myReviewmapper.getReview(id);
	}
	
	
	// 페이지별 리뷰 가져오기
	public List<MyReviewDTO> getPageReview(int page, int pageSize, String sessionId){
		int limit = pageSize;
		int offset = (page - 1) * pageSize;
		return myReviewmapper.getPageReview(limit, offset, sessionId);
	}
	
	// 리뷰 삭제
	public void deleteReview(int no) {
		myReviewmapper.deleteReview(no);
	}
	
	// 리뷰 체크
	public int checkReview(int movieNo, String memberId, int ticketNo) {
		
		return myReviewmapper.checkReview(movieNo, memberId, ticketNo);
	}
}
