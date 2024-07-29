<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--  내가 가지고 있는 파일 포함하기  -->
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myMovieCart.css"
	type="text/css">
<title>My Movie Cart</title>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container mt-5">
		<div class="row">
			<div class="col-aside">
				<div class="profile-box">
					<img src="https://via.placeholder.com/100" alt="Profile Image">
					<p>
						이준철님 <a href="#"><i class="fas fa-pen"></i></a>
					</p>
				</div>
				<div class="menu-item">
					<p>
						<strong>0</strong> 기대되는 영화
					</p>
				</div>
				<div class="menu-item">
					<p>
						<strong>0</strong> 내가 본 영화
					</p>
				</div>
				<div class="menu-item">
					<p>
						<strong>0</strong> 내가 쓴 평점
					</p>
				</div>
			</div>
			<div class="col-detail">
				<c:choose>
					<c:when test="${empty sessionScope.myVar}">
						<div>
							<h4>
								기대되는 영화 <small>0건</small>
							</h4>
							<p>기대되는 영화가 없습니다. 영화 상세 프리예고에서 '기대돼요!'를 선택하여 영화를 추가해보세요.</p>
							<button id="movieChartButton" class="btn btn-outline-secondary"
								onclick="window.location.href='${pageContext.request.contextPath}/movieList.jsp'">무비차트</button>
						</div>
					</c:when>
					<c:otherwise>
						<div>
							<h4>기대되는 영화 목록</h4>
							<p>여기에 기대되는 영화 목록이 표시됩니다.</p>
							<button id="movieChartButton" class="btn btn-outline-secondary"
								onclick="window.location.href='${pageContext.request.contextPath}/movieList.jsp'">무비차트</button>
						</div>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>

