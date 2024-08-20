package com.ss.cinema.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.dto.JunBasketDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.service.JunBasketService;
import com.ss.cinema.service.MainService;

@Controller
@RequestMapping("/basket")
public class BasketEndController {

	@Autowired
	private JunBasketService junBasketService;

	@Autowired
	private MainService mainService;

	@GetMapping("/basketEnd")
	public String basketEnd(Model model, HttpSession session) {
		// 기능 로직을 제거하고, 화면만 보이게 설정

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
		return "basket/basketEnd"; // JSP 파일 경로
	}
}
