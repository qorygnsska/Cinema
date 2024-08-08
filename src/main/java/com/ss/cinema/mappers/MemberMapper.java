package com.ss.cinema.mappers;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.MemberDTO;

@Mapper
public interface MemberMapper {

//	아이디 찾기
	MemberDTO findId(Map<String, String> info);

//	로그인
	MemberDTO login(Map<String, String> loginInfo);

//	회원가입 아이디 중복체크
	int checkId(String id);

//	회원가입 이메일 중복체크
	int checkEmail(String email);

//	회원가입
	int join(MemberDTO member);

//	비밀번호 찾기 시 회원 조회
	MemberDTO findPw(MemberDTO dto);

}
