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
				
				<button type="button" class="t--btn">
					가나다순
				</button>
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
			</div>
		</div>
	</div>
	
	
	
	

	<div class="section section--time">
		<div class="col--head">시간</div>

		<div class="col--body">
			<div class="theater--time--wrap">
				<div class="theater--time">
					<span>1관</span>
					<ul>
						<li>
							<button type="button" class="t--btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
							
						</li>
						
						<li>
							<button type="button" class="t--btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
						</li>
						
						<li>
							<button type="button" class="t--btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
						</li>
						
						<li>
							<button type="button" class="t--btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
						</li>
					</ul>
				</div>
				
				<div class="theater--time">
					<span>2관</span>
					<ul>
						<li>
							<button type="button" class="t--btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
							
						</li>
						
						<li>
							<button type="button" class="t--btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
						</li>
						
						<li>
							<button type="button" class="t--btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${path}/resources/js/jquery-3.7.1.min.js" defer></script>
<script src="${path}/resources/js/ticket/ticketMe.js" defer></script>
