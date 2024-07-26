<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!--  내가 가지고 있는 파일 포함하기  -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<link rel ="stylesheet" href="${path}/resources/css/myMovie.css" type="text/css">

</head>
<body>
	<div class="container">
		<div class="infoBox">
			<div class="memberInfo">
				<div>
					<img src="${path}/resources//img/열동그라미.png" alt="" class="img">
				</div>
				<div class="memberInfo2">
					<div class="memberInfo3">
						<h2 style="margin-right: 10px;">배교훈님</h2>
						<p>qorygnsska</p>
					</div>
					<div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
					<p>같이 영화 볼 사람 010-9095-8206 연락 ㄱㄱ</p>
				</div>
			</div>
			<div class="count">
				<h4>내가 본 영화 개수 : 18개</h4>
			</div>
			
		</div>
	</div>
	
</body>
</html>