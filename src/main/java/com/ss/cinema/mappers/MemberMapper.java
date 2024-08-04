package com.ss.cinema.mappers;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.MemberDTO;

@Mapper
public interface MemberMapper {

	MemberDTO findId(Map<String, String> info);

}
