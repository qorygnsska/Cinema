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

    public List<CinemaDTO> getAllCinemas() {
        return adminMapper.getAllCinemas();
    }

    public void addSchedule(TheaterDTO schedule) {
        adminMapper.addSchedule(schedule);
    }

    public List<TheaterDTO> getAllSchedules() {
        return adminMapper.getAllSchedules();
    }
    
    public boolean isMovieTitleExists(String movieTitle) {
        Integer count = adminMapper.countByMovieTitle(movieTitle);
        return count != null && count > 0;
    }

}









//public List<MemberDTO> getAllMembers() {
//	System.out.println("adminService.getallmembers");
//    return adminMapper.getAllMembers();
//}
