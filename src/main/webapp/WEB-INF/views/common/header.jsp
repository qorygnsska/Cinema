<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<title>JERRY</title>

<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<!-- Slick JS 라이브러리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<!-- Slick CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />
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

<!-- css 파일 -->
<link href="${path}/resources/css/main/headerNavbar.css?after"
	rel="stylesheet" />
<link href="${path}/resources/css/main/footer.css" rel="stylesheet" />
<link href="${path}/resources/css/member/join.css?after"
	rel="stylesheet" />
<link href="${path}/resources/css/main/main.css?after" rel="stylesheet" />
<link href="${path}/resources/css/member/login.css" rel="stylesheet" />
<link rel="stylesheet"
	href="${path}/resources/css/ticket/ticketMenu.css">
<link rel="stylesheet" href="${path}/resources/css/ticket/ticket.css">
<link rel="stylesheet"
	href="${path}/resources/css/mypage/myStamp.css?after" type="text/css">
<link rel="stylesheet"
	href="${path}/resources/css/mypage/myConfirm.css?after" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/mypage/myMovie.css"
	type="text/css">
<link rel="stylesheet"
	href="${path}/resources/css/mypage/myProduct.css?after" type="text/css">
<link rel="stylesheet"
	href="${path}/resources/css/mypage/myStamp.css?after" type="text/css">
<link rel="stylesheet"
	href="${path}/resources/css/mypage/myConfirm.css?after" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/mypage/myEdit.css"
	type="text/css">
<link rel="stylesheet"
	href="${path}/resources/css/mypage/myReview.css?after" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/movie/list.css">
<link rel="stylesheet"
	href="${path}/resources/css/movie/detail.css">
<link rel="stylesheet"
	href="${path}/resources/css/store/storeList.css?after">
<link rel="stylesheet"
	href="${path}/resources/css/store/storeDetail.css">
<link rel="stylesheet" href="${path}/resources/css/event/eventList.css">
<link rel="stylesheet"
	href="${path}/resources/css/event/eventDetail.css">
<link rel="stylesheet" href="${path}/resources/css/ticket/ticketPay.css">
<link rel="stylesheet"
	href="${path}/resources/css/ticket/ticketSeat.css">
<link rel="stylesheet"
	href="${path}/resources/css/basket/basketMain.css">
<link rel="stylesheet" href="${path}/resources/css/basket/basketPay.css">
<link rel="stylesheet" href="${path}/resources/css/ticket/ticketEnd.css">
<!-- js 파일 -->
<script src="${path}/resources/js/main/header.js?after"></script>
<script src="${path}/resources/js/member/join.js"></script>
<html>
<style>
section {
	padding-top: 3px;
	margin-top: 12rem;
	box-sizing: border-box;
}
</style>
</head>
<body>

	<header>
		<div class="header--contents--container">
			<div class="header--navbar">
				<h1 class="header--h1">
					<img onclick="location.href='${path}/'" style="cursor: pointer;"
						src="${path}/resources/img/main/JERRY메인로고.png"
						id="header--logo--img">
				</h1>
				<ul class="header--memberInfo">
					<c:choose>
						<c:when test="${sessionId == null}">
							<li><a href="${path}/login"> <i
									class="fa-solid fa-right-to-bracket header--icon"
									style="color: black;"></i> <span>LOGIN</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${!empty admin}">
									<li><a href="${path}/admin/adminMain"> <i
											style="color: black;"
											class="fa-solid fa-user-tie header--icon"></i> <span>ADMIN
												PAGE</span>
									</a></li>
								</c:when>
								<c:otherwise>
									<li id="header--basket"><a
										href="${path}/basket/basketMain"> <c:if
												test="${!empty countBasket && countBasket != 0}">
												<div class="header--basket--countDiv">${countBasket}</div>
											</c:if> <i class="fa-solid fa-basket-shopping header--icon"
											style="color: black;"></i> <span>BASKET</span>
									</a></li>
									<li><a href="${path}/myMovie"> <i
											class="fa-solid fa-user header--icon" style="color: black;"></i>
											<span>MY PAGE</span>
									</a></li>
								</c:otherwise>
							</c:choose>
							<li><a onclick="logout();" style="cursor: pointer;"> <i
									class="fa-solid fa-right-from-bracket header--icon"
									style="color: black;"></i> <span>LOGOUT</span>
							</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
		<nav class="header--nav">
			<div class="container fixed-width header--navbar navbar">
				<ul class="navbar--items">
					<li class="navbar--item"><a href="${path}/movieList"><span>영화</span>
					</a></li>
					<li class="navbar--item"><a href="${path}/ticket"><span>예매</span>
					</a></li>
					<li class="navbar--item"><a href="${path}/storeList"> <span>스토어</span>
					</a></li>
					<li class="navbar--item"><a href="${path}/eventList"><span>이벤트</span>
					</a></li>
				</ul>

				<div class="nav--searchBox">
					<form action="${path}/movieList" method="GET" onsubmit="return validateSearchForm(this);">
						<input type="text" name="search" class="nav--searchBox--input" placeholder="영화 검색" />
						<button class="nav--searchBox--button" type="submit">
							<i class="fa-solid fa-magnifying-glass nav--search--icon" style="color: #f2a40c;"></i>
						</button>
					</form>
				</div>

			</div>
		</nav>
	</header>
	<div class="header--scroll--wrap">
		<div class="header--scroll--header">
			<div class="header--scroll--logoImg">
				<a href="${path}/"> <img
					src="${path}/resources/img/main/JERRY메인로고(w).png"
					class="header--scroll--img">
				</a>
			</div>
			<div class="header--scroll--nav">
				<ul>
					<li><a href="${path}/movieList">영화</a></li>
					<li><a href="${path}/ticket">예매</a></li>
					<li><a href="${path}/storeList">스토어</a></li>
					<li><a href="${path}/eventList">이벤트</a></li>
				</ul>
			</div>
			<div class="nav--scroll--searchBox">
			<form action="${path}/movieList" method="GET" onsubmit="return validateSearchForm(this);">
				<input type="text" name="search" class="nav--scroll--searchBox--input" placeholder="영화 검색" /> 
					<button class="nav--searchBox--button"  type="submit">
						<i class="fa-solid fa-magnifying-glass nav--scroll--search--icon" style="color: #f2a40c;"></i>
					</button>
			</form>
			</div>
		</div>
	</div>
	<script>
		function logout() {
			var result = confirm("정말 로그아웃 하시겠습니까?");
			if (result) {
				console.log('로그아웃');
				window.location.href = "${path}/logout";
			}
		}
		
		function validateSearchForm(form) {
			var searchInput = form.querySelector('input[name="search"]').value.trim();
			if (searchInput === "") {
				alert("검색어를 입력해 주세요.");
				return false; // 폼 제출을 막음
			}
			return true; // 폼 제출을 허용
		}
	</script>