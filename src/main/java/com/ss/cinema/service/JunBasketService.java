
package com.ss.cinema.service;

import com.ss.cinema.dto.JunBasketDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.mappers.JunBasketMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class JunBasketService {

    @Autowired
    private JunBasketMapper JunBasketMapper;

    public List<JunBasketDTO> getBasketItemsByMemberId(String memberId) {
        return JunBasketMapper.selectBasketItemsByMemberId(memberId);
    }

    public void deleteBasketItemBySessionAndBasketNo(String sessionId, int basketNo) {
        // 자식 테이블의 레코드 먼저 삭제
        JunBasketMapper.deleteChildRecordsByBasketNo(basketNo);
        // 부모 테이블(BASKET)의 레코드 삭제
        JunBasketMapper.deleteBasketItemBySessionAndBasketNo(sessionId, basketNo);
    }
    
    
    
    public void deleteBasketItemBySessionAndBasketNos(String sessionId, int basketNo) {
        // 먼저 자식 테이블에서 해당 BASKET_NO와 관련된 레코드 삭제
        JunBasketMapper.deletePaymentProductsByBasketNos(basketNo);

        // 그런 다음 부모 테이블(BASKET)에서 해당 레코드 삭제
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("sessionId", sessionId);
        params.put("basketNo", basketNo);
        JunBasketMapper.deleteBasketItemBySessionAndBasketNos(params);
    }
    
    
    public MemberDTO getMemberInfo(String memberId) {
        return JunBasketMapper.getMemberInfo(memberId);
    }

    
    
    public void updateBasketQuantity(Long basketNo, int quantity) {
        JunBasketMapper.updateBasketQuantity(basketNo, quantity);
    }
    
    
    
    public void updateQuantities(Map<Long, Integer> basketQuantities) {
        for (Map.Entry<Long, Integer> entry : basketQuantities.entrySet()) {
            JunBasketMapper.updateBasketQuantity(entry.getKey(), entry.getValue());
        }
    }



    public List<JunBasketDTO> getBasketItemsByBasketNos(List<Long> basketNos) {
        System.out.println("Fetching basket items for basketNos: " + basketNos);
        return JunBasketMapper.getBasketItemsByBasketNos(basketNos);
    }

    
}