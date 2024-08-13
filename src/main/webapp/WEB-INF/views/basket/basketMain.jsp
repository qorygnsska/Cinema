<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="${path}/resources/css/basket/basketMain.css?v=1.1" rel="stylesheet">
<style>
.basketMain-step-progress li.active::before {
    background-image: url('${path}/resources/img/basket/basket128px.png');
}

.basketMain-step-progress li:nth-child(2)::before {
    background-image: url('${path}/resources/img/basket/wallet128.png');
}

.basketMain-step-progress li:nth-child(3)::before {
    background-image: url('${path}/resources/img/basket/member128.png');
}
</style>
</head>
<body>
  <%@ include file="/WEB-INF/views/common/header.jsp"%>
    <div class="container basketMain-container">
        <!-- 진행 단계 표시 -->
        <ul class="basketMain-step-progress">
            <li class="active">STEP 01<br>장바구니</li>
            <li>STEP 02<br>결제하기</li>
            <li>STEP 03<br>결제완료</li>
        </ul>
        <div class="basketMain-cart-title">
            <input type="checkbox" class="cart-checkbox" id="select-all">
            <label for="select-all"></label>
            <span class="basketMain-product-name">상품명</span>
            <span class="basketMain-product-price">판매금액</span>
            <span class="basketMain-product-quantity">수량</span>
            <span class="basketMain-product-total">구매금액</span>
            <span class="basketMain-product-select">선택</span>
        </div>
        <div class="basketMain-cart-contents">
            <ul class="list-unstyled">
                <li class="basketMain-item">
                    <input type="checkbox" id="checkbox1049824" name="checkbox" value="1049824" checked>
                    <div class="basketMain-item-details">
                        <img src="https://img.cgv.co.kr/GiftStore/Product/PD/List/17223927983220.jpg" alt="상품 이미지">
                        <div class="basketMain-item-text">
                            <div class="basketMain-item-title">〈10 라이브즈〉 얼리버드 관람권</div>
                            <div class="basketMain-item-description">&lt;10 라이브즈&gt;[더빙] 전용 관람권 2매</div>
                        </div>
                    </div>
                    <div class="basketMain-item-price">14,000원</div>
                    <div class="basketMain-item-quantity">
                        <input type="number" value="1">
                    </div>
                    <div class="basketMain-item-total">14,000원</div>
                    <div class="basketMain-item-actions">
                        <button>삭제하기</button>
                    </div>
                </li>
            </ul>
        </div>
        <div class="basketMain-note">
            <button class="basketMain-btn-del-selected">선택상품 삭제</button>
            <span class="basketMain-notimsg">장바구니에 담긴 상품은 최대 30일까지 보관됩니다.</span>
        </div>
        <table class="basketMain-table-bordered">
            <thead>
                <tr>
                    <th>총 상품 금액</th>
                    <th>할인 금액</th>
                    <th>총 결제 예정금액</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><span class="basketMain-amount">100,000</span><span class="basketMain-currency">원</span></td>
                    <td><span class="basketMain-amount2">100,000</span><span class="basketMain-currency2">원</span></td>
                    <td><span class="basketMain-amount3">100,000</span><span class="basketMain-currency3">원</span></td>
                </tr>
            </tbody>
        </table>

        <!-- 주문 요약 및 결제 버튼 -->
        <div class="basketMain-pay">
            <button class="basketMain-btn-pay">결제하기</button>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



