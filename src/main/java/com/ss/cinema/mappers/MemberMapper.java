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

}