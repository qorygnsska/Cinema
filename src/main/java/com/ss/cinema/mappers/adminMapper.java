package com.ss.cinema.mappers;


import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.dto.MemberDTO;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface adminMapper {
    // 영화 추가
    void addMovie(movieDTO movie);

    // 제품 추가
    void addProduct(ProductDTO product);

//     //회원 조회
   
    List<MemberDTO> getAllMembers();
    List<MemberDTO> getAllMembers(@Param("offset") int offset, @Param("limit") int limit);
    long countAllMembers();

    List<MemberDTO> searchMembersByName(@Param("name") String name, @Param("offset") int offset, @Param("limit") int limit);
    long countMembersByName(@Param("name") String name);

    MemberDTO getMemberById(@Param("id") Long id);
    void updateMember(MemberDTO member);
    void deleteMember(@Param("id") Long id);
}


