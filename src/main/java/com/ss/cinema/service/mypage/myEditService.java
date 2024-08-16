package com.ss.cinema.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.mappers.mypage.myEditMapper;


@Service
public class myEditService {
	
	@Autowired
	private myEditMapper myEditmapper;
	
	// 회원정보수정
	public void editMember(MemberDTO member) {
		myEditmapper.editMember(member);
		
	}
	
	
	// 프사 변경
	public void updateImg(MemberDTO member) {
		
		myEditmapper.updateImg(member);
		
	}

}
