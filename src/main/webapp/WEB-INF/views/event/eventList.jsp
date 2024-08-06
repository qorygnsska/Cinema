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
					<li>
						<a id="eventList--1" href="eventDetail"> <!-- eventDetail 페이지로 이동 -->
							<div class="eventList--evt--thumb">
								<img src="resources/img/event/스탬프 타이틀.png" alt="스탬프 타이틀">
							</div>
							<div class="eventList--evt--desc">
								<p class="eventList--txt1">JERRY에서 영화보고 스탬프 찍자!</p>
								<p class="eventList--txt2">2024.07.01~예산 소진 시 까지</p>
							</div>
						</a>
					</li>
					
					<li>
						<a id="eventList--2" href="eventDetail"> <!-- eventDetail 페이지로 이동 -->
							<div class="eventList--evt--thumb">
								<img src="resources/img/event/삼성 타이틀.png" alt="삼성 타이틀">
							</div>
							<div class="eventList--evt--desc">
								<p class="eventList--txt1">삼성카드로 결제하면 6000원 할인!</p>
								<p class="eventList--txt2">2024.08.01~2024.08.31</p>
							</div>
						</a>
					</li>
					
					<li>
						<a id="eventList--3" href="eventDetail"> <!-- eventDetail 페이지로 이동 -->
							<div class="eventList--evt--thumb">
								<img src="resources/img/event/신한 타이틀.png" alt="신한 타이틀">
							</div>
							<div class="eventList--evt--desc">
								<p class="eventList--txt1">신한카드 결제 시 2000원 즉시 할인!</p>
								<p class="eventList--txt2">2024.07.01~예산 소진 시 까지</p>
							</div>
						</a>
					</li>
					
				</ul>
				
				<ul class="eventList--list--item">
					<li>
						<a id="eventList--4" href="eventDetail"> <!-- eventDetail 페이지로 이동 -->
							<div class="eventList--evt--thumb">
								<img src="resources/img/event/국민 타이틀.png" alt="국민 타이틀">
							</div>
							<div class="eventList--evt--desc">
								<p class="eventList--txt1">KB국민카드 결제 시 5천 원 즉시 할인</p>
								<p class="eventList--txt2">2024.08.01~2024.08.31</p>
							</div>
						</a>
					</li>
					
					<li>
						<a id="eventList--5" href="eventDetail"> <!-- eventDetail 페이지로 이동 -->
							<div class="eventList--evt--thumb">
								<img src="resources/img/event/코나 타이틑.jpg" alt="코나 타이틀">
							</div>
							<div class="eventList--evt--desc">
								<p class="eventList--txt1">코나카드로 영화 관람 시 2천 원 할인</p>
								<p class="eventList--txt2">2023.09.19~2026.09.18</p>
							</div>
						</a>
					</li>
					
					<li>
						<a id="eventList--6" href="eventDetail"> <!-- eventDetail 페이지로 이동 -->
							<div class="eventList--evt--thumb">
								<img src="resources/img/event/현대 타이틀.png" alt="현대 타이틀">
							</div>
							<div class="eventList--evt--desc">
								<p class="eventList--txt1">현대카드로 결제 시 3000원 할인</p>
								<p class="eventList--txt2">2024.01.01~예산 소진 시 까지</p>
							</div>
						</a>
					</li>
					
				</ul>
			
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>