package com.ss.cinema.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.key.appKey;
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
		if (member == null) {
			model.addAttribute("msg", "찾으시는 회원 정보가 없습니다.");
			return "/member/memberFind";
		}
		model.addAttribute("member", member);
		return "/member/memberFind_id";
	}

	@RequestMapping("/findPw")
	public String findPw(Model model, String name, String id, String email) {
		MemberDTO dto = service.findPw(name, id, email);
		System.out.println(dto);
		if (dto == null) {
			model.addAttribute("findFailMsg", "찾으시는 회원 정보가 없습니다.");
			return "/member/memberFind";
		} else {
			int checkNum = service.emailAuth(email);
			model.addAttribute("email", dto.getMemberEmail());
			model.addAttribute("checkNum", checkNum);
			model.addAttribute("findPwMsg", "findPw");
			return "/member/emailAuth";
		}
	}

	@RequestMapping("/resetPw")
	public String resetPw(Model model, @RequestParam String email) {
		model.addAttribute("email", email);
		return "member/memberFind_newPw";
	}

	@RequestMapping("/resetNewPw")
	public String resetNewPw(Model model, @RequestParam String email, @RequestParam String newPw) {
		int result = service.resetPw(email, newPw);
		if (result > 0) {
			model.addAttribute("resetNewPw", "비밀번호가 변경이 완료되었습니다.");
		} else {
			model.addAttribute("resetNewPw", "비밀번호가 변경에 실패하였습니다. 다시 시도해주세요.");
		}
		return "/member/login";
	}

	@RequestMapping("/memberLogin")
	public String memberLogin(Model model, HttpSession session, String id, String password) {
		Map<String, String> loginInfo = new HashMap<String, String>();
		loginInfo.put("id", id);
		loginInfo.put("pw", password);
		MemberDTO member = service.login(loginInfo);
		System.out.println(member);
		if (member != null && member.isMemberAdmin()) {
			return "/admin/adminMain";
		}
		String sessionId = member.getMemberId();
		session.setAttribute("sessionId", sessionId);
		return "/common/main";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionId");
		return "redirect:/";
	}

//	SNS 카카오 로그인
	@RequestMapping("/kakaoLogin")
	public String kakaoLogin(Model model, String code) {
		String token = service.getKakaoToken(code);
		Map<String, String> kakaoInfo = service.getKakaoUserInfo(token);
		
//		전화번호 수집 승인되면 map에 전화번호도 추가해서 가지고와서
//		service에서 전화번호, 이메일 and 조건으로 중복확인 후
//		멤버가 있으면 가지고 와서 로그인시켜주기
//		없으면 회원가입 창으로 넘어가면서 회원가입을 먼저 진행해달라고
//		alert 띄우기
		return "/common/main";
	}

//	SNS 네이버 로그인
	@RequestMapping("/NaverLogin")
	public String NaverLogin(Model model, HttpSession session, String code) {
		String token = service.getNaverToken(code);
		Map<String, String> naverInfo = service.getNaverUserInfo(token);
		MemberDTO member = service.snsLogin(naverInfo);

		if (member != null) {
			String sessionId = member.getMemberId();
			session.setAttribute("sessionId", sessionId);
			return "redirect:/";
		} else {
			model.addAttribute("snsLogin", "존재하지 않는 회원입니다. 회원가입을 먼저 진행해주세요.");
			return "/member/join";
		}
	}

//	SNS 구글 로그인
	@RequestMapping("/GoogleLogin")
	public String GoogleLogin(Model model, HttpSession session, String code) {
		String token = service.getGoogleToken(code);
		String googleEmail = service.getGoogleUserInfo(token);
		MemberDTO member = service.selectByEmail(googleEmail);
		if (member == null) {
			model.addAttribute("snsLogin", "존재하지 않는 회원입니다. 회원가입을 먼저 진행해주세요.");
			return "/member/join";
		} else {
			String sessionId = member.getMemberId();
			session.setAttribute("sessionId", sessionId);
			return "redirect:/";
		}
	}

//	아이디 중복체크
	@RequestMapping("/idCheck")
	public ResponseEntity<Integer> idCheck(@RequestParam String id) {
		int result = service.checkId(id);
		return ResponseEntity.ok(result);
	}

//	이메일 중복체크
	@RequestMapping("/emailCheck")
	public ResponseEntity<Integer> emailCheck(@RequestParam String email) {
		int result = service.checkEmail(email);
		return ResponseEntity.ok(result);
	}

//	이메일 인증번호 확인
	@RequestMapping("/emailAuth")
	public String emailAuth(Model model, @RequestParam String email) {
		int checkNum = service.emailAuth(email);
		model.addAttribute("email", email);
		model.addAttribute("checkNum", checkNum);
		return "/member/emailAuth";
	}

//	회원가입
	@RequestMapping("/join")
	public String join(Model model, @RequestParam String id, @RequestParam String password, @RequestParam String email,
			@RequestParam String name, @RequestParam String gender, @RequestParam String ssn1,
			@RequestParam String ssn2, @RequestParam String phone) {
		int num = service.join(id, password, email, name, gender, ssn1, ssn2, phone);
		String msg;
		if (num > 0) {
			msg = "회원가입이 성공적으로 완료되었습니다.";
			model.addAttribute("joinMsg", msg);
			return "/member/login";
		} else {
			msg = "회원가입이 실패하였습니다.";
			model.addAttribute("joinMsg", msg);
			return "/member/join";
		}
	}

//	전체 아이디 메일발송
	@RequestMapping("/sendId")
	public String sendId(Model model, @RequestParam String email) {
		MemberDTO member = service.selectByEmail(email);
		int result = service.sendId(member);
		if (result == 1) {
			model.addAttribute("sendId", "전체 아이디가 메일로 발송되었습니다.");
		} else {
			model.addAttribute("sendId", "전체 아이디가 메일로 발송 실패되었습니다.");
		}
		return "/member/login";
	}
}
