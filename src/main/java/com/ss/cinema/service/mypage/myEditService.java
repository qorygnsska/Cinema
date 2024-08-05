package com.ss.cinema.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.mappers.mypage.myEditMapper;


@Service
public class myEditService {
	
	@Autowired
	private myEditMapper myEditmapper;
	
	// 회원정보수정
	public void editMember(String id, String pw, String phone) {
		myEditmapper.editMember(id, pw, phone);
		
	}

}
