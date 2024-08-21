package com.ss.cinema.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.dto.BasketDTO;
import com.ss.cinema.dto.JunBasketDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.PaymentDTO;
import com.ss.cinema.service.JunBasketService;
import com.ss.cinema.service.PaymentProductService;
import com.ss.cinema.service.TicketService;

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
		List<Long> basketNos = selectedItems.stream().map(item -> Long.valueOf(item.get("basketNo").toString()))
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

			Map<String, Object> dbMap = new HashMap<String, Object>();
			
			
			// 시간
			String paymentDate = (String)paymentData.get("paymentDate");
			long timestamp = Long.parseLong(paymentDate); 

			Date date = new Date(timestamp); 

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String formattedDate = sdf.format(date);

			dbMap.put("paymentDate", formattedDate);
			
			// 가격, uid
			dbMap.put("paymentPrice", String.valueOf(paymentData.get("amount")).replace(",", ""));
			dbMap.put("paymentImpUid", paymentData.get("imp_uid"));
			
			
			// 타입
			String paymentType = (String)paymentData.get("paymentType");
			
			if(paymentType == null || paymentType.isBlank()) {
				dbMap.put("paymentType", "간편결제");
			}else {
				dbMap.put("paymentType", paymentData.get("paymentType"));
			}
			
			System.out.println("paymentData" + dbMap);
			
			// payment 추가
			paymentProductService.insertPayment(dbMap);
			
			
			// basket Status 수정
			List<Integer> basketNoList = (List<Integer>) paymentData.get("basketNo");

			int basketNoArr[] = new int[basketNoList.size()];
			// 배열을 하나씩 꺼내어 처리합니다.
			
			for (int i = 0; i < basketNoList.size(); i++) {
			    int basketNo = basketNoList.get(i);
				// 각 basketNo에 대해 처리 로직을 추가합니다.
			    System.out.println(basketNo);
				paymentProductService.updateBasketStatus(basketNo);

				basketNoArr[i] = basketNo;
				// 예를 들어, 데이터베이스에 저장하거나 다른 로직을 수행합니다.
			}
			
			
			// paymentNo 가져오기
			
			PaymentDTO paymentDTO = paymentProductService.selectPaymentNo(dbMap);
			
			
			for(int i = 0; i < basketNoArr.length; i++) {
				
				Map<String, Object> map = new HashMap<String, Object>();
				
				map.put("basketNo", basketNoArr[i]);
				map.put("paymentNo", paymentDTO.getPaymentNo());
				
				paymentProductService.insertPaymentProduct(map);
			}

			return ResponseEntity.ok().build();
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
}
