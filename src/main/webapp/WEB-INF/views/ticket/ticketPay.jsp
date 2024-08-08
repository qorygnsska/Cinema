<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<link rel="stylesheet" href="${path}/resources/css/ticket/ticketPay.css?after">



<div class="ticket--pay--cotainer">

	<%-- 결제수단 --%>
	<div class="section section--pay--type">
		<div class="col--head">결제 수단</div>

		<div class="col--body">
			<div>
				<div>
				
				</div>
				
				<div>
				
				</div>
			</div>
		</div>
	</div>
	
	
	
	<%-- 예매정보/결제하기 --%>
	<div class="section section--pay">
		<div class="col--head">결제하기</div>
		<div class="col--body">
			<div>
				<div>
				
				</div>
				
				<div>
				
				</div>
			</div>
		</div>
	</div>
	
</div>


<input type="hidden" id="movieNo" name="movieNo" value="${movieDTO.movieNo}">
<input type="hidden" id="movieImage" name="movieImage" value="${movieDTO.movieImage}">
<input type="hidden" id="movieTitle" name="movieTitle" value="${movieDTO.movieTitle}">
<input type="hidden" id="movieAgeLimit" name="movieAgeLimit" value="${movieDTO.movieAgeLimit}">

<input type="hidden" id="cinemaNo" name="cinemaNo" value="${cinemaDTO.cinemaNo}">
<input type="hidden" id="cinemaBLG" name="cinemaBLG" value="${cinemaDTO.cinemaBLG}">
<input type="hidden" id="cinemaLocation" name="cinemaLocation" value="${cinemaLocation}">
<input type="hidden" id="screenDate" name="screenDate" value="${screenDate}">

<input type="hidden" id="theaterNo" name="theaterNo" value="${theaterDTO.theaterNo}">
<input type="hidden" id="theaterTime" name="theaterTime" value="${theaterTime}">

<input type="hidden" id="ticketTeen" name="ticketTeen" value="">
<input type="hidden" id="ticketAdult" name="ticketAdult" value="">
<input type="hidden" id="ticketSenior" name="ticketSenior" value="">

<input type="hidden" id="leftSeatNum" name="leftSeatNum" value="">

			

<script src="${path}/resources/js/ticket/ticketPay.js" defer></script>

