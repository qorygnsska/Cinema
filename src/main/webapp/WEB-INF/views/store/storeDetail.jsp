<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
						<span class="storeDetail--thumb-image">
							<img class="storeDetail--movie-poster" src="resources/img/store/${store.productImage}" alt="">
						</span>
					</div>
					
					<div class="storeDetail--box-contents">
						<div class="storeDetail--title">
							<strong>${store.productName}</strong>
						</div>
						<div class="storeDetail--product--info">
							<strong class="storeDetail--product--info--price">
								<fmt:formatNumber value="${store.productPrice}" pattern="#,###"/>원
							</strong>
							<span class="storeDetail--origin">
								원산지 : 
								<span>
									${store.productOrigin}
								</span>
							</span>
						</div>
						
						<div class="storeDetail--box-info">
							<p class="storeDetail--content">${store.productContent}</p>
							<div class="storeDetail--count">
							<a href="#" class="storeDetail--count--min">-</a>
							<span class="storeDetail--count--result">1</span>
							<a href="#" class="storeDetail--count--plus">+</a>
							<span class="storeDetail--price">
								총 구매금액
								<span class="storeDetail--total--cost"><fmt:formatNumber value="${store.productPrice}" pattern="#,###"/>원</span>
								</span>
							</div>
						</div>

						<span class="storeDetail--AddCart"> 
						<a id="confirmAddToBasket" class="storeDetail--AddCart--send" href="#"> <!-- 모달 창 띄우기 -->
								장바구니
						</a>
						</span>
						

						<!-- 팝업창 -->
						<div class="modal" id="exampleModal" tabindex="-1" onclick="redirectToStoreDetail(${store.productNo})">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title">장바구니 등록</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal" aria-label="Close" onclick="redirectToStoreDetail(${store.productNo})"></button>
									</div>
									<div class="modal-body">
										<p>장바구니에 등록되었습니다.</p>
										<p>확인하시겠습니까?</p>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal" onclick="redirectToStoreDetail(${store.productNo})">취소</button>
										<button onclick="event.stopPropagation(); location.href='basket/basketMain'" type="button" class="btn btn-primary">확인</button>
									</div>
								</div>
							</div>
						</div>
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

<script>
    // JavaScript 파일을 로드하고, productPrice 값을 전달
    const productPrice = ${store.productPrice};
    const id = "${id}";
    const productNo = ${store.productNo};
    const path = "${path}";
    
    function redirectToStoreDetail(productNo) {
        window.location.href = `${path}/storeDetail?productNo=` + productNo;
    }
</script>
<script src="${path}/resources/js/store/button.js"></script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>