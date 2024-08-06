package com.ss.cinema.mappers.mypage;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ss.cinema.dto.MyProductDTO;

@Mapper
public interface myProductMapper {
	List<MyProductDTO> getProPayment(String id);
}
