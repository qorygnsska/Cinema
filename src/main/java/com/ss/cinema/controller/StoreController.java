package com.ss.cinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	@RequestMapping("/storeList")
	public String movieList(Model model) {
		System.out.println("StoreController 안 storeList() 실행");
		
		// 스토어 리스트 정보 가져오기
		List<ProductDTO> storeList = storeService.getStoreListInfo();
		System.out.println(storeList);
		model.addAttribute("storeList", storeList);
		
		return "store/storeList";
	}
	
	@RequestMapping("/storeDetail")
	public String movieDetail(Model model, ProductDTO productDTO) {
		System.out.println("StoreController 안 storeDetail() 실행");
		
		
		// 스토어 상세 정보 가져오기
		ProductDTO store = storeService.getStoreDetailInfo(productDTO);
		System.out.println("store : " + store );
		model.addAttribute("store", store);
		
		return "store/storeDetail";
	}

}
