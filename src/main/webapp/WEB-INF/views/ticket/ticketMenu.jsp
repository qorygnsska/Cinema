<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	
	
<div class="ticket-main">
	<div class="section section-movie">
		<div class="col-head" id="login">
			영화
		</div>

		<div class="col-body">
			<div class="tap-menu">
				<button class="btn">
					애매율순
				</button>
				
				<button class="btn">
					가나다순
				</button>
			</div>
			
			<div class="movie-list">
				<ul>
					<c:forEach var="movie" items="${movieList}">
						<li>
							<span>${movie.movieAgeLimit}</span>
							<span>${movie.movieTitle}</span>
						</li>
					</c:forEach>
				</ul>			
			</div>
		</div>
	</div>

	<div class="section section-theater">
		<div class="col-head">극장</div>

		<div class="col-body"></div>
	</div>

	<div class="section section-date">
		<div class="col-head">날짜</div>

		<div class="col-body">
			<div class="date">
			</div>
		</div>
	</div>

	<div class="section section-time">
		<div class="col-head">시간</div>

		<div class="col-body"></div>
	</div>
</div>

<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${path}/resources/js/ticket/ticketMe.js" defer></script>
