package com.ss.cinema.controller;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.ss.cinema.key.appKey;
import com.ss.cinema.service.mypage.myCancelService;

@Controller
public class PaymentController {
	
	private IamportClient api;
	private appKey key = new appKey();
	
	@Autowired
	private myCancelService myCancelservice;
	
	public PaymentController() {
		this.api = new IamportClient(key.getImport_restAPI_key(), key.getImport_restAPI_secret());
	}

	// 검증
	@RequestMapping("/verifyIamport/{imp_uid}")
	@ResponseBody
	public IamportResponse<Payment> paymentByImpUid(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	

		return api.paymentByImpUid(imp_uid);
	}
	
	@RequestMapping("/canclePay/{imp_uid}")
	@ResponseBody
	public boolean paymenyCancle(Model model, Locale locale, HttpSession session, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	

		return myCancelservice.cancel(imp_uid);
	}
	
	
}
