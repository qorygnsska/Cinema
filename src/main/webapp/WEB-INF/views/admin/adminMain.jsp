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
<!-- 내가 가지고 있는 파일 포함하기 -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<link rel="stylesheet" href="${path}/resources/css/admin/adminMain.css" type="text/css">
<title>Insert title here</title>
<style>
#container {
    padding: 0 15px; /* 좌우 패딩을 적절히 조정 */
    max-width: 1200px; /* 너비를 고정해서 중앙에 배치 */
    margin: 0 auto; /* 중앙에 배치 */

}
.col-aside {
	width: 250px; /* 사이드바 너비 고정 */
	padding-right: 10px;
	margin-top: 0;
	
}

.col-detail {
    padding-left: 20px;
    margin-top: 0;
    width: calc(100% - 250px); /* col-aside의 너비를 뺀 나머지 너비를 차지 */
    margin-right: auto; /* 오른쪽으로 치우치지 않도록 설정 */
   
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

.btn-outline.custom {
	border-color: #fdd000;
	color: #000000;

}

.btn-outline.custom:hover,
.btn-outline.custom:focus,
.btn-outline.custom:active,
.btn-outline.custom.selected {
	background-color: #fdd000;
	color: white !important;
	border-color: #fdd000;
	outline: none !important; /* 클릭 시 기본 테두리 없애기 */
	box-shadow: none; /* 클릭 시 그림자 효과 없애기 */
	 text-decoration: none !important;
}
/* adminMain의 버튼 스타일 */
.btn-outline.admin-btn {
	border-color: #fdd000;
	 text-decoration: none !important;/* 기본적으로 밑줄 제거 */
}

.btn-outline.admin-btn:hover,
.btn-outline.admin-btn:focus,
.btn-outline.admin-btn:active,
.btn-outline.admin-btn.selected {
	background-color: #fdd000 !important;
	color: white !important;
	border-color: #fdd000;
	outline: none !important;
	box-shadow: none;
	 transition: none !important; /* 부드러운 전환 효과 제거 */
	  text-decoration: none !important; /* 기본적으로 밑줄 제거 */
	
}
.cols-content {
	padding-top: 12rem;
}

.full-width {
	width: 100% !important;

}

</style>
</head>
<body>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
 <div id="container" class="container-fluid mt-4">
    <div id="contents" class="row">
        <div class="col-12">
            <div class="cols-content row">
                <div class="col-md-3 col-aside">
                    <div class="btn-group-vertical w-100">
                        <a href="${pageContext.request.contextPath}/admin/adminMain?page=addMovie" class="btn btn-outline admin-btn">영화 추가</a>
                        <a href="${pageContext.request.contextPath}/admin/adminMain?page=addSchedule" class="btn btn-outline admin-btn">시간표 추가</a>
                        <a href="${pageContext.request.contextPath}/admin/adminMain?page=addProduct" class="btn btn-outline admin-btn">상품 추가</a>
                        <a href="${pageContext.request.contextPath}/admin/adminMain?page=userList" class="btn btn-outline admin-btn">회원 리스트</a>
                    </div>
                </div>
                <div class="col-md-9 col-detail ${param.page == 'movieList' ? 'full-width' : ''}">
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
														<c:when test="${param.page == 'editUser'}">
								<jsp:include page="editUser.jsp" />
							</c:when>
							<c:otherwise>
								
							</c:otherwise>
						</c:choose>
					</div>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        // 모든 버튼의 'selected' 클래스를 제거하여 초기화
        $('.btn-outline.admin-btn').removeClass('selected').css('background-color', '').css('color', '');

        // 로컬 스토리지에서 선택된 페이지를 확인하여 해당 버튼에 selected 클래스를 추가
        var selectedPage = localStorage.getItem('selectedPage');
        if (selectedPage) {
            $('.btn-outline.admin-btn[href="${pageContext.request.contextPath}/admin/adminMain?page=' + selectedPage + '"]').addClass('selected').css('background-color', '#fdd000').css('color', 'white');
        }

        // 버튼 클릭 시 클래스 토글 및 로컬 스토리지에 저장
        $('.btn-outline.admin-btn').click(function(){
            // 모든 버튼에서 'selected' 클래스를 제거
            $('.btn-outline.admin-btn').removeClass('selected').css('background-color', '').css('color', '');

            // 클릭한 버튼에 'selected' 클래스를 추가
            $(this).addClass('selected').css('background-color', '#fdd000').css('color', 'white');

            // 선택된 페이지를 로컬 스토리지에 저장
            var selectedHref = $(this).attr('href').split('page=')[1];
            localStorage.setItem('selectedPage', selectedHref);
        });
    });
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>
