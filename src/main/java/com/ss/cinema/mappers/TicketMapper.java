package com.ss.cinema.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;

@Mapper
public interface TicketMapper {

	List<movieDTO> getMovieList(CinemaDTO cinemaDTO);

	List<CinemaDTO> getCinemaList(List<movieDTO> movieList);

}
