package com.ss.cinema.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.cinema.dto.JunBasketDTO;
import com.ss.cinema.service.JunBasketService;

@Controller
@RequestMapping("/basket")
public class JunBasketController {

    @Autowired
    private JunBasketService JunBasketService;

    @GetMapping("/basketMain")
    public String basketMain(Model model, HttpSession session) {
        // 세션에서 회원 ID 가져오기
        String sessionId = (String) session.getAttribute("sessionId"); // 'memberId' 대신 'sessionId'를 사용
        if (sessionId == null) {
            return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        }

        List<JunBasketDTO> JunbasketList = JunBasketService.getBasketItemsByMemberId(sessionId); // 여기도 동일하게 sessionId 사용
        model.addAttribute("basketList", JunbasketList);

        return "basket/basketMain"; // 장바구니 JSP로 포워드
    }
    @GetMapping("/deleteBasketItem")
    public String deleteSelectedBasketItems(@RequestParam("basketNos") String basketNos) {
        String[] basketNoArray = basketNos.split(",");
        for (String basketNo : basketNoArray) {
            JunBasketService.deleteBasketItem(Integer.parseInt(basketNo));
        }
        return "redirect:/basket/basketMain"; // 장바구니 페이지로 리다이렉트
    
    
}}