<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<div class="ticket--seat--cotainer">
	<div class="seat--head">
		인원/좌석
	</div>
	
	<div class="seat--body">
		<div class="screen--info">
			<div>
				<div class="screen--info--person">
					<div class="person--maximum">*인원은 최대 8명까지 선택가능합니다.</div>
					
				</div>
			
				<div class="theater--info">
					<div class="theater--info--img">
						<img src="${path}/resources/img/movie/poster/${movieDTO.movieMainImage}">
					</div>
					
					<div class="theater--info--content">
						<div class="theater--info--content--title">
							<img src="${path}/resources/img/ticket/Image_Age_${movieDTO.movieAgeLimit}.png">
							<span>${movieDTO.movieTitle}</span>
						</div>
						
						
						<div class="theater--info--etc">
							<div>
								<span>${screenDate}</span><span class="theater--info--etc--border"></span><span>${theaterTime}</span>
							</div>
							
							<div>
								<span>${cinemaLocation}</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<div class="theater--minimap">
			<div class="screen">
				<span>SCREEN</span>
			</div>
			
			<div class="seat">
				
			</div>
		</div>
		
		<div class="seat--type--box">
			<div><span class="icon selected"></span>선택</div>
			<div><span class="icon reserved"></span>예매 완료</div>
		</div>
		
		
		<div class="theater--pay">
			<div class="theater--pay-total">
				<div>
					<span>총합계</span>
					<strong class="total--price">0</strong>원
				</div>
			</div>
			
			<form id="seatPayForm" action="${path}/ticket/pay" method="post">
				<input type="hidden" id="movieNo" name="movieNo" value="${movieDTO.movieNo}">
				<input type="hidden" id="movieMainImage" name="movieMainImage" value="${movieDTO.movieMainImage}">
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
				<input type="hidden" id="leftPerson" name="leftPerson" value="">
				
				<input type="hidden" id="ticketPrice" name="ticketPrice" value="">
				
			
				<button type="submit" class="theater--pay--btn">
					결제하기
				</button>
			</form>
			
		</div>
	</div>
</div>



<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${path}/resources/js/ticket/ticketSeat.js" defer></script>