package com.ss.cinema.controller.mypage;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.MyMovieDTO;
import com.ss.cinema.key.appKey;
import com.ss.cinema.service.mypage.myMovieService;
import com.ss.cinema.service.mypage.myStampService;

@Controller
public class myMovieController {

	@Autowired
	private myStampService myStampservice;
	@Autowired
	private myMovieService myMovieservice;

	@RequestMapping("/myMovie")
	public String myMovie(Model model, HttpSession session, @RequestParam(value = "page", defaultValue = "1") int page, RedirectAttributes redirectAttributes) {

		String sessionId = (String)session.getAttribute("sessionId");
		
		// 로그인 체크
		if(sessionId == null) {
			redirectAttributes.addFlashAttribute("loginMessage", "로그인 상태가 아닙니다!"); 
			return "redirect:/login";
		}
				
		// 로그인 아이디 멤버 정보 가져오기
		MemberDTO member = myStampservice.getStmap(sessionId);

		// 스탬프 개수 9와 비교
		if (member.getMemberStamp() >= 9) {
			member.setMemberStamp(member.getMemberStamp() - 9);
			member.setMemberCoupon(member.getMemberCoupon() + 1);

			// 스탬프, 쿠폰 개수 수정해서 업데이트
			myStampservice.setCoupon(member);
		}
		model.addAttribute("member", member);
		
		// 영화 예매내역 가져오기
		List<MyMovieDTO> moviepayment = myMovieservice.getMoviePayment(sessionId);
		
		model.addAttribute("moviepayment", moviepayment);
		
		// 페이지네이션
		int pageSize = 5; // 페이지에서 보여 줄 데이터의 수
		int totalPages = (int) Math.ceil((double) moviepayment.size() / pageSize);
		
		// 페이지당 영화 예매내역 가져오기
		List<MyMovieDTO> pagemoviepayment = myMovieservice.getPageMoviePayment(page, pageSize, sessionId);
		model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("pagemoviepayment", pagemoviepayment);

		return "mypage/myMovie";
	}
	
	
	
	@RequestMapping("/cancelticket")
	public String cancelTicket(int tno, int pno, String seat, int tt, int ta, int ts, int theater, String uid, HttpSession session, RedirectAttributes redirectAttributes) {
		
		myMovieservice.deleteTicket(tno); // 티켓 지우기
		myMovieservice.deletePayment(pno); // 결제내역 지우기
		
		// 스탬프, 쿠폰 개수 재정의
		int count = tt + ta + ts;
		String sessionId = (String)session.getAttribute("sessionId");
		MemberDTO member = myStampservice.getStmap(sessionId);
		
		int coupon = member.getMemberCoupon();
		int stamp = member.getMemberStamp() - count;
		
		if(stamp < 0) {
			coupon -= 1;
			stamp += 9;
			member.setMemberCoupon(coupon);
			member.setMemberStamp(stamp);
			myStampservice.setCoupon(member);
		}else {
			member.setMemberStamp(stamp);
			myStampservice.setCoupon(member);
		}
		
		// 좌석 삭제
		String[] seatArray = seat.split(",\\s*");
		int[][] resultArray = new int[seatArray.length][2];
		 for (int i = 0; i < seatArray.length; i++) {
			    String rseat = seatArray[i];

			    char rowChar = rseat.charAt(0);
			    int rowNumber = rowChar - 65;

			    resultArray[i][0] = rowNumber;
			    resultArray[i][1] = Integer.parseInt(seat.substring(1)) -1;
			 }
		 for(int row = 0; row < resultArray.length; row++) {
			 	myMovieservice.deleteSeat(resultArray[row][0],resultArray[row][1], theater); // 좌석 삭제
			 }
		 
		 
		 // 결제 취소 api
		 appKey key = new appKey();
		 String imkey = key.getImport_restAPI_key();   // appKey 클래스에서 API 키 가져오기
		 String imsecret = key.getImport_restAPI_secret(); // appKey 클래스에서 시크릿 키 가져오기
		    
		 // API 요청을 위한 JSON 문자열 생성
		 String tokenBody = String.format("{\"imp_key\":\"%s\",\"imp_secret\":\"%s\"}", imkey, imsecret);
		 String cancelBody = String.format("{\"imp_uid\":\"%s\",\"reason\":\"단순변심\"}", uid);

		 // 토큰 요청
		 HttpRequest token_request = HttpRequest.newBuilder()
		         .uri(URI.create("https://api.iamport.kr/users/getToken"))
		         .header("Content-Type", "application/json")
		         .method("POST", HttpRequest.BodyPublishers.ofString(tokenBody))
		         .build();
		    
		   

		 // HttpClient를 사용해 요청 보내기
		 HttpResponse<String> token_response;
		 HttpResponse<String> cancel_response;
		 try {
			 // 토큰
		     token_response = HttpClient.newHttpClient().send(token_request, HttpResponse.BodyHandlers.ofString());
		     String token_responseBody = token_response.body();
		        
		     JSONParser parser = new JSONParser();
		     JSONObject jsonObject = (JSONObject) parser.parse(token_responseBody);
		     JSONObject responseObject = (JSONObject) jsonObject.get("response");
		     String accessToken = (String) responseObject.get("access_token");  // 토큰 추출

		     System.out.println("Access Token: " + accessToken);
		        
		     // 취소 요청		    
			 HttpRequest cancel_request = HttpRequest.newBuilder()
		        	 .uri(URI.create("https://api.iamport.kr/payments/cancel"))
		        	 .header("Content-Type", "application/json")
		        	 .header("Authorization", accessToken)
		        	 .method("POST", HttpRequest.BodyPublishers.ofString(cancelBody))
		        	 .build();
			    
		     cancel_response = HttpClient.newHttpClient().send(cancel_request, HttpResponse.BodyHandlers.ofString());
		     String cancel_responseBody = cancel_response.body();
		        
		     System.out.println(cancel_responseBody);
		     
		     redirectAttributes.addFlashAttribute("cancelMessage", "결제 취소가 완료되었습니다!"); 
		        
		        
		    } catch (Exception e) {
		    	System.out.println("에러났어용!!");
		        e.printStackTrace();
		    }
		
		return "redirect:/myMovie";
	}
}
