package com.ss.cinema.mappers.mypage;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface myEditMapper {
	
	void editMember(String id, String pw, String phone);
}
