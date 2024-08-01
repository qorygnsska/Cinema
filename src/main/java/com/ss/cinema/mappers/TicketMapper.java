package com.ss.cinema.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;

@Mapper
public interface TicketMapper {

	List<movieDTO> getMovieList(Map<String, Object> menuListMap);

	List<CinemaDTO> getCinemaList(List<movieDTO> movieList);

	List<TheaterDTO> getCinemaDateList(List<movieDTO> movieList);



}
