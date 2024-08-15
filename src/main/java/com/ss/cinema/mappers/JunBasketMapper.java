package com.ss.cinema.mappers;

import com.ss.cinema.dto.JunBasketDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface JunBasketMapper {

    // 특정 회원의 장바구니 항목들을 조회
    List<JunBasketDTO> selectBasketItemsByMemberId(String memberId);

    // 장바구니 항목을 삭제
    void deleteBasketItem(int basketNo);
}