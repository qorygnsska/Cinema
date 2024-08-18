package com.ss.cinema.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.cinema.dto.JunBasketDTO;
import com.ss.cinema.service.JunBasketService;
import com.ss.cinema.service.MainService;

@Controller
@RequestMapping("/basket")
public class JunBasketController {

    @Autowired
    private JunBasketService JunBasketService;
    
    @Autowired
	private MainService mainService;

    @GetMapping("/basketMain")
    public String basketMain(Model model, HttpSession session) {
        // 세션에서 회원 ID 가져오기
        String sessionId = (String) session.getAttribute("sessionId"); // 'memberId' 대신 'sessionId'를 사용
        if (sessionId == null) {
            return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        }
        Integer countBasket = mainService.countBasket(sessionId);
        if(countBasket != null && countBasket > 0) {
			session.setAttribute("countBasket", countBasket);
		}else {
			session.removeAttribute("countBasket");
		}
        List<JunBasketDTO> JunbasketList = JunBasketService.getBasketItemsByMemberId(sessionId); // 여기도 동일하게 sessionId 사용
        model.addAttribute("basketList", JunbasketList);

        return "basket/basketMain"; // 장바구니 JSP로 포워드
    }
    
    
    @PostMapping("/deleteBasketItem")
    public String deleteBasketItem(@RequestParam("basketNo") int basketNo, HttpSession session) {
        String sessionId = (String) session.getAttribute("sessionId");
        JunBasketService.deleteBasketItemBySessionAndBasketNo(sessionId, basketNo);
        return "redirect:/basket/basketMain";  // 삭제 후 장바구니 페이지로 리다이렉트
    }
    
    @PostMapping("/deleteSelectedBasketItems")
    public String deleteSelectedBasketItems(@RequestParam("basketNos") String basketNos, HttpSession session) {
        String sessionId = (String) session.getAttribute("sessionId");

        if (basketNos != null && !basketNos.trim().isEmpty()) {
            String[] basketNoArray = basketNos.split(",");
            for (String basketNo : basketNoArray) {
                JunBasketService.deleteBasketItemBySessionAndBasketNos(sessionId, Integer.parseInt(basketNo.trim()));
            }
        }

        return "redirect:/basket/basketMain";
    }
    
    


    @PostMapping("/updateQuantity")
    public ResponseEntity<String> updateBasketQuantity(
            @RequestParam("basketNo") Long basketNo, 
            @RequestParam("quantity") String quantity) {
        
        try {
            int qty = Integer.parseInt(quantity);
            if (qty <= 0) {
                throw new IllegalArgumentException("Quantity must be greater than zero");
            }

            JunBasketService.updateBasketQuantity(basketNo, qty);
            return ResponseEntity.ok("Quantity updated successfully");
        } catch (NumberFormatException e) {
            return ResponseEntity.badRequest().body("Invalid quantity");
        }
    }
    
    @PostMapping("/updateQuantities")
    public ResponseEntity<String> updateQuantities(@RequestBody Map<Long, Integer> basketQuantities) {
        JunBasketService.updateQuantities(basketQuantities);
        return ResponseEntity.ok("Quantities updated successfully");
    }
}



