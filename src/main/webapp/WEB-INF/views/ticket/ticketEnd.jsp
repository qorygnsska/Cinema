<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path}/resources/css/ticket/ticketEnd.css">
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>



<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section class="ticketEnd--section">
	<div class="ticketEnd--container">
		<div class="ticketEnd--image">
			<img src="${path}/resources/img/ticket/check_icon.png">
		</div>
		
		<p>결제가 완료되었습니다.</p>
		<div class="changePage">
			<a class="home--btn" href="${path}/">홈으로</a>
			<a class="ticketCheck--btn" href="${path}/myMovie">티켓확인</a>
		</div>
	</div>

	
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>