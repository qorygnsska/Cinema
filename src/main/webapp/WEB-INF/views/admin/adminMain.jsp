<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- 내가 가지고 있는 파일 포함하기 -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/admin/adminMain.css" type="text/css">
<title>Insert title here</title>
<style>
.col-aside {
	padding-right: 10px;
	margin-top: 0;
}

.col-detail {
	padding-left: 10px;
	margin-top: 0;
}

.btn-group-vertical .btn {
	margin-top: 52px;
	margin-bottom: 30px;
}

/* Add padding to avoid overlap with the fixed header */
body {
	padding-top: 8rem;
	margin: 0;
}

.btn-outline-secondary.custom {
	border-color: #fdd000;
	color: #000000;
}

.btn-outline-secondary.custom:hover {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000;
}

.cols-content {
	padding-top: 12rem;
}
</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<div id="container" class="container mt-4">
    <div id="contents" class="row">
        <div class="col-12">
            <div class="cols-content row">
                <div class="col-md-3 col-aside">
                    <div class="btn-group-vertical w-100">
                        <a href="?page=addMovie" class="btn btn-outline-secondary custom">영화 추가</a>
                        <a href="?page=addSchedule" class="btn btn-outline-secondary custom">시간표 추가</a>
                        <a href="?page=addProduct" class="btn btn-outline-secondary custom">상품 추가</a>
                        <a href="?page=userList" class="btn btn-outline-secondary custom">회원 리스트</a>
                    </div>
                </div>
                <div class="col-md-9 col-detail">
                    <!-- 이 부분에 페이지 내용이 동적으로 로드 -->
						<c:choose>
							<c:when test="${param.page == 'addMovie'}">
								<jsp:include page="addMovie.jsp" />
							</c:when>
							<c:when test="${param.page == 'addSchedule'}">
								<jsp:include page="addSchedule.jsp" />
							</c:when>
							<c:when test="${param.page == 'addProduct'}">
								<jsp:include page="addProduct.jsp" />
							</c:when>
							<c:when test="${param.page == 'userList'}">
								<jsp:include page="userList.jsp" />
							</c:when>
							<c:when test="${param.page == 'movieList'}">
								<jsp:include page="movieList.jsp" />
							</c:when>
							<c:when test="${param.page == 'productList'}">
								<jsp:include page="productList.jsp" />
							</c:when>
							<c:when test="${param.page == 'scheduleList'}">
								<jsp:include page="scheduleList.jsp" />
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
					</div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
