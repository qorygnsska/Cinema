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
<title>JERRY - 비밀번호 재설정</title>
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
	<form action="${path}/resetNewPw?email=${email}" method="post"
		onsubmit="return resetNewPw();">
		<div class="memberFind_newPw--wrap">
			<h3 class="memberFind_newPw--title">새로운 비밀번호 설정</h3>
			<div class="memberFind_newPw--content">
				<div style="margin-bottom: 15px;">
					<a>새로운 비밀번호</a>
				</div>
				<input type="password" class="form-control" id="newPw" name="newPw" />
			</div>
			<div class="memberFind_newPw--content">
				<div style="margin-bottom: 15px;">
					<a>새로운 비밀번호 확인</a>
				</div>
				<input type="password" class="form-control" id="newPwCheck"
					name="newPwCheck" />
			</div>
			<div class="memberFind_id--btn">
				<button id="emailAuth--btn" type="submit"
					class="btn btn-outline-dark">비밀번호 변경</button>
			</div>
		</div>
	</form>
	<script>
	function resetNewPw() {
		var password = document.querySelector('input[name="newPw"]').value;
		var passwordCheck = document.querySelector('input[name="newPwCheck"]').value;
		
	    if (password.trim() === "" || passwordCheck.trim() === "") {
	        alert("새로운 비밀번호를 입력해주세요.");
	        return false;
	    }
	    
	    if (password.length < 8 || password.length > 16) {
	        alert("비밀번호는 8자 이상 16자 사이로 입력해주세요.");
	        return false;
	    }
	    
	    if (password !== passwordCheck) {
	        alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	        return false;
	    }

	    return true;
	}
	</script>

	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>