<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/ticket/ticket.css">

<title>Insert title here</title>
</head>
<body>

	<div class="ticket-container">
		<div class="ticket-left">
		
		</div>
		
		<jsp:include page="/WEB-INF/views/ticket/ticketMenu.jsp" flush="true"></jsp:include>
		
	</div>
	<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
</body>
</html>
