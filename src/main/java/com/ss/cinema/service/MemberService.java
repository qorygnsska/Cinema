package com.ss.cinema.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.mappers.MemberMapper;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
//	아이디 찾기
	public MemberDTO findId(Map<String, String> info) {
		return mapper.findId(info);
	}

//	로그인
	public MemberDTO login(Map<String, String> loginInfo) {
		System.out.println(loginInfo.get("id"));
		System.out.println(loginInfo.get("pw"));
		MemberDTO member = mapper.login(loginInfo);
		return mapper.login(loginInfo);
	}

}
