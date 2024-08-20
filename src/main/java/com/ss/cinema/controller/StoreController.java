package com.ss.cinema.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.cinema.dto.BasketDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.service.MainService;
import com.ss.cinema.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	@Autowired
	private MainService mainService;

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
		System.out.println("store : " + store);

		// 회원 id 가져오기
		String memId = (String) session.getAttribute("sessionId");
		System.out.println("회원ID : " + memId);

		if (memId != null) {
			// 장바구니 카운트 가져오기
			Integer countBasket = mainService.countBasket(memId);
			System.out.println("countBasket: " + countBasket);
			if (countBasket != null && countBasket > 0) {
				session.setAttribute("countBasket", countBasket);
			} else {
				session.removeAttribute("countBasket");
			}
		}
//		MemberDTO memberDTO = storeService.getMemberById(memId);

//		System.out.println(memberDTO);
//		
		model.addAttribute("store", store);
		model.addAttribute("id", memId);
//		model.addAttribute("memberDTO", memberDTO);

		return "store/storeDetail";
	}

	@RequestMapping(value = "/basket/add")
	@ResponseBody
	public Map<String, Object> addToBasket(@RequestBody BasketDTO basketDTO) {
		System.out.println("StoreController 안 addToBasket() 실행");
		System.out.println("BasketDTO : " + basketDTO);
		
		// 같은 상품이 장바구니에 있는지 확인
	    int count = storeService.checkBasket(basketDTO);

		Map<String, Object> response = new HashMap<String, Object>();
		try {
			if(count <= 0) {
	    		System.out.println("장바구니에 insert");
	    		storeService.insertBasket(basketDTO);
	    	// 장바구니에 같은 상품이 없을 경우
	    	}else{
	    		System.out.println("장바구니에 update");
	    		storeService.updateBasketCount(basketDTO);
	    	}
	    	response.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			response.put("success", false);
			response.put("message", e.getMessage()); // 예외 메시지 포함
		}

		return response;
	}

}
