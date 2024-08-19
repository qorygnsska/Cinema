package com.ss.cinema.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
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
    private JunBasketService junBasketService; // 변수명을 CamelCase로 수정
    
    @Autowired
	private MainService mainService;

    @GetMapping("/basketMain")
    public String basketMain(Model model, HttpSession session) {
        String sessionId = (String) session.getAttribute("sessionId");
        if (sessionId == null) {
            return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        }
        
        Integer countBasket = mainService.countBasket(sessionId);
        if (countBasket != null && countBasket > 0) {
			session.setAttribute("countBasket", countBasket);
		} else {
			session.removeAttribute("countBasket");
		}
        
        List<JunBasketDTO> junBasketList = junBasketService.getBasketItemsByMemberId(sessionId);
        model.addAttribute("basketList", junBasketList);

        return "basket/basketMain";
    }
    
    @PostMapping("/deleteBasketItem")
    public String deleteBasketItem(@RequestParam("basketNo") int basketNo, HttpSession session) {
        String sessionId = (String) session.getAttribute("sessionId");
        junBasketService.deleteBasketItemBySessionAndBasketNo(sessionId, basketNo);
        return "redirect:/basket/basketMain";  // 삭제 후 장바구니 페이지로 리다이렉트
    }
    
    @PostMapping("/deleteSelectedBasketItems")
    public String deleteSelectedBasketItems(@RequestParam("basketNos") String basketNos, HttpSession session) {
        String sessionId = (String) session.getAttribute("sessionId");

        if (basketNos != null && !basketNos.trim().isEmpty()) {
            String[] basketNoArray = basketNos.split(",");
            for (String basketNo : basketNoArray) {
                junBasketService.deleteBasketItemBySessionAndBasketNo(sessionId, Integer.parseInt(basketNo.trim()));
            }
        }

        return "redirect:/basket/basketMain";
    }
    

   
    @PostMapping("/updateSelectedQuantities")
    public ResponseEntity<Void> updateSelectedQuantities(
            @RequestBody List<Map<String, Object>> selectedItems,
            HttpSession session) {

        Map<Long, Integer> basketQuantities = new HashMap<Long, Integer>();
        for (Map<String, Object> item : selectedItems) {
            Long basketNo = Long.valueOf(item.get("basketNo").toString());
            Integer quantity = (Integer) item.get("quantity");
            basketQuantities.put(basketNo, quantity);
        }

        junBasketService.updateQuantities(basketQuantities);

        // session에 저장된 데이터를 확인하기 위해 로그를 추가
        session.setAttribute("selectedItems", selectedItems);
        System.out.println("Session saved selectedItems: " + selectedItems);

        return ResponseEntity.ok().build();
    }

}


