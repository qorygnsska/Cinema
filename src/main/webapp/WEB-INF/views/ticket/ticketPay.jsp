<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<link rel="stylesheet" href="${path}/resources/css/ticket/ticketPay.css?after">



<div class="ticket--pay--cotainer">

	<%-- 결제수단 --%>
	<div class="section section--pay--type">
		<div class="col--head">결제 수단</div>

		<div class="col--body">
			<div>
				<div>
				
				</div>
				
				<div>
				
				</div>
			</div>
		</div>
	</div>
	
	
	
	<%-- 예매정보/결제하기 --%>
	<div class="section section--pay">
		<div class="col--head">결제하기</div>
		<div class="col--body">
			<div>
				<div>
				
				</div>
				
				<div>
				
				</div>
			</div>
		</div>
	</div>
	
</div>


<script src="${path}/resources/js/ticket/ticketPay.js" defer></script>

