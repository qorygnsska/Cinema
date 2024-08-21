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
        .btn-custom:active {
            outline: none !important;
            box-shadow: none !important;
            border-color: #fdd000 !important;
        }
        th, td {
            font-size: 0.8rem;
        }
        thead {
            background-color: #fdd000 !important;
        }
        .form-control:focus {
            outline: none;
            box-shadow: none;
            border-color: #fdd000;
        }
    </style>
</head>
<body>

<div class="container-fluid mt-5">
    <div class="d-flex justify-content-between align-items-center mb-2">
        <h2>회원 리스트</h2>
        <input type="text" id="searchInput" placeholder="회원 이름 검색" class="form-control" style="width: 300px;">
    </div>

    <table id="memberTable" class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>이름</th>
                <th>아이디</th>
                <th>비밀번호</th>
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
                    <td>${member.memberName}</td>
                    <td>${member.memberId}</td>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            const searchInput = $('#searchInput');
            const tableRows = $('#memberTable tbody tr');

            searchInput.on('keyup', function() {
                const filter = searchInput.val().toLowerCase();
                tableRows.each(function() {
                    const memberName = $(this).find('td:nth-child(1)').text().toLowerCase();
                    if (memberName.includes(filter)) {
                        $(this).show();
                    } else {
                        $(this).hide();
                    }
                });
            });
        });
    </script>

</div>
</body>
</html>
