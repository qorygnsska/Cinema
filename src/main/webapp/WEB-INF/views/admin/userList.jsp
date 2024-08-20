<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 리스트</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .table-hover tbody tr:hover {
            background-color: #fdd000;
        }
        .btn-custom {
            background-color: #fdd000 !important;
            color: white !important;
            border-color: #fdd000 !important;
              outline: none !important;
        }
        .btn-custom:hover {
            background-color: #e6c200 !important;
            border-color: #e6c200 !important;
              outline: none !important;
        }
        .btn-custom:focus,
        .btn-custom:active{
         outline: none !important;
            box-shadow: none !important;
            border-color: #fdd000 !important;
        }
        .pagination {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    padding: 10px 25px; 
}
.pagination a {
	display: flex;
	justify-content: center;
	margin: 0 5px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	text-decoration: none;
	color: #333;
}

        .pagination a.active {
            background-color: #fdd000;
            color: white;
            border: 1px solid #fdd000;
        }
        .pagination a:hover {
            background-color: #e6c200;
        }
        .btn-primary.custom:focus,
        .btn-outline-primary.custom:focus,
        .btn-primary.custom:active,
        .btn-outline-primary.custom:active {
            outline: none;
            box-shadow: none;
            border-color: #fdd000;
        }
        th, td {
            font-size: 0.8rem; /* 영화 목록과 같은 크기로 조정 */
        }
        thead {
            background-color: #fdd000 !important;
        }
        .form-control:focus {
    outline: none; /* 아웃라인 제거 */
    box-shadow: none; /* 그림자 효과 제거 */
    border-color: #fdd000; /* 클릭 시 테두리 색상을 원하는 색으로 고정 */
}
    </style>
</head>
<body>

<div class="container-fluid mt-5">
    <div class="d-flex justify-content-between align-items-center mb-2">
        <h2>회원 리스트</h2>
   

    <form method="get" action="${pageContext.request.contextPath}/admin/userList" class="form-inline d-flex justify-content-end">
        <input type="text" name="search" placeholder="회원 이름 검색" value="${param.search}" class="form-control mr-2 ">
        <button type="submit" class="btn btn-custom">검색</button>
    </form>
</div>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                  <th style="background-color: #fdd000 !important;">아이디</th>
                <th style="background-color: #fdd000 !important;">이름</th>
                <th style="background-color: #fdd000 !important;">비밀번호</th>
                <th style="background-color: #fdd000 !important;">전화번호</th>
                <th style="background-color: #fdd000 !important;">이메일</th>
                <th style="background-color: #fdd000 !important;">쿠폰</th>
                <th style="background-color: #fdd000 !important;">관리자</th>
                <th style="background-color: #fdd000 !important;">스탬프</th>
                <th style="background-color: #fdd000 !important;">액션</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="member" items="${members}">
                <tr>
                    <td>${member.memberId}</td>
                    <td>${member.memberName}</td>
                    <td>${member.memberPassword}</td>           
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
        <a href="${pageContext.request.contextPath}/admin/adminMain?page=userList&pageNumber=${currentPage - 1}&search=${param.search}" class="pagination-btn">이전</a>
    </c:if>
    <c:forEach var="i" begin="1" end="${totalPages}">
        <a href="${pageContext.request.contextPath}/admin/adminMain?page=userList&pageNumber=${i}&search=${param.search}" class="pagination-btn ${i == currentPage ? 'active' : ''}">${i}</a>
    </c:forEach>
    <c:if test="${currentPage < totalPages}">
        <a href="${pageContext.request.contextPath}/admin/adminMain?page=userList&pageNumber=${currentPage + 1}&search=${param.search}" class="pagination-btn">다음</a>
    </c:if>
    </div>
</div>

</body>
</html>