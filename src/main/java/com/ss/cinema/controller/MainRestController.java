package com.ss.cinema.controller;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.service.MainService;

@RequestMapping("/movieCharts")
@RestController
public class MainRestController {

	@Autowired
	private MainService mainService;
	
	@RequestMapping("")
	public ResponseEntity<List<movieDTO>> getMovieChart(@RequestParam(name="name", required = false) String name) {
		if(name == null) {
			List<movieDTO> list = mainService.getReserveTop();
			System.out.println(list);
			return ResponseEntity.status(HttpStatus.OK).body(list);
		} else {
			List<movieDTO> list = mainService.getScheduledRelease();
			System.out.println(list);
			return ResponseEntity.status(HttpStatus.OK).body(list);
		}
	}
	
}
