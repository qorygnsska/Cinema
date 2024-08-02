<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
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
<link href="${path}/resources/css/member/join.css" rel="stylesheet" />
<link href="${path}/resources/css/main/main.css?after" rel="stylesheet" />
<link href="${path}/resources/css/member/login.css" rel="stylesheet" />
<link rel="stylesheet"
	href="${path}/resources/css/ticket/ticketMenu.css?after">
<link rel="stylesheet"
	href="${path}/resources/css/ticket/ticket.css?after">
<link rel="stylesheet" href="${path}/resources/css/mypage/myMovie.css?after"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/mypage/myProduct.css"
	type="text/css">
<link rel="stylesheet" href="${path}/resources/css/mypage/myStamp.css"
	type="text/css">
<link rel="stylesheet"
	href="${path}/resources/css/mypage/myConfirm.css?after" type="text/css">
<link rel="stylesheet"
	href="${path}/resources/css/mypage/myEdit.css?after" type="text/css">
<link rel="stylesheet" href="${path}/resources/css/movie/list.css">
<link rel="stylesheet"
	href="${path}/resources/css/movie/detail.css?after">
<link rel="stylesheet" href="${path}/resources/css/store/storeList.css">
<link rel="stylesheet"
	href="${path}/resources/css/store/storeDetail.css">
<!-- js 파일 -->
<script src="${path}/resources/js/main/main.js"></script>
<script src="${path}/resources/js/main/header.js"></script>
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
					<a href="${path}/"> <img
						src="${path}/resources/img/main/JERRY메인로고.png"
						id="header--logo--img">
					</a>
				</h1>
				<ul class="header--memberInfo">

					<!-- 로그인 여부에 따라 다르게 보여주기 -->
					<li><a href="${path}/login"> <i
							class="fa-solid fa-right-to-bracket header--icon"
							style="color: black;"></i> <span>LOGIN</span>
					</a></li>
					<li><a href="${path}/join"> <i
							class="fa-solid fa-user-plus header--icon" style="color: black;"></i>
							<span>JOIN</span>
					</a></li>
					<li><a href="${path}/logout"> <i
							class="fa-solid fa-right-from-bracket header--icon"
							style="color: black;"></i> <span>LOGOUT</span>
					</a></li>
					<li><a href="${path}/myMovie"> <i
							class="fa-solid fa-user header--icon" style="color: black;"></i>
							<span>MY PAGE</span>
					</a></li>
				</ul>
			</div>
		</div>
		<nav>
			<div class="container fixed-width header--navbar navbar">
				<ul class="navbar--items">
					<li class="navbar--item"><a href="#"> <img
							class="navbar--hover--img"
							src="${path}/resources/img/main/menu_hover.png" style="left: -38px;" /> <span>영화</span>
					</a></li>
					<li class="navbar--item"><a href="${path}/ticket"><img
							class="navbar--hover--img"
							src="${path}/resources/img/main/menu_hover.png" style="left: -38px;" /> <span>예매</span></a></li>
					<li class="navbar--item"><a href="#"><img
							class="navbar--hover--img"
							src="${path}/resources/img/main/menu_hover.png" /> <span>스토어</span></a></li>
					<li class="navbar--item"><a href="#"><img
							class="navbar--hover--img"
							src="${path}/resources/img/main/menu_hover.png" /> <span>이벤트</span></a></li>
				</ul>

				<div class="nav--searchBox">
					<input type="text" name="search" class="nav--searchBox--input"
						placeholder="영화 검색" /> <a href=""><i
						class="fa-solid fa-magnifying-glass nav--search--icon"
						style="color: #f2a40c;"></i></a>
				</div>
			</div>
		</nav>
	</header>
	<!-- 316 -->
	<div class="header--scroll--wrap">
		<div class="header--scroll--header">
			<div class="header--scroll--logoImg">
				<a href="${path}/"> <img
					src="${path}/resources/img/main/JERRY메인로고(w).png"
					id="header--logo--img">
				</a>
			</div>
			<div class="header--scroll--nav">
				<ul>
					<a href=""><li>영화</li></a>
					<a href="${path}/ticket"><li>예매</li></a>
					<a href=""><li>스토어</li></a>
					<a href=""><li>이벤트</li></a>
				</ul>
			</div>
			<div class="nav--scroll--searchBox">
				<input type="text" name="search"
					class="nav--scroll--searchBox--input" placeholder="영화 검색" /> <a
					href=""><i
					class="fa-solid fa-magnifying-glass nav--scroll--search--icon"
					style="color: #f2a40c;"></i></a>
			</div>
		</div>
	</div>