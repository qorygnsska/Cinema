package com.ss.cinema.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.mappers.mypage.myStampMapper;

@Service
public class myStampService {
	
	@Autowired
	private myStampMapper myStampmapper;

	// 스탬프 개수 가져오기
	public MemberDTO getStmap(String id) {
		
		return myStampmapper.getStamp(id);
	}
	
	// 스탬프 9개 넘으면 쿠폰 +1 추가, 스탬프 -9
	public void setCoupon(MemberDTO member) {
		
		myStampmapper.setCoupon(member);
	}

}
