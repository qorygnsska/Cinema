<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/ticket/ticketMenu.css?after">
<link rel="stylesheet" href="${path}/resources/css/ticket/ticket.css?after">
<title>Insert title here</title>
</head>
<body>

	<div class="ticket-container">
		<div class="ticket-left">
			<div class="left-section">
				<div>
					<span>01</span>
					<br>
					<span>상영시간</span>
				</div>
				
			</div>

			<div class="left-section">
				<div>
					<span>02</span>
					<br>
					<span>좌석선택</span>
				</div>
			</div>
			
			<div class="left-section">
				<div>
					<span>03</span>
					<br>
					<span>결제</span>
				</div>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/ticket/ticketMenu.jsp"></jsp:include>
		
	</div>
	
</body>
</html>
