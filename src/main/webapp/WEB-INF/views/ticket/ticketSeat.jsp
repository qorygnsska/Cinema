<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/ticket/ticketSeat.css?after">

<div class="ticket-seat-cotainer">
	<div class="seat-head">
		인원/좌석
	</div>
	
	<div class="seat-body">
		<div class="screen-info">
			<div class="screen-info-person">
				<c:if test="19세 이상이니">
						
				</c:if>
				
				<!-- 19세 미만이니 -->
				<div class="person-count">
					<span>일반</span>
					<ul>
						<li>
							<button class="person-btn">1</button>
							<button class="person-btn">2</button>
							<button class="person-btn">3</button>
							<button class="person-btn">4</button>
							<button class="person-btn">5</button>
							<button class="person-btn">6</button>
							<button class="person-btn">7</button>
							<button class="person-btn">8</button>
						</li>
					</ul>
				</div>
				
				<div class="person-count">
					<span>청소년</span>
					<ul>
						<li>
							<button class="person-btn">1</button>
							<button class="person-btn">2</button>
							<button class="person-btn">3</button>
							<button class="person-btn">4</button>
							<button class="person-btn">5</button>
							<button class="person-btn">6</button>
							<button class="person-btn">7</button>
							<button class="person-btn">8</button>
						</li>
					</ul>
				</div>
				
				<div class="person-count">
					<span>노인</span>
					<ul>
						<li>
							<button class="person-btn">1</button>
							<button class="person-btn">2</button>
							<button class="person-btn">3</button>
							<button class="person-btn">4</button>
							<button class="person-btn">5</button>
							<button class="person-btn">6</button>
							<button class="person-btn">7</button>
							<button class="person-btn">8</button>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="theater-info">
				<p>
					<span>구로</span>
					<span>1관</span>
					<span>남은좌석 69/85</span>
				</p>
				<p>
					2024.08.04(수) 18:10~18:40
				</p>
			</div>
		</div>
		
		<div class="theater-minimap">
			<div>screen</div>
			
			<div class="seat">
				
			</div>
		</div>
	</div>


</div>

<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${path}/resources/js/ticket/ticketSeat2.js" defer></script>