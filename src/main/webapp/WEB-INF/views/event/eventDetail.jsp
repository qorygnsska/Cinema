<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link rel="stylesheet"
	href="${path}/resources/css/event/eventDetail.css">

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<div id="eventDetail--container">
		<div id="eventDetail--contents">
			<div class="eventDetail--header">
				<div>
					<h3>
						<em>이벤트</em>
						JERRY에서 영화보고 스탬프 찍자!
					</h3>
					<em class="eventDetail--date">
						<span>기간 : </span>
						2024.07.01 ~ 예산 소진 시 까지
					</em>
				</div>
			</div>
			
			<div class="eventDetail--view--content">
				<div>
					<img src="resources/img/event/스탬프 이벤트.png" alt="스탬프 이벤트">
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>