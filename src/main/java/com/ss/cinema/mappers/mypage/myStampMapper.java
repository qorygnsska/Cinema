package com.ss.cinema.mappers.mypage;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.MemberDTO;

@Mapper
public interface myStampMapper {
	
	MemberDTO selectMember(String id);
}
