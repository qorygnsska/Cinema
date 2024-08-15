package com.ss.cinema.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.dto.MemberDTO;
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
	public String movieDetail(Model model, ProductDTO productDTO, HttpSession session) {
		System.out.println("StoreController 안 storeDetail() 실행");
		
		
		// 스토어 상세 정보 가져오기
		ProductDTO store = storeService.getStoreDetailInfo(productDTO);
		System.out.println("store : " + store );
		
		// 회원 id 가져오기
		String memId = (String) session.getAttribute("sessionId");
		System.out.println(memId);
		
//		MemberDTO memberDTO = storeService.getMemberById(memId);
		
//		System.out.println(memberDTO);
//		
		model.addAttribute("store", store);
		model.addAttribute("id", memId);
//		model.addAttribute("memberDTO", memberDTO);
		
		return "store/storeDetail";
	}

}
