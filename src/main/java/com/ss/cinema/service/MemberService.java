package com.ss.cinema.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.key.appKey;
import com.ss.cinema.mappers.MemberMapper;

import oracle.jdbc.driver.parser.Tuple;

@Service
public class MemberService {

	appKey appKey = new appKey();
	
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

	public int join(String id, String password, String email, String name, String phone) {
		MemberDTO member = new MemberDTO(id, name, password, phone, email, 0, false, 0, "default.jpg");
		return mapper.join(member);
	}

	public MemberDTO findPw(String name, String id, String email) {
		MemberDTO dto = new MemberDTO();
		dto.setMemberName(name);
		dto.setMemberId(id);
		dto.setMemberEmail(email);
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
		String content = "<strong>JERRY - 전체 아이디</strong>" + "<br><br>" + member.getMemberName() + "님의" + " 전체 아이디는 \" "
				+ member.getMemberId() + " \" 입니다.";

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

//	카카오로그인 토큰 요청
	public String getKakaoToken(String code) {
		String host = "https://kauth.kakao.com/oauth/token";
		String token = "";

		try {
			URL url = new URL(host);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id="+appKey.getKakao_client_id());
			sb.append("&redirect_uri=http://localhost:8090/cinema/kakaoLogin");
			sb.append("&code=" + code);
			sb.append("&client_secret="+appKey.getKakao_client_secret());

			bw.write(sb.toString());
			bw.flush();

			// 응답코드
			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			JSONParser parser = new JSONParser();
			JSONObject ele = (JSONObject) parser.parse(result);
			String access_token = (String) ele.get("access_token");

			token = access_token;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return token;
	}

//	카카오로그인 유저정보 요청
	public Map<String, String> getKakaoUserInfo(String token) {
		String host = "https://kapi.kakao.com/v2/user/me";
		String email = "";
		String phone = "";
		Map<String, String> kakaoInfo = new HashMap<String, String>();
		try {
			URL url = new URL(host);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + token);

			int responseCode = conn.getResponseCode();
			if (responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
				
				while ((line = br.readLine()) != null) {
					result += line;
				}

				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(result);
				
				JSONObject account = (JSONObject) obj.get("kakao_account");
				email = (String) account.get("email");
				phone = (String) account.get("phone_number");
				String[] phoneBefore = phone.split(" ");
				phone = "0"+phoneBefore[1];
				kakaoInfo.put("email", email);
				kakaoInfo.put("phone", phone);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return kakaoInfo;
	}

//	네이버로그인 토큰 요청
	public String getNaverToken(String code) {
		String client_id = appKey.getNaver_client_id();
		String Client_Secret = appKey.getNaver_Client_Secret();
		String token = "";

		try {
			String host = "https://nid.naver.com/oauth2.0/token";

			URL url = new URL(host);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=" + client_id);
			sb.append("&client_secret=" + Client_Secret);
			sb.append("&code=" + code);
			sb.append("&state=test");

			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);
			token = (String) obj.get("access_token");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return token;
	}

//	네이버로그인 유저정보 요청
	public Map<String, String> getNaverUserInfo(String token) {
		String host = "https://openapi.naver.com/v1/nid/me";
		String email = "";
		String phone = "";
		Map<String, String> userInfo = new HashMap<String, String>();
		try {
			URL url = new URL(host);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer " + token);

			int responseCode = con.getResponseCode();

			if (responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String line = "";
				String result = "";

				while ((line = br.readLine()) != null) {
					result += line;
				}

				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(result);
				JSONObject response = (JSONObject) obj.get("response");
				email = (String) response.get("email");
				phone = (String) response.get("mobile");
				userInfo.put("email", email);
				userInfo.put("phone", phone);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userInfo;
	}

//	sns로그인 회원 조회
	public MemberDTO snsLogin(Map<String, String> snsInfo) {
		return mapper.snsLogin(snsInfo);
	}

//	구글로그인 토큰 요청
	public String getGoogleToken(String code) {
		String token = "";
		String host = "https://oauth2.googleapis.com/token";
		String client_id = appKey.getGoogle_client_id();

		try {
			URL url = new URL(host);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

			StringBuilder sb = new StringBuilder();
			sb.append("code=" + code);
			sb.append("&client_id=" + client_id);
			sb.append("&client_secret="+appKey.getGoogle_client_secret());
			sb.append("&redirect_uri=http://localhost:8090/cinema/GoogleLogin");
			sb.append("&grant_type=authorization_code");

			bw.write(sb.toString());
			bw.flush();

			int responseCode = conn.getResponseCode();

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}

			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject) parser.parse(result);
			token = (String) obj.get("access_token");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return token;
	}

//	구글로그인 유저정보 요청
	public String getGoogleUserInfo(String token) {
		String host = "https://www.googleapis.com/userinfo/v2/me";
		String email = "";
		
		try {
			URL url = new URL(host);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer " + token);
			
			int responseCode = con.getResponseCode();
			
			if(responseCode == 200) {
				BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String line = "";
				String result = "";
				
				while((line = br.readLine()) != null ) {
					result += line;
				}
				
				JSONParser parser = new JSONParser();
				JSONObject obj = (JSONObject) parser.parse(result);
				email = (String) obj.get("email");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return email;
	}
	
//	카카오 로그인 토큰 삭제
	public void kakaoUnlink(String token) {
		String host = "https://kapi.kakao.com/v1/user/unlink";

		try {
			// 위에 있는 String을 url 객체로 생성
			URL url = new URL(host);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();

			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", "Bearer " + token);

			int responseCode = con.getResponseCode();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
//	네이버 로그인 토큰 삭제
	public void naverUnlink(String token) {
		String host = "https://nid.naver.com/oauth2.0/token";
		host += "?grant_type=delete";
		host += "&client_id="+appKey.getNaver_client_id();
		host += "&client_secret="+appKey.getNaver_Client_Secret();
		host += "&access_token="+token;
		
		try {
			URL url = new URL(host);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			
			int responseCode = con.getResponseCode();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
