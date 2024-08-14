<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>



<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section class="ticket--section">
	<div class="ticket--container">
		<img src="${path}/resources/img/ticket/check_icon.png">
	
	</div>
	<img src="${path}/resources/img/ticket/check_icon.png">
	
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>