package com.ss.cinema.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ss.cinema.dto.JunBasketDTO;
import com.ss.cinema.dto.JunPaymentProductDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.PaymentDTO;
import com.ss.cinema.service.JunBasketService;
import com.ss.cinema.service.PaymentProductService;

@Controller
@RequestMapping("/basket")
public class BasketPayController {

    @Autowired
    private JunBasketService junBasketService;

    @Autowired
    private PaymentProductService paymentProductService;

    @GetMapping("/basketPay")
    public String basketPay(Model model, HttpSession session) {
        String sessionId = (String) session.getAttribute("sessionId");
        if (sessionId == null) {
            return "redirect:/login"; // 로그인되지 않은 경우 로그인 페이지로 리다이렉트
        }

        MemberDTO member = junBasketService.getMemberInfo(sessionId);
        if (member != null) {
            model.addAttribute("memberName", member.getMemberName());
            model.addAttribute("memberPhone", member.getMemberPhone());
        }

        // 세션에서 선택된 상품 정보를 가져옴
        List<Map<String, Object>> selectedItems = (List<Map<String, Object>>) session.getAttribute("selectedItems");
        System.out.println("Session retrieved selectedItems: " + selectedItems);
        
        if (selectedItems == null || selectedItems.isEmpty()) {
            return "redirect:/basket/basketMain"; // 선택된 항목이 없으면 장바구니 페이지로 리다이렉트
        }

        // 선택된 상품의 basketNo를 추출하여 Long 리스트로 변환
        List<Long> basketNos = selectedItems.stream()
                                            .map(item -> Long.valueOf(item.get("basketNo").toString()))
                                            .collect(Collectors.toList());

        // 선택된 상품 정보로 DB에서 가져오기
        List<JunBasketDTO> junBasketList = junBasketService.getBasketItemsByBasketNos(basketNos);
        model.addAttribute("basketList", junBasketList);
        
        System.out.println("Retrieved basket items: " + junBasketList);

        return "basket/basketPay";
    }
    @PostMapping("/savePaymentData")
    public ResponseEntity<Void> savePaymentData(@RequestBody Map<String, Object> paymentData) {
        try {
            // 로그 추가
            System.out.println("Payment Data Received: " + paymentData);

            // 1. PaymentDTO 생성
            PaymentDTO paymentDTO = new PaymentDTO();
            paymentDTO.setPaymentType("card");
            paymentDTO.setPaymentPrice((Integer) paymentData.get("amount"));
            paymentDTO.setPaymentImpUid((String) paymentData.get("imp_uid"));

            // 2. 장바구니 번호 리스트 가져오기
            List<Long> basketNos = (List<Long>) paymentData.get("basketNos");

            // 3. 결제 처리
            paymentProductService.processPayment(paymentDTO, basketNos);

            return ResponseEntity.ok().build();
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
