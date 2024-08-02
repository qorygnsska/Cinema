<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/store/storeDetail.css">

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<div id="storeDetail--container">
		<div id="storeDetail--contents">
			<div class="storeDetail--wrap-movie-detail">
				<div class="storeDetail--sect-base-movie">
					<div class="storeDetail--box-image">
						<a href="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_1000.jpg" title="포스터 크게 보기 새창" target="_blank">
							<span class="storeDetail--thumb-image">
								<img class="storeDetail--movie-poster" src="http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/17169684033160.jpg" alt="콘소메 팝콘(L)">
							</span>
						</a>
					</div>
					
					<div class="storeDetail--box-contents">
						<div class="storeDetail--title">
							<strong>콘소메 팝콘(L)</strong>
						</div>
						<div class="storeDetail--score">
							<strong class="storeDetail--percent">
								7,000원
							</strong>
							<span class="storeDetail--origin">
								원산지 : 
								<span>
									팝콘(옥수수:미국산)
								</span>
							</span>
						</div>
						
						<div class="storeDetail--box-info">
							<div class="storeDetail--count">
							<a href="none" class="storeDetail--count--min">-</a>
							<span class="storeDetail--count--result">1</span>
							<a href="none" class="storeDetail--count--plus">+</a>
							<span class="storeDetail--total--price">7000원</span>
							</div>
						</div>
						
						<span class="storeDetail--like">
							<a class="storeDetail--link-reservation" href=""> <!-- 예매 사이트로 이동 -->
								예매하기										
							</a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>