<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	
	
<div class="ticket--main">

	<%-- 영화 리스트 --%>
	<div class="section section--movie">
		<div class="col--head">영화</div>

		<div class="col--body">
			<div class="tap--menu">
				<button type="button" class="t--btn">
					예매율순
				</button>	
			</div>
			
			<%-- 영화 리스트 데이터 --%>
			<div class="movie--list">
				<ul class="movie--item">
				</ul>			
			</div>
		</div>
	</div>
	
	
	
	<%-- 영화관 리스트 --%>
	<div class="section section--cinema">
		<div class="col--head">극장</div>
		
		
		<div class="col--body">
			<div>
				<%-- 영화관 리스트 데이터 --%>
				<div class="cinema--list">
					<ul class="cinema--item">
					</ul>
				</div>
			</div>	
		</div>
	</div>
		
	
	<%-- 날짜 리스트 --%>
	<div class="section section--date">
		<div class="col--head">날짜</div>
		
		<div class="col--body">
			<%-- 날짜 리스트 데이터 --%>
			<div class="date">
				<ul class="date--item">
				</ul>
			</div>
		</div>
	</div>
	
	
	<%-- 시간 리스트 --%>
	<div class="section section--time">
		<div class="col--head">시간</div>
		
		<div class="menu--reset">
			<i class="fa-solid fa-arrow-rotate-left fa-lg"></i>
			<span>초기화</span>
		</div>
		
		<div class="col--body">
			<%-- 시간 리스트 데이터 --%>
			<div class="theater--time--wrap">
			</div>
		</div>
	</div>
</div>



<%-- 상영관 시간 선택 시 --%>
<form action="${path}/ticket/seat" method="post">
	<input type="hidden" id="movieNo" name="movieNo" value="${movieDTO.movieNo}">
	<input type="hidden" id="movieTitle" name="movieTitle" value="${movieDTO.movieTitle}">
	<input type="hidden" id="movieMainImage" name="movieMainImage" value="${movieDTO.movieMainImage}">
	<input type="hidden" id="movieAgeLimit" name="movieAgeLimit" value="${movieDTO.movieAgeLimit}">
	
	<input type="hidden" id="cinemaNo" name="cinemaNo" value="${cinemaDTO.cinemaNo}">
	<input type="hidden" id="cinemaBLG" name="cinemaBLG" value="${cinemaDTO.cinemaBLG}">
	<input type="hidden" id="cinemaLocation" name="cinemaLocation" value="${cinemaLocation}">
	<input type="hidden" id="screenDate" name="screenDate" value="${screenDate}">
	
	<input type="hidden" id="theaterNo" name="theaterNo" value="${theaterDTO.theaterNo}">
	<input type="hidden" id="theaterTime" name="theaterTime" value="${theaterTime}">



	<%-- 상영관 시간 선택 시 최종 확인 팝업 --%>
	<div id="layerReserve" ></div>
	<div id="layerReserveStep01" class="layerReserveStep01" >
		<div class="layer--header">
			<strong>
				몇시부터 몇시까지 몇관
			</strong>
		</div>
		
		<div class="layer--contents">
			<div class="layer--seat--infor">
				<div class="layer--seat">
					<span>잔여좌석</span>
					<br>
					<strong></strong><span>/150</span>
				</div>
				
				<div class="layer--content">
					<p class="tlt">
						<img alt="나이 이미지" src="">
						<span>본영화는 <strong></strong> 영화입니다.</span>
					</p>
					<p class="txt"></p>
					
				</div>
			</div>
			
			<div class="layer--btn">
				<button type="submit" class="layer--btn--submit t--btn">인원/좌석 선택</button>
				<button type="button" class="layer--btn--cancle t--btn">취소</button>
			</div>
		</div>				
	</div>	
</form>


<%-- 로그인 예외처리 --%>
<div class="login--blush"></div>
<div class="login--container">
	<div class="login--box">
		<div class="login--content--box">
			로그인이 필요한 서비스입니다.
		</div>
		
		
		<div class="login--btn--box">
			<button class="login--btn" onclick="location.href='${path}/login'">
				확인
			</button>
		</div>
	</div>
</div>






<script src="${path}/resources/js/jquery-3.7.1.min.js" defer></script>
<script src="${path}/resources/js/ticket/ticketMenu.js" defer></script>
