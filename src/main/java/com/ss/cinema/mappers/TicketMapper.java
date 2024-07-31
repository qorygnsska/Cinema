package com.ss.cinema.mappers;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;

@Mapper
public interface TicketMapper {

	List<movieDTO> getMovieList(Map<String, String> menuMap);

	List<CinemaDTO> getCinemaList(List<movieDTO> movieList);

}
