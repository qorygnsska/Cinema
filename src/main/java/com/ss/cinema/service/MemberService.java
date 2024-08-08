package com.ss.cinema.service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.mappers.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper mapper;

	@Autowired
	private JavaMailSenderImpl mailSender;

//	아이디 찾기
	public MemberDTO findId(Map<String, String> info) {
		return mapper.findId(info);
	}

//	로그인
	public MemberDTO login(Map<String, String> loginInfo) {
		MemberDTO member = mapper.login(loginInfo);
		return mapper.login(loginInfo);
	}

//	회원가입 아이디 중복체크
	public int checkId(String id) {
		return mapper.checkId(id);
	}

//	회원가입 이메일 중복체크
	public int checkEmail(String email) {
		return mapper.checkEmail(email);
	}

//	이메일 인증번호 발송 후 인증번호 반환
	public int emailAuth(String email) {
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		// 발신자 이메일 주소
		String setFrom = "pop0131@naver.com";

		// 수신자 이메일 주소
		String toMail = email;

		// 이메일 제목
		String title = "JERRY - 이메일 인증번호 입니다.";

		// 이메일 내용
		String content = "<strong>JERRY - 이메일 인증</strong>" + "<br><br>" + "인증 코드는 " + checkNum + " 입니다." + "<br>"
				+ "해당 인증코드를 인증코드 확인란에 입력해주세요.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			
			mailSender.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return checkNum;
	}

	public int join(String id, String password, String email, String name, String gender, String ssn1, String ssn2,
			String phone) {
		String memberJumin = ssn1+ssn2;
		MemberDTO member = new MemberDTO(id, name, password, gender, memberJumin, phone, email, 0, false, 0);
		return mapper.join(member);
	}

	public MemberDTO findPw(String name, String id, String email) {
		MemberDTO dto = new MemberDTO();
		dto.setMemberName(name);
		dto.setMemberId(id);
		dto.setMemberEmail(email);
		System.out.println("service의 결과 dto : "+dto);
		return mapper.findPw(dto);
	}

	public int resetPw(String email, String newPw) {
		Map<String, String> resetPwInfo = new HashMap<String, String>();
		resetPwInfo.put("email", email);
		resetPwInfo.put("newPw", newPw);
		return mapper.resetPw(resetPwInfo);
	}
	
//	전체 아이디 메일 발송
	public int sendId(MemberDTO member) {
		int result;

		// 발신자 이메일 주소
		String setFrom = "pop0131@naver.com";

		// 수신자 이메일 주소
		String toMail = member.getMemberEmail();

		// 이메일 제목
		String title = "JERRY - 전체 아이디입니다.";

		// 이메일 내용
		String content = "<strong>JERRY - 전체 아이디</strong>" + "<br><br>" + member.getMemberName()+"님의"
				+ " 전체 아이디는 \" " + member.getMemberId() + " \" 입니다.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
			
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(content, true);
			
			mailSender.send(message);
			result = 1;
		} catch (Exception e) {
			result = 0;
			e.printStackTrace();
		}
		return result;
	}

	public MemberDTO selectByEmail(String email) {
		return mapper.selectByEmail(email);
	}

}
