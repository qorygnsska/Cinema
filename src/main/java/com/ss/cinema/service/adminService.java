package com.ss.cinema.service;

import com.ss.cinema.dto.CinemaDTO;
import com.ss.cinema.dto.MemberDTO;
import com.ss.cinema.dto.ProductDTO;
import com.ss.cinema.dto.TheaterDTO;
import com.ss.cinema.dto.movieDTO;
import com.ss.cinema.mappers.adminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

    public MemberDTO getMemberById(String id) {
        return adminMapper.getMemberById(id);
    }

    public void updateMember(MemberDTO member) {
        adminMapper.updateMember(member);
    }

    public boolean deleteMember(String memberId) {
        try {
            // 1. 예매 내역 삭제
            adminMapper.deleteTicketsByMemberId(memberId);

            // 2. 리뷰 삭제
            adminMapper.deleteReviewsByMemberId(memberId);

            // 3. 제품 결제 내역 삭제
            adminMapper.deletePaymentProductsByMemberId(memberId);

            // 4. 결제 내역 삭제 (회원과 관련된 결제 데이터)
            adminMapper.deletePaymentsByMemberId(memberId);

            // 5. 장바구니 항목 삭제
            adminMapper.deleteBasketsByMemberId(memberId);

            // 6. 회원 삭제
            adminMapper.deleteMember(memberId);

            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
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
       
        int generatedCinemaNo =  adminMapper.getCinemaNo(cinemaDTO); // 생성된 키를 가져옴
        int movieShowTime = adminMapper.getMovieShowTime(cinemaDTO.getCinemaMovieNo());
        System.out.println("generatedCinemaNo" + generatedCinemaNo);
        System.out.println("movieShowTime" + movieShowTime);
        theaterDTO.setTheaterCinemaNo(generatedCinemaNo); // TheaterDTO에 설정
        
        
        // 날짜와 시간을 결합하여 theaterStartTime을 업데이트
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String cinemaDate = new SimpleDateFormat("yyyy-MM-dd").format(cinemaDTO.getCinemaScreenDate());
        String startTime = new SimpleDateFormat("HH:mm:ss").format(theaterDTO.getTheaterStartTime());

        Date updatedStartTime = null;
        Date updatedEndTime = null;
        try {
            updatedStartTime = sdf.parse(cinemaDate + " " + startTime);
            System.out.println("updatedStartTime: " + updatedStartTime);
            
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(updatedStartTime);
            calendar.add(Calendar.MINUTE, movieShowTime); // 상영 시간을 더함

            updatedEndTime = calendar.getTime();
            System.out.println("updatedEndTime: " + updatedEndTime);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("theaterDTO2 : " + theaterDTO);

        theaterDTO.setTheaterStartTime(updatedStartTime);
        theaterDTO.setTheaterEndTime(updatedEndTime);
        
        
        
        adminMapper.addTheater(theaterDTO); // THEATER 테이블에 데이터를 삽입
    
    }

    public List<TheaterDTO> getMovieSchedule(Integer movieNo, String cinemaRLG, String cinemaBLG, String cinemaScreenDate, String theaterName) {
        // Mapper를 통해 데이터 조회
        return adminMapper.getMovieScheduleDetails(movieNo, cinemaRLG, cinemaBLG, cinemaScreenDate, theaterName);
    }

    public boolean deleteSchedule(int theaterNo) {
        // 순차적으로 삭제
        adminMapper.deleteSeatsByTheaterNo(theaterNo);
        adminMapper.deleteTicketsByTheaterNo(theaterNo);
        int result = adminMapper.deleteTheater(theaterNo);

        // 삭제가 성공했는지 여부 반환
        return result > 0;
    }

    public List<MemberDTO> searchMembersByIdOrName(String keyword, int page, int pageSize) {
        int offset = (page - 1) * pageSize;
        return adminMapper.searchMembersByIdOrName(keyword, offset, pageSize);
    }

    public long countMembersByIdOrName(String keyword) {
        return adminMapper.countMembersByIdOrName(keyword);
    }


    
    @Transactional
    public void deleteMovie(int movieNo) {
        // 1. TICKET 테이블에서 관련된 예매 기록 삭제
        adminMapper.deleteTicketsByMovieNo(movieNo);

        // 2. REVIEW 테이블에서 관련된 리뷰 삭제
        adminMapper.deleteReviewsByMovieNo(movieNo);

        // 3. SEAT 테이블에서 관련된 좌석 삭제
        adminMapper.deleteSeatsByTheaterNo2(movieNo);

        // 4. THEATER 테이블에서 관련된 상영관 삭제
        adminMapper.deleteTheatersByCinemaNo(movieNo);

        // 5. CINEMA 테이블에서 관련된 영화관 삭제
        adminMapper.deleteCinemasByMovieNo(movieNo);

        // 6. MOVIE 테이블에서 영화 삭제
        adminMapper.deleteMovie(movieNo);
    }
    
    
//영화리스트-검색기능
    public List<movieDTO> searchMovies(String search, int pageNumber, int pageSize) {
        int offset = (pageNumber - 1) * pageSize;
        return adminMapper.searchMovies(search, offset, pageSize);
    }

    public int countSearchResults(String search) {
        return adminMapper.countSearchResults(search);
    }
    
    
    
    }
    

    










//public List<MemberDTO> getAllMembers() {
//	System.out.println("adminService.getallmembers");
//    return adminMapper.getAllMembers();
//}
