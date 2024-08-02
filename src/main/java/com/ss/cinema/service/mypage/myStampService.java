package com.ss.cinema.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.mappers.mypage.myStampMapper;

@Service
public class myStampService {
	
	@Autowired
	myStampMapper myStampmapper;

	public MemberDTO getStmap(String id) {
		
		MemberDTO member = myStampmapper.selectMember(id);
		
		return member;
	}

}
