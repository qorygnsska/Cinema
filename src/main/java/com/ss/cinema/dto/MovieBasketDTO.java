package com.ss.cinema.dto;

import java.util.Date;

public class MovieBasketDTO {
    private int basketNo;        // 영화 찜 번호 (Primary Key)
    private int basketMemberId;  // 회원 ID (Foreign Key)
    private int basketMovieNo;   // 영화 번호 (Foreign Key)
    private Date basketDate;     // 찜한 날짜

    // Getters and Setters
    public int getBasketNo() {
        return basketNo;
    }

    public void setBasketNo(int basketNo) {
        this.basketNo = basketNo;
    }

    public int getBasketMemberId() {
        return basketMemberId;
    }

    public void setBasketMemberId(int basketMemberId) {
        this.basketMemberId = basketMemberId;
    }

    public int getBasketMovieNo() {
        return basketMovieNo;
    }

    public void setBasketMovieNo(int basketMovieNo) {
        this.basketMovieNo = basketMovieNo;
    }

    public Date getBasketDate() {
        return basketDate;
    }

    public void setBasketDate(Date basketDate) {
        this.basketDate = basketDate;
    }
}