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
			<div class="storeDetail--wrap-store-detail">
				<div class="storeDetail--sect-base-store">
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
						<div class="storeDetail--product--info">
							<strong class="storeDetail--product--info--price">
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
							<a href="" class="storeDetail--count--min">-</a>
							<span class="storeDetail--count--result">1</span>
							<a href="" class="storeDetail--count--plus">+</a>
							<span class="storeDetail--price">
								총 구매금액
								<span>7000원</span>
								</span>
							</div>
							<!-- <div class="storeDetail--total--price">
								<p>
									총 구매금액
									<span>7,000원</span>
								</p>
							</div> -->
						</div>
						
						<span class="storeDetail--AddCart">
							<a href=""> <!-- 장바구니 페이지로 이동-->
								장바구니										
							</a>
						</span>
					</div>
				</div>
				
				<dl class="storeDetail--product--dlist">
					<dt>이용안내</dt>
					<dd>
					• 스토어 상품은 회원만 구매하실 수 있습니다.
					<br>
					• 극장 사정에 따라 일부 메뉴 제공이 어려울 수 있습니다.
					<br>
					• 해당 기프트콘은 오프라인 매점에서 실제 상품으로 교환할 수 있는 온라인 상품권입니다.
					<br>
					• 구매 후 전송받으신 기프트콘은, 사용가능한 JERRY 매점에서 지정된 해당 상품으로만 교환이 가능합니다.
					<br>
					• 상기 이미지는 실제와 다를 수 있습니다.
					</dd>
				</dl>
				
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>