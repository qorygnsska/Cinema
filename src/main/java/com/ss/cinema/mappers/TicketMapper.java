package com.ss.cinema.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.PaymentDTO;
import com.ss.cinema.dto.SeatDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;

@Mapper
public interface TicketMapper {

	List<movieDTO> getMovieList(Map<String, Object> menuHashMap);

	List<CinemaDTO> getCinemaList(Map<String, Object> menuHashMap);

	List<CinemaDTO> getCinemaDateList(Map<String, Object> menuHashMap);

	List<TheaterDTO> getTheaterList(Map<String, Object> menuHashMap);

	List<SeatDTO> getSeatList(Map<String, Object> theaterNo);

	MemberDTO getMemberById(String memId);

	void insertSeat(@Param("theaterNo") Object theaterNo, @Param("seatRow") int seatRow, @Param("seatCol") int seatCol);

	void insertPayment(Map<String, Object> dbMap);

	void insertTicket(Map<String, Object> dbMap);

	PaymentDTO getPayment(Map<String, Object> dbMap);

	int checkSeat(@Param("theaterNo") Object theaterNo, @Param("seatRow") int seatRow, @Param("seatCol") int seatCol);
	
	void setMemberStamp(MemberDTO memberDTO);

	

}