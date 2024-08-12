package com.ss.cinema.service;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.mappers.adminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class adminService {

    @Autowired
    private adminMapper adminMapper;

    public List<MemberDTO> getAllMembers() {
        return adminMapper.getAllMembers();
    }

    public List<MemberDTO> getAllMembers(int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return adminMapper.getAllMembers(offset, pageSize);
    }

    public long countAllMembers() {
        return adminMapper.countAllMembers();
    }

    public List<MemberDTO> searchMembersByName(String name, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return adminMapper.searchMembersByName(name, offset, pageSize);
    }

    public long countMembersByName(String name) {
        return adminMapper.countMembersByName(name);
    }

    public MemberDTO getMemberById(Long id) {
        return adminMapper.getMemberById(id);
    }

    public void updateMember(MemberDTO member) {
        adminMapper.updateMember(member);
    }

    public void deleteMember(Long id) {
        adminMapper.deleteMember(id);
    }

    public void addMovie(movieDTO movie) {
        adminMapper.addMovie(movie);
    }

    public void addProduct(ProductDTO product) {
        adminMapper.addProduct(product);
    }

    public List<movieDTO> getAllMovies() {
        return adminMapper.getAllMovies();
    }



    
    public boolean isMovieTitleExists(String movieTitle) {
        Integer count = adminMapper.countByMovieTitle(movieTitle);
        return count != null && count > 0;
    }
    public void deleteMovie(int movieNo) {
        adminMapper.deleteMovie(movieNo);
    }
//상품 찾기
    public List<ProductDTO> getAllProducts() {
        return adminMapper.getAllProducts();
    }
  //상품 삭제
    public void deleteProduct(int productId) {
        adminMapper.deleteProduct(productId);
    }
    //영화리스트 페이지구현 
    public List<movieDTO> getMovies(int pageNumber, int pageSize) {
        int offset = (pageNumber - 1) * pageSize;
        return adminMapper.getMoviesWithLimit(offset, pageSize);
    }

    public long countMovies() {
        return adminMapper.countAllMovies();
    }
    //productList 페이지구현 
    public List<ProductDTO> getProducts(int pageNumber, int pageSize) {
        int offset = (pageNumber - 1) * pageSize;
        return adminMapper.getProductsWithLimit(offset, pageSize);
    }

    public long countProducts() {
        return adminMapper.countAllProducts();
    }
 
    // 영화 상영 스케줄 추가
    public void addSchedule(CinemaDTO cinemaDTO, TheaterDTO theaterDTO) {
        adminMapper.addCinema(cinemaDTO); // CINEMA 테이블에 데이터를 삽입하고 키를 생성
        int generatedCinemaNo = cinemaDTO.getCinemaNo(); // 생성된 키를 가져옴
        theaterDTO.setTheaterCinemaNo(generatedCinemaNo); // TheaterDTO에 설정
        adminMapper.addTheater(theaterDTO); // THEATER 테이블에 데이터를 삽입
    }

    public List<TheaterDTO> getMovieSchedule(Integer movieNo, String cinemaRLG, String cinemaBLG, String cinemaScreenDate, String theaterName) {
        // Mapper를 통해 데이터 조회
        return adminMapper.getMovieScheduleDetails(movieNo, cinemaRLG, cinemaBLG, cinemaScreenDate, theaterName);
    }

    public void deleteSchedule(Integer theaterNo) {
        adminMapper.deleteSchedule(theaterNo);
    }
}









//public List<MemberDTO> getAllMembers() {
//	System.out.println("adminService.getallmembers");
//    return adminMapper.getAllMembers();
//}
