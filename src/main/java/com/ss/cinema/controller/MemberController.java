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
import com.ss.cinema.service.MainService;
import com.ss.cinema.service.MemberService;
import com.ss.cinema.service.mypage.myStampService;

@Controller
public class MemberController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private MainService mainService;
	
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
		if (member == null) {
			model.addAttribute("loginNull", "존재하지 않는 회원입니다.");
			return "/member/login";
		} else if (member != null && member.isMemberAdmin()) {
			String sessionId = member.getMemberId();
			session.setAttribute("admin", member);
			session.setAttribute("sessionId", sessionId);
			return "redirect:/";
		} else {
			String sessionId = member.getMemberId();
			Integer countBasket = mainService.countBasket(sessionId);
			if(countBasket != null && countBasket > 0) {
				session.setAttribute("countBasket", countBasket);
			}
			session.setAttribute("member", member);
			session.setAttribute("sessionId", sessionId);
			return "redirect:/";
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("sessionId");
		session.removeAttribute("admin");
		session.removeAttribute("member");
		session.removeAttribute("countBasket");
		return "redirect:/";
	}

//	SNS 카카오 로그인
	@RequestMapping("/kakaoLogin")
	public String kakaoLogin(Model model, HttpSession session, String code) {
		String token = service.getKakaoToken(code);
		Map<String, String> kakaoInfo = service.getKakaoUserInfo(token);
		MemberDTO member = service.snsLogin(kakaoInfo);
		if (member == null) {
			model.addAttribute("snsLogin", "존재하지 않는 회원입니다. 회원가입을 먼저 진행해주세요.");
			service.kakaoUnlink(token);
			appKey appKey = new appKey();
			model.addAttribute("naverUrl", appKey.getNaver_href());
			model.addAttribute("kakaoUrl", appKey.getKakao_href());
			model.addAttribute("googleUrl", appKey.getGoogle_href());
			return "/member/joinTos";
		} else {
			String sessionId = member.getMemberId();
			session.setAttribute("sessionId", sessionId);
			service.kakaoUnlink(token);
			return "redirect:/";
		}
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
			service.naverUnlink(token);
			return "redirect:/";
		} else {
			model.addAttribute("snsLogin", "존재하지 않는 회원입니다. 회원가입을 먼저 진행해주세요.");
			service.naverUnlink(token);
			return "/member/joinTos";
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
			return "/member/joinTos";
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
			@RequestParam String name, @RequestParam String phone) {
		int num = service.join(id, password, email, name, phone);
		String msg;
		if (num > 0) {
			msg = "회원가입이 성공적으로 완료되었습니다.";
			model.addAttribute("joinMsg", msg);
			appKey appKey = new appKey();
			model.addAttribute("naverUrl", appKey.getNaver_href());
			model.addAttribute("kakaoUrl", appKey.getKakao_href());
			model.addAttribute("googleUrl", appKey.getGoogle_href());
			return "/member/login";
		} else {
			msg = "회원가입이 실패하였습니다.";
			model.addAttribute("joinMsg", msg);
			return "/member/joinTos";
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
