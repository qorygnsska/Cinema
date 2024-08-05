package com.ss.cinema.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/memberFind")
	public String memberFind(Model model) {
		return "/member/memberFind";
	}
	
	@RequestMapping("/findId")
	public String findId(Model model, String name, String phone, String email) {
		Map<String, String> info = new HashMap();
		info.put("name", name);
		info.put("phone", phone);
		info.put("email", email);
		MemberDTO member = service.findId(info);
		if(member==null) {
			model.addAttribute("msg", "찾으시는 회원 정보가 없습니다.");
			return "/member/memberFind";
		}
		model.addAttribute("member", member);
		return "/member/memberFind_id";
	}
	
	@RequestMapping("/findPw")
	public String findPw(Model model, String name, String id, String email) {
		
		
		return "/member/memberFind";
	}
	
	@RequestMapping("/memberLogin")
	public String memberLogin(Model model, HttpSession session, String id, String password) {
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("id", id);
		loginInfo.put("pw", password);
		MemberDTO member = service.login(loginInfo);
		System.out.println(member);
		if(member.isMemberAdmin()) {
			return "/admin/adminMain";
		}
		session.setAttribute("sessionId", member.getMemberId());
		model.addAttribute("member", member);
		return "/common/main";
	}
	
	@RequestMapping("/logout")
	public String logout(Model model) {
		System.out.println("logout controller");
		((ModelMap)model).remove("member");
		return "/common/main";
	}
	
}
