package com.ss.cinema.service;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.PaymentDTO;
import com.ss.cinema.dto.SeatDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.mappers.TicketMapper;

@Service
public class TicketService {

	@Autowired
	private TicketMapper ticketMapper;
	
	// 영화 리스트 Mapper
	public List<movieDTO> getMovieList(List<Map<String, Object>> menuList) {
		
		// HashMap으로 초기화
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getMovieList(menuHashMap);
	}

	// 영화관 리스트 Mapper
	public List<CinemaDTO> getCinemaList(List<Map<String, Object>> menuList) {
		
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getCinemaList(menuHashMap);
	}

	
	
	// 영화관 날짜 리스트 Mapper
	public List<CinemaDTO> getCinemaDateList(List<Map<String, Object>> menuList) {
		
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getCinemaDateList(menuHashMap);
	}
	
	public List<TheaterDTO> getTheaterList(List<Map<String, Object>> menuList) {
		
		Map<String, Object> menuHashMap = MapSet(menuList);
		
		return ticketMapper.getTheaterList(menuHashMap);
	}

	private Map<String, Object> MapSet(List<Map<String, Object>> menuList){
		// HashMap으로 초기화
        Map<String, Object> menuHashMap = new HashMap<String, Object>();
        
        for(Map<String, Object> map : menuList) {
        	for(Map.Entry<String, Object> entry : map.entrySet()) {
        		if(entry.getValue().toString().isEmpty()) {
        			menuHashMap.put(entry.getKey(), null);
        		}else {
        			menuHashMap.put(entry.getKey(), entry.getValue());
        		}
        		
        	}
        }
		
        return menuHashMap;
	}
	
	
	// 좌석 리스트
	public List<SeatDTO> getSeatList(Map<String, Object> theaterNo) {
		
		return ticketMapper.getSeatList(theaterNo);
	}

	// 멤버 정보 
	public MemberDTO getMemberById(String memId) {
		
		return ticketMapper.getMemberById(memId);
	}
	
	// 예약된 좌석 체크
	public int checkSeat(Map<String, Object> insertMap) {
		
		
		int seatCnt = 0;
		int resultArray[][] = arraySeat(insertMap);
		
		for(int row = 0; row < resultArray.length; row++) {
			seatCnt += ticketMapper.checkSeat(insertMap.get("theaterNo"),resultArray[row][0],resultArray[row][1]);
		}
		
		return seatCnt;
	}

	public void insertTicket(Map<String, Object> insertMap) {
		
		Map<String, Object> dbMap = new HashMap<String, Object>();

	
		// 좌석 insert
		int resultArray[][] = arraySeat(insertMap);
		
		for(int row = 0; row < resultArray.length; row++) {
			ticketMapper.insertSeat(insertMap.get("theaterNo"),resultArray[row][0],resultArray[row][1]);
		}

		
		// 결제 내역 날짜 변환
		String paymentDate = (String)insertMap.get("paymentDate");
		long timestamp = Long.parseLong(paymentDate); 

		Date date = new Date(timestamp); 

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String formattedDate = sdf.format(date);
		
		// 쿠폰 스탬프 db 추가
		String ticketTeen = (String)insertMap.get("ticketTeen");
		String ticketAdult = (String)insertMap.get("ticketAdult");
		String ticketSenior = (String)insertMap.get("ticketSenior");
		String useCouponCnt = (String)insertMap.get("useCouponCnt");
		
		
		int iTicketTeen = ticketTeen.isEmpty() ? 0 : Integer.parseInt(ticketTeen);
		int iTicketAdult = ticketAdult.isEmpty() ? 0 : Integer.parseInt(ticketAdult);
		int iTicketSenior = ticketSenior.isEmpty() ? 0 : Integer.parseInt(ticketSenior);
		int iUseCouponCnt = Integer.parseInt(useCouponCnt);
		
		
		String memId = (String) insertMap.get("memberId");
		MemberDTO memberDTO = ticketMapper.getMemberById(memId);
		
		int stamp = memberDTO.getMemberStamp();
		int coupon = memberDTO.getMemberCoupon();
		
		int reStamp = stamp + iTicketTeen + iTicketAdult + iTicketSenior;
		
		int reCoupon = coupon - iUseCouponCnt;
		
		if(reStamp > 9) {
			reStamp -= 9;
			reCoupon++;
		}
	
		memberDTO.setMemberStamp(reStamp);
		memberDTO.setMemberCoupon(reCoupon);
		
		ticketMapper.setMemberStamp(memberDTO);
		
		// payment, ticket db 추가
        dbMap.put("theaterNo", insertMap.get("theaterNo"));
		dbMap.put("paymentDate", formattedDate);
		dbMap.put("paymentPrice", String.valueOf(insertMap.get("paymentPrice")).replace(",", ""));
		dbMap.put("memberId", insertMap.get("memberId"));
		dbMap.put("movieNo", insertMap.get("movieNo"));
		dbMap.put("cinemaNo", insertMap.get("cinemaNo"));
		dbMap.put("seatNum", insertMap.get("leftSeatNum"));
		dbMap.put("ticketTeen", iTicketTeen);
		dbMap.put("ticketAdult", iTicketAdult);
		dbMap.put("ticketSenior", iTicketSenior);
		dbMap.put("imp_uid", insertMap.get("imp_uid"));
		dbMap.put("useCouponCnt", iUseCouponCnt);
		
		String paymentType = (String)insertMap.get("paymentType");
		
		if(paymentType == null || paymentType.isBlank()) {
			dbMap.put("paymentType", "간편결제");
		}else {
			dbMap.put("paymentType", insertMap.get("paymentType"));
		}
		
		ticketMapper.insertPayment(dbMap);
		
		PaymentDTO paymentDTO = ticketMapper.getPayment(dbMap);
		dbMap.put("paymentNo", paymentDTO.getPaymentNo());
		
		
		ticketMapper.insertTicket(dbMap);

	}

	// 좌석 변환
	private int[][] arraySeat(Map<String, Object> insertMap) {
		
		String[] seatArray = insertMap.get("leftSeatNum").toString().split(",\\s*");
		int[][] resultArray = new int[seatArray.length][2];
		
		for (int i = 0; i < seatArray.length; i++) {
		    String seat = seatArray[i];

		    char rowChar = seat.charAt(0);
		    int rowNumber = rowChar - 65;

		    resultArray[i][0] = rowNumber;
		    resultArray[i][1] = Integer.parseInt(seat.substring(1)) -1;
		}
		
		return resultArray;
	}
}