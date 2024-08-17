<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
</head>
<style>
</style>
<body>

	<footer>
		<div class="footer--wrap">

			<div class="footer--info">
				<span style="border: none;">주식회사 제리</span>
				<span>대표 : 톰</span>
				<span>사업자번호 : 111-22-55555</span>
				<span>주소 : 서울 서초구 서초대로 74길 45, 엔데버 빌딩 3층 </span>
				<span>TEL : 02-4242-4242 </span>
				<span>고객센터 : 1588-4242 </span>
				<a href="${path}/termsOfUse"><span>이용약관 </span></a>
				<a href="${path}/privacyPolicy"><span>개인정보 처리 방침 </span></a>
				<span>Copyright © 2024 4조JERRY팀. All rights reserved.</span>
			</div>

			<div class="footer--logo">
				<img alt="JERRY" class="footer--logo--img"
					src="${path}/resources/img/main/JERRY메인로고.png">
			</div>
		</div>
	</footer>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>