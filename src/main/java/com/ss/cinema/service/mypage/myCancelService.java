package com.ss.cinema.service.mypage;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.ss.cinema.key.appKey;

@Service
public class myCancelService {

	public boolean cancel(String uid) {
		// 결제 취소 api
		appKey key = new appKey();
		String imkey = key.getImport_restAPI_key(); // appKey 클래스에서 API 키 가져오기
		String imsecret = key.getImport_restAPI_secret(); // appKey 클래스에서 시크릿 키 가져오기

		// API 요청을 위한 JSON 문자열 생성
		String tokenBody = String.format("{\"imp_key\":\"%s\",\"imp_secret\":\"%s\"}", imkey, imsecret);
		String cancelBody = String.format("{\"imp_uid\":\"%s\",\"reason\":\"단순변심\"}", uid);

		// 토큰 요청
		HttpRequest token_request = HttpRequest.newBuilder().uri(URI.create("https://api.iamport.kr/users/getToken"))
				.header("Content-Type", "application/json")
				.method("POST", HttpRequest.BodyPublishers.ofString(tokenBody)).build();

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
			String accessToken = (String) responseObject.get("access_token"); // 토큰 추출

			System.out.println("Access Token: " + accessToken);

			// 취소 요청
			HttpRequest cancel_request = HttpRequest.newBuilder()
					.uri(URI.create("https://api.iamport.kr/payments/cancel"))
					.header("Content-Type", "application/json").header("Authorization", accessToken)
					.method("POST", HttpRequest.BodyPublishers.ofString(cancelBody)).build();

			cancel_response = HttpClient.newHttpClient().send(cancel_request, HttpResponse.BodyHandlers.ofString());
			String cancel_responseBody = cancel_response.body();

			System.out.println(cancel_responseBody);

		} catch (Exception e) {
			System.out.println("에러났어용!!");
			e.printStackTrace();
			return false;
		}

		return true;
	}
}
