<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/css/ticket/ticketMenu.css?after">
<link rel="stylesheet" href="${path}/resources/css/ticket/ticket.css?after">
<script src="${path}/resources/js/jquery-3.7.1.min.js" defer></script>


<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<div class="ticket-container">
		<div class="ticket-left">
			<div class="left-section selected">
				<div>
					<span>01</span>
					<br>
					상영시간
				</div>
				
			</div>

			<div class="left-section">
				<div>
					<span>02</span>
					<br>
					좌석선택
				</div>
			</div>
			
			<div class="left-section">
				<div>
					<span>03</span>
					<br>
					결제
				</div>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/ticket/ticketMenu.jsp"></jsp:include>
		
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


