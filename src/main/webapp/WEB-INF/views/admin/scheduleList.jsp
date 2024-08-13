<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상영시간표 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.table-hover tbody tr:hover {
	background-color: #fdd000;
}

.btn-custom {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000;
}

.btn-custom:hover {
	background-color: #e6c200;
	border-color: #e6c200;
}

.btn.custom:focus, .btno-utline.custom:focus, .btn.custom:active,
	.btn-outline.custom:active {
	outline: none; /* 클릭 시 기본 테두리 없애기 */
	box-shadow: none; /* 클릭 시 그림자 효과 없애기 */
	border-color: #fdd000; /* 클릭 시 테두리 색상 고정 */
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
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>상영시간표 목록</h2>
      
    </div>
    
    <table class="table table-bordered table-hover">
      <thead style="background-color: #fdd000 !important; font-size: 0.8rem;">
            <tr>
                 <th scope="col" style="background-color: #fdd000; color: black;">#</th>
        <th scope="col" style="background-color: #fdd000; color: black;">영화 제목</th>
        <th scope="col" style="background-color: #fdd000; color: black;">광역자치단체</th>
        <th scope="col" style="background-color: #fdd000; color: black;">기초자치단체</th>
        <th scope="col" style="background-color: #fdd000; color: black;">상영 날짜</th>
        <th scope="col" style="background-color: #fdd000; color: black;">상영관 이름</th>
        <th scope="col" style="background-color: #fdd000; color: black;">시작 시간</th>
        <th scope="col" style="background-color: #fdd000; color: black;">종료 시간</th>
         <th scope="col" style="background-color: #fdd000; color: black;">삭제</th>
            </tr>
        </thead>
        <tbody>
    <c:forEach var="schedule" items="${schedules}">
      <tr>
        <th scope="row">${schedule.theaterNo}</th>
        <td>${schedule.movie.movieTitle}</td> <!-- movie 객체의 movieTitle 속성 -->
        <td>${schedule.cinema.cinemaRLG}</td> <!-- cinema 객체의 cinemaRLG 속성 -->
        <td>${schedule.cinema.cinemaBLG}</td>
        <td><fmt:formatDate value="${schedule.cinema.cinemaScreenDate}" pattern="yyyy-MM-dd"/></td>
        <td>${schedule.theaterName}</td>
        <td><fmt:formatDate value="${schedule.theaterStartTime}" pattern="HH:mm"/></td>
        <td><fmt:formatDate value="${schedule.theaterEndTime}" pattern="HH:mm"/></td>
           <td>
           <form action="${pageContext.request.contextPath}/admin/deleteSchedule" method="post">
    <input type="hidden" name="theaterNo" value="${schedule.theaterNo}">
    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
</form>
        </td>
    </tr>
    </c:forEach>
</tbody>
        </tbody>
    </table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>