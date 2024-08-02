<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/css/store/storeDetail.css">

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<div id="detail--container">
		<div id="detail--contents">
			<div class="detail--wrap-movie-detail">
				<div class="detail--sect-base-movie">
					<div class="detail--box-image">
						<a href="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_1000.jpg" title="포스터 크게 보기 새창" target="_blank">
							<span class="detail--thumb-image">
								<img class="detail--movie-poster" src="http://img.cgv.co.kr/GiftStore/Product/Pc/Detail/17169684033160.jpg" alt="콘소메 팝콘(L)">
							</span>
						</a>
					</div>
					
					<div class="detail--box-contents">
						<div class="detail--title">
							<strong>콘소메 팝콘(L)</strong>
						</div>
						<div class="detail--score">
							<strong class="detail--percent">
								7,000원
							</strong>
							<sapn class="storeDetail--origin">
								원산지 : 
								<span>
									팝콘(옥수수:미국산)
								</span>
							</sapn>
						</div>
						
						<div class="detail--box-info">
							<div class="detail--count">
							<a href="none" class="detail--count--min">-</a>
							<span class="detail--count--result">1</span>
							<a href="none" class="detail--count--plus">+</a>
							<span class="detail--total--price">7000원</span>
							</div>
						</div>
						
						<span class="detail--like">
							<a class="detail--link-reservation" href=""> <!-- 예매 사이트로 이동 -->
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