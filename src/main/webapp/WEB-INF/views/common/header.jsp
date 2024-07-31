<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<title>SGV</title>
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/31d16c06da.js"
	crossorigin="anonymous"></script>
<!-- header, nav css파일 -->
<link href="${path}/resources/css/main/*.css" rel="stylesheet" />
<!-- main css파일 -->
<link href="${path}/resources/css/main/main.css" rel="stylesheet" />
<link href="${path}/resources/css/member/login.css" rel="stylesheet" />
<html>
<!-- css -->
<link href="${path}/resources/css/main/headerNavbar.css"
	rel="stylesheet" />
<style>
section {
	padding-top: 3px;
	margin-top: 12rem;
	box-sizing: border-box;
}
</style>

</head>
<body>

	<header class="header">
		<div class="header_contents_container">
			<div class="container fixed-width contents">
				<h1 class="header_h1">
					<a href="${path}/"> <img
						src="${path}/resources/img/main/JERRY메인로고.png"
						id="header_logo_img">
					</a>
				</h1>
				<ul class="header_memberInfo">

					<!-- 로그인 여부에 따라 다르게 보여주기 -->
					<li><a href="${path}/login"> <i
							class="fa-solid fa-right-to-bracket header_icon"></i> <span>로그인</span>
					</a></li>
					<li><a href="${path}/join"> <i
							class="fa-solid fa-user-plus header_icon"></i> <span>회원가입</span>
					</a></li>
					<li><a href="${path}/logout"> <i
							class="fa-solid fa-right-from-bracket header_icon"></i> <span>로그아웃</span>
					</a></li>
					<li><a href="${path}/myMovie"> <i
							class="fa-solid fa-user header_icon"></i> <span>MY CGV</span>
					</a></li>
				</ul>
			</div>
		</div>
		<nav>
			<div class="container fixed-width contents navbar">
				<ul class="navbar_items">
					<li class="navbar_item"><a href="#"> 영화 </a></li>
					<li class="navbar_item"><a href="${path}/ticket"> 예매 </a></li>
					<li class="navbar_item"><a href="#"> 스토어 </a></li>
					<li class="navbar_item"><a href="#"> 이벤트 </a></li>
				</ul>

				<div class="nav_searchBox">
					<input type="text" name="search" class="nav_searchBox_input"
						placeholder="영화 검색" /> <a href=""><i
						class="fa-solid fa-magnifying-glass search_icon"></i></a>
				</div>
			</div>
		</nav>
	</header>