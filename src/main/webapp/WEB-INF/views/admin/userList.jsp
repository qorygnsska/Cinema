<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 리스트</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        .form-inline {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
            align-items: center;
            
    
       
        }
       .search-container {
            text-align: right;
            margin-bottom: 20px;
        }
        .search-form {
            display: inline-block;
        }
        
        .form-inline input {
            margin-right: 10px;
            padding: 5px;
            font-size: 16px;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination a {
            margin: 0 5px;
            padding: 5px 10px;
            border: 1px solid #ddd;
            text-decoration: none;
            color: #333;
        }
        .pagination a.active {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }
        .pagination a:hover {
            background-color: #ddd;
        }
        .btn {
            padding: 5px 10px;
            margin-right: 5px;
            border: 1px solid #ddd;
            text-decoration: none;
            color: #333;
            background-color: #f8f8f8;
        }
        .btn:hover {
            background-color: #ddd;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>회원 리스트</h1>
    <form method="get" action="${pageContext.request.contextPath}/admin/userList" class="form-inline display-arign">
        <input type="text" name="search" placeholder="유저 이름 검색" value="${param.search}">
        <button type="submit" class="btn">검색</button>
    </form>
    <table>
        <thead>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>비밀번호</th>
                <th>성별</th>
                <th>주민등록번호</th>
                <th>전화번호</th>
                <th>이메일</th>
                <th>쿠폰</th>
                <th>관리자</th>
                <th>스탬프</th>
                <th>액션</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="member" items="${members}">
                <tr>
                    <td>${member.memberId}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberPassword}</td>
                    <td>${member.memberGender}</td>
                    <td>${member.memberJumin}</td> <!-- 여기 필드 확인 -->
                    <td>${member.memberPhone}</td>
                    <td>${member.memberEmail}</td>
                    <td>${member.memberCoupon}</td>
                    <td>${member.memberAdmin}</td>
                    <td>${member.memberStamp}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/editUser?id=${member.memberId}" class="btn btn-warning btn-sm">수정</a>
                        <a href="${pageContext.request.contextPath}/admin/deleteUser?id=${member.memberId}" class="btn btn-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/admin/userList?page=${currentPage - 1}&search=${param.search}">이전</a>
        </c:if>
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="${pageContext.request.contextPath}/admin/userList?page=${i}&search=${param.search}" class="${i == currentPage ? 'active' : ''}">${i}</a>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="${pageContext.request.contextPath}/admin/userList?page=${currentPage + 1}&search=${param.search}">다음</a>
        </c:if>
    </div>
</div>
</body>
</html>
