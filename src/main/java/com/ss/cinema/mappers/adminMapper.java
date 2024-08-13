package com.ss.cinema.mappers;


import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.MemberDTO;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface adminMapper {
    // 영화 추가
    void addMovie(movieDTO movie);
    //영화제목 중복 체크
    int countByMovieTitle(String movieTitle);
    
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
    

    // 영화 조회
    List<movieDTO> getAllMovies();

    // 영화관 조회
    List<CinemaDTO> getAllCinemas();

 // 영화 상영 스케줄 추가 (Cinema 테이블)
    void addCinema(CinemaDTO cinemaDTO);

    // 상영관 정보 추가 (Theater 테이블)
    void addTheater(TheaterDTO theaterDTO);

    // 영화 상영 스케줄을 가져오는 메서드
    List<TheaterDTO> getMovieScheduleDetails(
        @Param("movieNo") Integer movieNo,
        @Param("cinemaRLG") String cinemaRLG,
        @Param("cinemaBLG") String cinemaBLG,
        @Param("cinemaScreenDate") String cinemaScreenDate,
        @Param("theaterName") String theaterName
    );
    //영화 삭제
    void deleteMovie(int movieNo);
    
    //영화 수정 및 업데이트 
    movieDTO getMovieById(int movieNo);
    void updateMovie(movieDTO movie);
    //movie 페이지
    List<movieDTO> getMoviesWithLimit(@Param("offset") int offset, @Param("limit") int limit);
    Long countAllMovies();

//상품 정보 가져오기, 삭제
    List<ProductDTO> getAllProducts();

    void deleteProduct(int productId);
    
    // 페이징을 적용한 상품 목록 조회
    List<ProductDTO> getProductsWithLimit(@Param("offset") int offset, @Param("limit") int limit);

    // 전체 상품 개수 조회
    long countAllProducts();
    
    
    //상영일정표 삭제 
    void deleteSchedule(Integer theaterNo);
    
//    //상영시간 중복 체크
//    int countOverlappingSchedules(@Param("cinemaScreenDate") Date cinemaScreenDate,
//            @Param("theaterStartTime") Date theaterStartTime,
//            @Param("theaterEndTime") Date theaterEndTime,
//            @Param("theaterName") String theaterName);
}
    



