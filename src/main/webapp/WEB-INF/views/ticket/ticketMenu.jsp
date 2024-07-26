<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/ticket/ticketMenu.css">
	
	
<div class="ticket-main">
	<div class="section section-movie">
		<div class="col-head">
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
					<li>영화 1</li>
					<li>영화 2</li>
					<li>영화 3</li>
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

		<div class="col-body"></div>
	</div>

	<div class="section section-time">
		<div class="col-head">시간</div>

		<div class="col-body"></div>
	</div>
</div>

