<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<div id="eventList--container">
		<div id="eventList--contents">
			<div class="eventList--wrap--content">
				<ul class="eventList--list--item">
					<c:forEach var="eventList" items="${eventList}">
						<li><a class="eventList--a" href="eventDetail?eventNo=${eventList.eventNo}"> <!-- eventDetail 페이지로 이동 -->
								<div class="eventList--evt--thumb">
									<img src="resources/img/event/${eventList.eventTitleImage}" alt="스탬프 타이틀">
								</div>
								<div class="eventList--evt--desc">
									<p class="eventList--txt1">${eventList.eventName}</p>
									<p class="eventList--txt2">${eventList.eventDate}</p>
								</div>
						</a></li>
					</c:forEach>
				</ul>
				
			
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>