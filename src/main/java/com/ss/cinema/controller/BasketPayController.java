package com.ss.cinema.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.ss.cinema.service.JunBasketService;
import com.ss.cinema.service.PaymentProductService;

@Controller
@RequestMapping("/basket")
public class BasketPayController {
	   @Autowired
	    private JunBasketService JunBasketService;
	   @Autowired
	    private PaymentProductService  PaymentProductService;
	   
	    @GetMapping("/basketPay")
	    public String basketMain(Model model, HttpSession session) {
	        String sessionId = (String) session.getAttribute("sessionId");
	        if (sessionId == null) {
	            return "redirect:/login";
	        }

	        MemberDTO member = JunBasketService.getMemberInfo(sessionId);
	        if (member != null) {
	            model.addAttribute("memberName", member.getMemberName());
	            model.addAttribute("memberPhone", member.getMemberPhone());
	        }

	        List<JunBasketDTO> junBasketList = JunBasketService.getBasketItemsByMemberId(sessionId);
	        model.addAttribute("basketList", junBasketList);

	        return "basket/basketPay";
	    }
	    

	    @PostMapping("/verifyIamport/{impUid}")
	    @ResponseBody
	    public ResponseEntity<?> verifyIamport(@PathVariable("impUid") String impUid) {
	        int amount = PaymentProductService.verifyPayment(impUid);
	        return ResponseEntity.ok().body(amount);
	    }

	    @PostMapping("/savePaymentData")
	    @ResponseBody
	    public ResponseEntity<?> savePaymentData(@RequestBody List<JunPaymentProductDTO> paymentProductDTOList) {
	        PaymentProductService.savePaymentData(paymentProductDTOList);
	        return ResponseEntity.ok().build();
	    }




}