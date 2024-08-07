package com.ss.cinema.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.CinemaDTO;
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

}
