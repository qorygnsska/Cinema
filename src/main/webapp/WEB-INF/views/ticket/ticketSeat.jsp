<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/ticket/ticketSeat.css?after">

<div class="ticket--seat--cotainer">
	<div class="seat--head">
		인원/좌석
	</div>
	
	<div class="seat--body">
		<div class="screen--info">
			<div>
				<div class="screen--info--person">
					<c:if test="19세 이상이니">
							
					</c:if>
					
					<!-- 19세 미만이니 -->
					<div class="person--count person--adult">
						<span>일반</span>
						<ul>
							<li>
								<c:forEach var="i" begin="0" end="8">
									<button class="person--btn">${i}</button>
								</c:forEach>
							</li>
						</ul>
					</div>
					
					<div class="person--count person--student">
						<span>청소년</span>
						<ul>
							<li>
								<c:forEach var="i" begin="0" end="8">
									<button class="person--btn">${i}</button>
								</c:forEach>
							</li>
						</ul>
					</div>
					
					<div class="person--count person--senior">
						<span>시니어</span>
						<ul>
							<li>
								<c:forEach var="i" begin="0" end="8">
									<button class="person--btn">${i}</button>
								</c:forEach>
							</li>
						</ul>
					</div>
				</div>
			
				<div class="theater--info">
					<div class="theater--info--img">
						<img src="${path}/resources/img/mypageimg/결백.jpg">
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
	</div>


</div>

<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${path}/resources/js/ticket/ticketSeat2.js" defer></script>