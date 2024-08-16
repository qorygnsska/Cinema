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
<title>JERRY - 이메일 인증</title>
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/31d16c06da.js"
	crossorigin="anonymous"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/member/join.css">
<!-- js 파일 -->
<script src="${path}/resources/js/member/join.js"></script>

<style>
body {
	font-family: "Noto Sans KR", sans-serif;
}
</style>
</head>
<body>
	<div class="emailAuth--wrap">
		<div class="emailAuth--top">
			<a>
				<p class="emailAuth--email">${email}</p> 인증번호가 발송되었습니다.<br>발송된
				인증번호를 입력해주세요.
			</a>
		</div>
		<div class="emailAuth--bottom">
			<form class="emailAuth--form">
				<input type="text" class="form-control" id="emailauth--Num"
					name="authNum" /> <br>
				<div>
					<button id="emailAuth--btn" type="submit"
						class="btn btn-outline-dark" onclick="authCheck(event);">인증번호
						확인</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		const num = "${checkNum}";
		const findPw = "${findPwMsg}";
		const path = "${path}";
		const email = "${email}";
		
		function authCheck(event) {
			event.preventDefault();
			var inputNum = document.getElementById('emailauth--Num').value;
			console.log(inputNum);
			if (inputNum.trim() == num) {
				
				if(findPw){
					window.location.href='${path}/resetPw?email='+email;
				} else if (window.opener) {
					const parentDocument = window.opener.document;
					const hiddenElement = parentDocument
							.getElementById('join--emailAuth--ok');

					if (hiddenElement) {
						hiddenElement.style.display = 'block';
					}
				window.close();
				}
			} else {
				alert('올바른 인증번호가 아닙니다.');
				return;
			}
		}
	</script>

</body>
</html>