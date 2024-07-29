<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<header class="header">
	<div class="header_contents_container">
		<div class="container fixed-width contents">
			<h1 class="header_h1">
				<a href="#"> <img src="${path}/resources/img/main/cgv로고.png" id="header_logo_img">
				</a>
			</h1>
			<ul class="header_memberInfo">
				<li><a href="#"> <i
						class="fa-solid fa-right-to-bracket header_icon"></i> <span>로그인</span>
				</a></li>
				<li><a href="#"> <i
						class="fa-solid fa-user-plus header_icon"></i> <span>회원가입</span>
				</a></li>
				<li><a href="#"> <i class="fa-solid fa-user header_icon"></i>
						<span>MY CGV</span>
				</a></li>
			</ul>
		</div>
	</div>
	<nav>
		<div class="container fixed-width contents navbar">
			<ul class="navbar_items">
				<li class="navbar_item"><a href="#"> 영화 </a></li>
				<li class="navbar_item"><a href="#"> 예매 </a></li>
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