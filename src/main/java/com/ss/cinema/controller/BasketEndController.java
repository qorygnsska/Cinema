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

@Controller
@RequestMapping("/basket")
public class BasketEndController {

    @Autowired
    private JunBasketService junBasketService;

    @GetMapping("/basketEnd")
    public String basketEnd(Model model) {
        // 기능 로직을 제거하고, 화면만 보이게 설정
        return "basket/basketEnd"; // JSP 파일 경로
    }
}
	