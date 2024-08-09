<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JERRY - 아이디 찾기</title>
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- css -->
<link href="${path}/resources/css/member/find.css" rel="stylesheet" />
</head>
<body>
	<c:set var="memberId" value="${member.memberId}" />
	<c:set var="memberEmail" value="${member.memberEmail}" />

	<script>
		function maskId(id) {
			if (id.length > 3) {
				return id.substring(0, id.length - 3) + '***';
			} else {
				return id + '***';
			}
		}
		document.addEventListener('DOMContentLoaded', function() {
			var memberId = '${memberId}';
			var maskedId = maskId(memberId);
			document.getElementById('maskedId').innerText = maskedId;
		});
	</script>

	<div class="memberFind_id--wrap">
		<h3 class="memberFind_id--title">아이디 찾기</h3>
		<div class="memberFind_id--content">
			<span>검색된 아이디<span>
			<br>
			<br>
			</span><strong><span id="maskedId"></span></strong></span>
		</div>
		<div class="memberFind_id--btn">
			<button type="button" style="border-radius: 25px;"
				class="btn btn-outline-dark" onclick="window.close();">회원 로그인</button>
			<br>
			<button type="button" style="border-radius: 25px;"
				class="btn btn-outline-dark" onclick="sendId();">전체 아이디 메일 발송</button>
		</div>
	</div>
	
	<script>
		function sendId() {
			var memberEmail = "${memberEmail}";
			window.location.href='${path}/sendId?email='+memberEmail;
		}
	
	
	</script>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>