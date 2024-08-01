<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/store/storeList.css">

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>

	<div id="storeDetail--container">
		<div id="storeDetail--contents">
			<div class="storeDetail--wrap-movie-chart">
			
				<hr class="storeDetail--hr"/>
				<div class="storeList--sect-movie-chart">
					<!-- 팝콘 맨 윗 줄 시작 -->
					<ui class="storeList--sect-movie-chart-ol">
						<li class="storeList--sect-movie-chart-ol-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 -->
								<span class="storeList--thumb-image">
									<img class="storeList--movie-poster" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17169696532120.jpg" alt="콘소메 팝콘(L)">
								</span>
							</a>
							<div class="storeList--box-contents">
								<span class="storeList--like">7,000원</span>
							</div>
						</li>
					</ui>
					<!-- 팝콘 맨 윗 줄 끝 -->
				
			</div>
		</div>
	</div>
	
	
	
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>