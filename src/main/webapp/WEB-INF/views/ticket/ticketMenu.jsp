<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	
	
<div class="ticket--main">
	<%-- 영화리스트 --%>
	<div class="section section--movie">
		<div class="col--head">
			영화
		</div>

		<div class="col--body">
			<div class="tap--menu">
				<button type="button" class="t--btn">
					예매율순
				</button>
			<%-- 	
				<button type="button" class="t--btn">
					가나다순
				</button>
			--%>	
			</div>
			
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
				<div class="cinema--list">
					
					<ul class="cinema--item">
						
					</ul>
				</div>
				
				<div>
				
				</div>
			</div>	
		</div>
	</div>
		
	
	<%-- 날짜 리스트 --%>
	<div class="section section--date">
		<div class="col--head">날짜</div>

		<div class="col--body">
			
			<div class="date">
				<ul class="date--item">
				
				</ul>
			</div>
		</div>
	</div>
	
	
	<div class="section section--time">
		<div class="col--head">시간</div>

		<div class="col--body">
			<div class="theater--time--wrap">
				
			</div>
		</div>
	</div>
</div>

<form action="${path}/ticket/seat" method="post">
	<input type="hidden" id="movieNo" name="movieNo" value="${movieDTO.movieNo}">
	<input type="hidden" id="movieImage" name="movieImage" value="${movieDTO.movieImage}">
	<input type="hidden" id="movieTitle" name="movieTitle" value="${movieDTO.movieTitle}">
	<input type="hidden" id="movieAgeLimit" name="movieAgeLimit" value="${movieDTO.movieAgeLimit}">
	<input type="hidden" id="cinemaNo" name="cinemaNo" value="${cinemaDTO.cinemaNo}">
	<input type="hidden" id="cinemaBLG" name="cinemaBLG" value="${cinemaDTO.cinemaBLG}">
	<input type="hidden" id="cinemaLocation" name="cinemaLocation" value="${cinemaLocation}">
	<input type="hidden" id="theaterNo" name="theaterNo" value="${theaterDTO.theaterNo}">
	<input type="hidden" id="screenDate" name="screenDate" value="${screenDate}">
	<input type="hidden" id="theaterTime" name="theaterTime" value="${theaterTime}">

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
						<img alt="" src="">
						<span>본영화는 <strong></strong> 영화입니다.
						</span>
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

<script src="${path}/resources/js/jquery-3.7.1.min.js" defer></script>
<script src="${path}/resources/js/ticket/ticketMe.js" defer></script>
