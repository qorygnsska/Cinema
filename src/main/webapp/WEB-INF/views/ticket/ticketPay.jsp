<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<link rel="stylesheet" href="${path}/resources/css/ticket/ticketPay.css?after">



<div class="ticket--pay--cotainer">

	<%-- 결제수단 --%>
	<div class="section section--pay--type">
		<div class="col--head">쿠폰 / 결제 수단</div>

		<div class="col--body">
			<div class="pay--type">
				<div class="coupon">
					<div class="my--coupon--box">
						<div class="my--coupon">
							보유 쿠폰<span>(${memberDTO.memberCoupon})</span>
							<input type="hidden" id="memberCoupon" value="${memberDTO.memberCoupon}"/>
						</div>
						
						
						<div class="use--coupon">
							적용 가능한 매수 <span>${couponMax}/</span><span class="useCouponCnt">0</span><span> 매</span>
							<input type="hidden" id="couponMax" value="${couponMax}">
						</div>
					</div>
					
					
					<div class="coupon--list--box">
						<ul class="coupon--list--item">
							
						
						</ul>
					</div>
				</div>
				
				<div class="pay--type--select--box">
					<div class="pay--type--select--title">
						<div>
							<span>결제 수단</span>
						</div>
						
						
						<div class="discountRate--wrap">
							<div class="discountRate--info">
								<span>*할인율</span>
								<c:forEach var="card" items="${cardList}">
									<span>${card.cardCompanyName} : ${card.cardDiscount}%</span>
								</c:forEach>
							</div>
							
							<div class="discountRate--info--icon">
								<i class="fa-regular fa-circle-question"></i>
							</div>
							
							
						</div>
					</div>
					
					
					<div>
						<ul class="pay--type--select">
							<c:forEach var="card" items="${cardList}">
								<li>
									<button class="pay--type--btn" name="${card.cardCompanyName}" cardNo="${card.cardNo}" discountRate="${card.cardDiscount}">
										<div class="pay-type--btn--img">
											<img alt="결제 타입 아이콘" src="${path}/resources/img/ticket/${card.cardImage}">
											<span>${card.cardCompanyName}</span>
										</div>
									</button>
								</li>	
							</c:forEach>					
						</ul>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	
	
	
	<%-- 예매정보/결제하기 --%>
	<div class="section section--pay">
		<div class="col--head">영화정보 / 결제하기</div>
		<div class="col--body">
			<div class="payment--wrap">
				<div class="payment--movie--info--box">
					<div class="ticket--info--title">
						영화 정보
					</div>
					
					<div class="ticket--info">
						<div class="ticket--info--img">
							<img alt="영화 이미지" src="${path}/resources/img/movie/poster/${movieDTO.movieMainImage}">
						</div>
						
						<div class="ticket--detail--info">
							<div class="ticket--detail--title">
								<img src="${path}/resources/img/ticket/Image_Age_${movieDTO.movieAgeLimit}.png">					
								
								<span>${movieDTO.movieTitle}</span>
							</div>
							
							<ul>
								<li>
									<span>날짜</span> ${screenDate}
								</li>
								
								<li>
									<span>시간</span> ${theaterTime}
								</li>
								
								<li>
									<span>위치</span> ${cinemaLocation}
								</li>
								
								
								<li>
									<span>인원</span> ${leftPerson}
								</li>
								
								<li>
									<div class="seat--info">
										<span>좌석</span>
										<div>${leftSeatNum}</div>
									</div>
									
								</li>
							</ul>
						</div>
					</div>
				</div>
				
				<div class="payment--box">
					<div class="price--box ticket--price">
						<div>
							<span>상품금액</span>
							<span><strong>${ticketPrice}</strong>원</span>
						</div>
					</div>
					
					<div class="price--box ticket--discount">
						<div>
							<span>할인금액</span>
							<span>-<strong class="pay--discount">0</strong>원</span>
						</div>
					</div>
					
					<div class="price--box ticket--total--price">
						<div>
							<span>결제금액</span>
							<span><strong class="pay--totalPrice">${ticketPrice}</strong>원</span>
						</div>
					</div>
					
					<button type="submit" class="pay--btn">	
						결제하기
					</button>
				
				</div>
			</div>
		</div>
	</div>
</div>



					
<%-- 좌석 --%>
<input type="hidden" id="leftSeatNum" name="leftSeatNum" value="${leftSeatNum}">
<input type="hidden" id="theaterNo" name="theaterNo" value="${theaterDTO.theaterNo}">

<%-- 결제 내역 --%>
<input type="hidden" id="cardNo" name="cardNo" value="">
<input type="hidden" id="paymentType" name="paymentType" value="">
<input type="hidden" id="paymentDate" name="paymentDate" value="">
<input type="hidden" id="paymentPrice" name="paymentPrice" value="">

<%-- 티켓 내역 --%>
<input type="hidden" id="memberId" name="memberId" value="${memberDTO.memberId}">
<input type="hidden" id="movieNo" name="movieNo" value="${movieDTO.movieNo}">
<input type="hidden" id="cinemaNo" name="cinemaNo" value="${cinemaDTO.cinemaNo}">			
<input type="hidden" id="ticketTeen" name="ticketTeen" value="${ticketTeen}">
<input type="hidden" id="ticketAdult" name="ticketAdult" value="${ticketAdult}">
<input type="hidden" id="ticketSenior" name="ticketSenior" value="${ticketSenior}">


<%-- 기타 --%>

<input type="hidden" id="totalPrice" name="totalPrice" value="${ticketPrice}">

<input type="hidden" id="movieAgeLimit" name="movieAgeLimit" value="${movieDTO.movieAgeLimit}">
<input type="hidden" id="movieMainImage" name="movieMainImage" value="${movieDTO.movieMainImage}">
<input type="hidden" id="movieTitle" name="movieTitle" value="${movieDTO.movieTitle}">


<input type="hidden" id="cinemaBLG" name="cinemaBLG" value="${cinemaDTO.cinemaBLG}">
<input type="hidden" id="cinemaLocation" name="cinemaLocation" value="${cinemaLocation}">
<input type="hidden" id="screenDate" name="screenDate" value="${screenDate}">

<input type="hidden" id="theaterTime" name="theaterTime" value="${theaterTime}">

<input type="hidden" id="memberName" name="memberName" value="${memberDTO.memberName}">
<input type="hidden" id="memberEmail" name="memberEmail" value="${memberDTO.memberEmail}">
<input type="hidden" id="memberPhone" name="memberPhone" value="${memberDTO.memberPhone}">

<script src="${path}/resources/js/ticket/ticketPay.js" defer></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
