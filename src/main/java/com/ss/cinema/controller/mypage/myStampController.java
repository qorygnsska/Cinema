package com.ss.cinema.controller.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.service.mypage.myStampService;

@Controller
public class myStampController {
	
	@Autowired
	myStampService myStampservice;
	
	
	@RequestMapping("/myStamp")
	public String myStamp(Model model) {
		MemberDTO member = myStampservice.getStmap("1");
		System.out.println("하이");
		model.addAttribute("member", member);
	
		return "mypage/myStamp";
	}
}
