<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JERRY - login</title>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
</head>
<body>
	<c:if test="${!empty joinMsg}">
		<script>
			alert('${joinMsg}');
		</script>
	</c:if>
	<c:if test="${!empty resetNewPw}">
		<script>
			alert('${resetNewPw}');
			window.close();
		</script>
	</c:if>
	<c:if test="${!empty sendId}">
		<script>
			alert('${sendId}');
			window.close();
		</script>
	</c:if>
	<c:if test="${!empty loginNull}">
		<script>
			alert('${loginNull}');
		</script>
	</c:if>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<section>
		<div class="loginWrap">
			<div class="container" id="login_container">
				<div class="form-container sign-in-container">
					<%-- 					<form action="${path}/memberLogin" method="post"> --%>
					<form action="${path}/memberLogin" method="post"
						onsubmit="return loginCheck();">
						<h1>로그인</h1>
						<br>
						<div class="loginSizeBox">
							<input type="text" placeholder="Id" name="id" /> <input
								type="password" placeholder="Password" name="password" /> <a
								href="${path}/memberFind" target="memberFind"
								onclick="openCenteredWindow('${path}/memberFind', 'memberFind', 400, 600)">아이디
								/ 비밀번호 찾기</a> <br>
							<button type="submit" id="login">로그인</button>
							<br>
					</form>
					<button type="button" id="signUp"
						onclick="location.href='${path}/join'">회원가입</button>
				</div>
			</div>
			<div class="overlay-container">
				<div class="overlay">
					<div class="overlay-panel overlay-right">
						<h1>소셜 로그인</h1>
						<br>
						<div class="loginSizeBox socialLoginBox">
							<a
								href="${naverUrl}"><img
								class="socialLogin"
								src="${path}/resources/img/login/네이버로그인사각.png" alt="네이버로그인" /></a> <a
								href="${kakaoUrl}"><img
								class="socialLogin" src="${path}/resources/img/login/카카오로그인사각.png"
								alt="카카오로그인" /></a> <a
								href="${googleUrl}&prompt=consent">
								<div class="socialLogin--google">
								<img class="socialLogin--google--img" src="${path}/resources/img/login/구글로그인로고.png" alt="구글로그인" />
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>

		<script>
			var loginMessage = "${loginMessage}";
			if (loginMessage) {
				alert(loginMessage);
			}

			// 로그인창 빈칸일 경우 알림창
			function loginCheck() {
				var id = document.querySelector('input[name="id"]').value;
				var password = document.querySelector('input[name="password"]').value;

				if (id.trim() === "" || password.trim() === "") {
					alert("아이디와 비밀번호를 모두 입력해주세요.");
					return false;
				}
				return true;
			}
			
			
			function openCenteredWindow(url, name, width, height) {
			    // 화면 크기 가져오기
			    var screenWidth = window.screen.width;
			    var screenHeight = window.screen.height;
			    
			    // 새 창의 크기와 위치 계산하기
			    var left = (screenWidth / 2) - (width / 2);
			    var top = (screenHeight / 2) - (height / 2);
			    
			    // 새 창 열기
			    window.open(url, name, 'width=' + width + ',height=' + height + ',top=' + top + ',left=' + left + ',scrollbars=yes');
			}
		</script>

	</section>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>