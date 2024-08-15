
package com.ss.cinema.service;

import com.ss.cinema.dto.JunBasketDTO;
import com.ss.cinema.mappers.JunBasketMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JunBasketService {

    @Autowired
    private JunBasketMapper JunBasketMapper;

    public List<JunBasketDTO> getBasketItemsByMemberId(String memberId) {
        return JunBasketMapper.selectBasketItemsByMemberId(memberId);
    }

    public void deleteBasketItem(int basketNo) {
    	JunBasketMapper.deleteBasketItem(basketNo);
    }
}