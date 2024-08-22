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

    @Transactional
    public void deleteMember(String memberId) {
        // 먼저 좋아요 데이터를 삭제
        adminMapper.deleteLikesByMemberId(memberId);
        
        // 그 후 리뷰 데이터를 삭제
        adminMapper.deleteReviewsByMemberId(memberId);
        
        // 장바구니 데이터를 삭제
        adminMapper.deleteBasketsByMemberId(memberId);
        
        // 티켓 데이터를 삭제
        adminMapper.deleteTicketsByMemberId(memberId);
        
        // 결제 데이터를 삭제
        adminMapper.deletePaymentsByMemberId(memberId);
        
        // 마지막으로 회원 데이터를 삭제
        adminMapper.deleteMember(memberId);
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
    @Transactional
    public void deleteProduct(int productId) {
        // 1. PAYMENT_PRODUCT 테이블에서 관련 레코드 삭제
        adminMapper.deletePaymentProductByBasketId(productId);

        // 2. BASKET 테이블에서 관련 레코드 삭제
        adminMapper.deleteBasketByProductId(productId);

        // 3. PRODUCT 테이블에서 제품 삭제
        adminMapper.deleteProduct(productId);}
    
    // 페이지에 따라 제품 목록을 가져오는 메서드
    public List<ProductDTO> getProducts(int pageNumber, int pageSize) {
    	  int offset = (pageNumber - 1) * pageSize + 1; 
        return adminMapper.getProducts(offset, pageSize);
    }

    // 전체 제품 수를 계산하는 메서드
    public long countProducts() {
        return adminMapper.countProducts();
    }
    
    
    
    //영화리스트 페이지구현 
    public List<movieDTO> getMovies(int pageNumber, int pageSize) {
        int offset = (pageNumber - 1) * pageSize;
        return adminMapper.getMoviesWithLimit(offset, pageSize);
    }

    public long countMovies() {
        return adminMapper.countAllMovies();
    }

 
    // 영화 상영 스케줄 추가
    public void addSchedule(CinemaDTO cinemaDTO, TheaterDTO theaterDTO) {
    	
    	int cinemaCheck = adminMapper.getCinemaCheck(cinemaDTO);
    	
    	if(cinemaCheck == 0) {
    		adminMapper.addCinema(cinemaDTO); // CINEMA 테이블에 데이터를 삽입하고 키를 생성
    	}
        
       
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
        // 좋아요를 먼저 삭제
        adminMapper.deleteLikesByReviewNo(movieNo);

        // 리뷰 삭제
        adminMapper.deleteReviewsByMovieNo(movieNo);

        // 좌석 삭제
        adminMapper.deleteSeatsByTheaterNo2(movieNo);

        // 티켓 삭제
        adminMapper.deleteTicketsByMovieNo(movieNo);

        // 상영관 삭제
        adminMapper.deleteTheatersByCinemaNo(movieNo);

        // 영화관 삭제
        adminMapper.deleteCinemasByMovieNo(movieNo);

        // 마지막으로 영화 자체를 삭제
        adminMapper.deleteMovie(movieNo);
    }
    
    
    
    }
    

    










//public List<MemberDTO> getAllMembers() {
//	System.out.println("adminService.getallmembers");
//    return adminMapper.getAllMembers();
//}
