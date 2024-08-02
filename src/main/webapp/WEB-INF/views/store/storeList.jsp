<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/css/store/storeList.css">

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>

	<div id="storeList--container">
		<div id="storeList--contents">
			<div class="storeList--wrap-product-chart">
				<!-- 팝콘 시작 -->
				<strong class="storeList--product--title">팝콘</strong>
				<hr class="storeList--hr" />
				<div class="storeList--sect-product-chart">
					<ui class="storeList--sect-product-chart-ui">
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17169696532120.jpg" alt="콘소메 팝콘(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">콘소메 팝콘(L)</span>
									<span class="storeList--contents--price">7,000원</span>
								</div>
							</a>
						</li>
						
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17169696532120.jpg" alt="콘소메 팝콘(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">콘소메 팝콘(L)</span>
									<span class="storeList--contents--price">7,000원</span>
								</div>
							</a>
						</li>
						
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17169696532120.jpg" alt="콘소메 팝콘(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">콘소메 팝콘(L)</span>
									<span class="storeList--contents--price">7,000원</span>
								</div>
							</a>
						</li>
						
					</ui>
					
					<ui class="storeList--sect-product-chart-ui">
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17169696532120.jpg" alt="콘소메 팝콘(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">콘소메 팝콘(L)</span>
									<span class="storeList--contents--price">7,000원</span>
								</div>
							</a>
						</li>
						
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17169696532120.jpg" alt="콘소메 팝콘(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">콘소메 팝콘(L)</span>
									<span class="storeList--contents--price">7,000원</span>
								</div>
							</a>
						</li>
						
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17169696532120.jpg" alt="콘소메 팝콘(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">콘소메 팝콘(L)</span>
									<span class="storeList--contents--price">7,000원</span>
								</div>
							</a>
						</li>
						
					</ui>
					<!-- 팝콘 끝 -->
					
					<!-- 음료 시작 -->
					<strong class="storeList--product--title">음료</strong>
				<hr class="storeList--hr" />
				<div class="storeList--sect-product-chart">
					<ui class="storeList--sect-product-chart-ui">
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16988138771190.jpg" alt="탄산음료(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">탄산음료(L)</span>
									<span class="storeList--contents--price">3,500원</span>
								</div>
							</a>
						</li>
						
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16988138771190.jpg" alt="탄산음료(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">탄산음료(L)</span>
									<span class="storeList--contents--price">3,500원</span>
								</div>
							</a>
						</li>
						
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16988138771190.jpg" alt="탄산음료(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">탄산음료(L)</span>
									<span class="storeList--contents--price">3,500원</span>
								</div>
							</a>
						</li>
						
					</ui>
					
					<ui class="storeList--sect-product-chart-ui">
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16988138771190.jpg" alt="탄산음료(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">탄산음료(L)</span>
									<span class="storeList--contents--price">3,500원</span>
								</div>
							</a>
						</li>
						
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16988138771190.jpg" alt="탄산음료(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">탄산음료(L)</span>
									<span class="storeList--contents--price">3,500원</span>
								</div>
							</a>
						</li>
						
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16988138771190.jpg" alt="탄산음료(L)">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">탄산음료(L)</span>
									<span class="storeList--contents--price">3,500원</span>
								</div>
							</a>
						</li>
						
					</ui>
					<!-- 음료 끝 -->
					
					<!-- 스낵 시작 -->
					<strong class="storeList--product--title">스낵</strong>
				<hr class="storeList--hr" />
				<div class="storeList--sect-product-chart">
					<ui class="storeList--sect-product-chart-ui">
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17170567336240.jpg" alt="칠리치즈나쵸">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">칠리치즈나쵸</span>
									<span class="storeList--contents--price">5,500원</span>
								</div>
							</a>
						</li>
						
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17170567336240.jpg" alt="칠리치즈나쵸">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">칠리치즈나쵸</span>
									<span class="storeList--contents--price">5,500원</span>
								</div>
							</a>
						</li>
						
						<li class="storeList--sect-product-chart-ui-li">
							<a href="storeDetail"> <!-- 상세정보 페이지로 이동 --> 
								<span class="storeList--thumb-image"> 
									<img class="storeList--product--image" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17170567336240.jpg" alt="칠리치즈나쵸">
								</span>
								<div class="storeList--box-contents">
									<span class="storeList--contents--title">칠리치즈나쵸</span>
									<span class="storeList--contents--price">5,500원</span>
								</div>
							</a>
						</li>
						
					</ui>
					<!-- 스낵 끝 -->

				</div>
			</div>
		</div>
	</div>



</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>