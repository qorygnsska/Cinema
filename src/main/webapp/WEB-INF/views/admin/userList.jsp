<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

.btn-custom:focus, .btn-custom:active {
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

.pagination {
	display: flex;
	justify-content: center;
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
</style>
</head>
<body>

	<div class="container-fluid mt-5">
		<div class="d-flex justify-content-between align-items-center mb-2">
			<h2>회원 리스트</h2>
			<input type="text" id="searchInput" placeholder="회원 이름 검색"
				class="form-control" style="width: 300px;">
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
						<td><a
							href="${pageContext.request.contextPath}/admin/editUser?id=${member.memberId}"
							class="btn btn-warning btn-sm">수정</a> <a
							href="${pageContext.request.contextPath}/admin/deleteUser?id=${member.memberId}"
							class="btn btn-danger btn-sm"
							onclick="return confirm('정말 삭제하시겠습니까?')">삭제</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이지네이션 -->
		<div class="pagination">
			<!-- 페이지네이션 링크가 JavaScript로 동적으로 추가됩니다 -->
		</div>

		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script>
    document.addEventListener("DOMContentLoaded", function() {
        const searchInput = document.getElementById('searchInput');
        const tableBody = document.querySelector('tbody');
        let members = [...tableBody.rows]; // 초기 데이터 저장

        const renderTable = (filteredMembers) => {
            tableBody.innerHTML = ''; // 테이블 초기화
            filteredMembers.forEach(member => {
                tableBody.appendChild(member);
            });
        };

        const paginate = (members, pageNumber, pageSize) => {
            const start = (pageNumber - 1) * pageSize;
            const end = start + pageSize;
            return members.slice(start, end);
        };

        searchInput.addEventListener('keyup', function() {
            const filter = searchInput.value.toLowerCase();
            const filteredMembers = members.filter(row => {
                const memberName = row.querySelector('td:nth-child(1)').textContent.toLowerCase();
                return memberName.includes(filter);
            });
            renderTable(paginate(filteredMembers, 1, 7)); // 검색 시 첫 페이지로 이동
            updatePagination(filteredMembers.length, 1, 7);
        });

        const updatePagination = (totalItems, currentPage, pageSize) => {
            const pagination = document.querySelector('.pagination');
            const totalPages = Math.ceil(totalItems / pageSize);
            pagination.innerHTML = '';

            for (let i = 1; i <= totalPages; i++) {
                const pageLink = document.createElement('a');
                pageLink.href = "#";
                pageLink.textContent = i;
                pageLink.className = i === currentPage ? 'active' : '';
                pageLink.addEventListener('click', (e) => {
                    e.preventDefault();
                    renderTable(paginate(members, i, pageSize));
                    updatePagination(totalItems, i, pageSize);
                });
                pagination.appendChild(pageLink);
            }
        };

        // 초기 페이지네이션 설정
        updatePagination(members.length, 1, 10);
        renderTable(paginate(members, 1, 10));
    });
</script>

	</div>
</body>
</html>
