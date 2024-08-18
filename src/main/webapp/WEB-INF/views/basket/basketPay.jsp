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
<title>JERRY MOVIE</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	    <!-- JavaScript 파일을 링크 -->
<script src="${path}/resources/js/basket/basketPay.js"></script>
<link rel="stylesheet" type="text/css" href="${path}/resources/img/basketEnd.css">

<style>
.basketPay-step-progress li:nth-child(1)::before {
	background-image: url('${path}/resources/img/basket/basket128.png');
}

.basketPay-step-progress li.active::before {
	background-image: url('${path}/resources/img/basket/wallet128y.png');
}

.basketPay-step-progress li:nth-child(3)::before {
	background-image: url('${path}/resources/img/basket/member128.png');
}

.basketPay-container {
    width: 1220px !important;
    height:100%;
    margin: 230px auto 0 auto;
    padding: 0 20px;
    min-height: 100vh; /* 컨테이너가 화면 전체 높이를 차지하게 설정 */
    position: relative; /* 자식 요소가 컨테이너를 기준으로 위치하도록 설정 */
      clear: both;
}
body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
}

.container {
    flex: 1; /* 이 컨테이너가 가능한 모든 공간을 차지하게 설정 */
}
.basketPay-step-progress {
	display: flex;
	justify-content: space-between;
	list-style-type: none;
	padding: 20px 0;
	 clear: both; /* float 문제가 있을 때 컨테이너 높이를 자동으로 맞춤 */
}

.basketPay-step-progress li {
	font-weight: bold;
	flex: 1;
	text-align: left;
	color: #ddd;
	position: relative; /* ::before 및 ::after를 위한 상대 위치 설정 */
	padding-left: 50px; /* 아이콘 공간 확보 */
	margin-left: 115px;
}

.basketPay-step-progress li::before {
	content: '';
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	width: 30px; /* 아이콘 크기 */
	height: 30px; /* 아이콘 크기 */
	background-size: contain;
	background-repeat: no-repeat;
	background-position: center;
}

.basketPay-step-progress li.active {
	font-weight: bold;
	color: #fdd000;
	margin-left: 115px;
	font-size: 19px;
}

.basketPay-step-progress li::after {
	content: '>';
	position: absolute;
	right: -15px; /* 기호를 텍스트에 더 가깝게 조정 */
	top: 50%;
	transform: translateY(-50%);
	color: #ddd;
	font-size: 2.5em;
}

.basketPay-step-progress li:last-child::after {
	content: ''; /* 마지막 항목에서는 > 기호를 표시하지 않음 */
}
.basketPay-cart-contents{
    height: 300px !important; /* 높이를 제한하여 3~5개의 항목만 보이도록 설정 */
    overflow-y: auto; /* 세로 스크롤바 추가 */
    border-bottom: 1.5px solid black;}
.basketPay-cart-name {
	width: 100%;
	height: 50px;
	padding: 12px 0px 8px;
	font-size: 18px;
	border-bottom: 1px solid black;
	margin-top: 10px;
	font-weight: bold;
}

.basketPay-product-title {
	align-items: center;
	padding: 10px 0;
	border-bottom: 2px solid #ccc;
	height: 52px;
	background: #fafafa;
}

.basketPay-product-title span {
	position: relative; /* 상대적인 위치 설정 */
	top: -3px; /* 현재 위치에서 2px 위로 이동 */
	flex: 1;
	margin-left: 20px;
	text-align: center;
	height: 24px; /* 모든 span의 높이를 24px로 설정 */
	line-height: 24px; /* 텍스트가 중앙에 오도록 line-height 설정 */
	display: inline-block; /* inline-block으로 설정하여 너비 적용 */
}

.basketPay-product-title .basketPay-product-name {
	width: 360px !important; /* 상품명의 너비 설정 */
	text-align: center; /* 텍스트를 왼쪽 정렬 */
}

.basketPay-product-title .basketPay-product-price {
	width: 210px; /* 판매금액의 너비 설정 */
	text-align: right;
}

.basketPay-product-title .basketPay-product-quantity {
	width: 165px !important;
	text-align: right;
}

.basketPay-product-title .basketPay-product-total {
	width: 200px !important;
	text-align: right;
	margin-left: 40px;
}

.basketPay-item {
	display: flex;
	align-items: center;
	border-bottom: 1px solid #ccc;
	padding: 10px 0;
}

.basketPay-item-details {
	display: flex;
	align-items: center;
	width: 500px; /* 전체 너비를 360px로 설정 */
	text-align: left;
	margin-right: 15px;
	margin-left: 40px;
}

.basketPay-item-details img {
	width: 90px;
	height: 90px;
	margin-right: 10px;
	border: 1px solid #000;
}

.basketPay-item-title, .basketMain-item-description {
	font-size: 14px;
	line-height: 1.5;
	width: 400px;
	margin-left: 35px;
}

.basketPay-item-title {
	font-weight: bold;
	font-size: 16px;
	margin-bottom: 5px;
}

.basketPay-item-text {
	display: flex;
	flex-direction: column; /* 텍스트를 위에서 아래로 배치 */
}

.basketPay-item-price {
	width: 115px;
	text-align: left;
	margin-right: 10px;
	margin-left: 1px;
}

.basketPay-item-quantity {
	width: 165px;
	text-align: center;
	margin-left: 26px;
	margin-right: 10px;
}

.basketPay-item-total {
	width: 200px;
	text-align: center;
	margin-right: 10px;
	margin-left: 41px;
}

.basketPay-table-bordered {
	border-bottom: 2px solid #ccc; /* 테이블 외곽선 제거 */
}

.basketPay-table-bordered th, .basketPay-table-bordered td {
	border-bottom: 4px solid #ccc; /* 각 셀의 테두리 제거 */
}

.basketPay-table-bordered td:nth-child(2)::before,
	.basketPay-table-bordered td:nth-child(2)::after {
	content: '';
	display: inline-block;
	width: 51px; /* 동그라미 크기 */
	height: 52px; /* 동그라미 크기 */
	border-radius: 50%;
	border: 1px solid #000; /* 동그라미 테두리 */
	text-align: center;
	line-height: 28px;
	font-weight: bold;
	position: absolute; /* 절대 위치 */
	top: 50%; /* 수직 중앙 정렬 */
	transform: translateY(-50%); /* 수직 중앙 정렬 */
	font-size: 50px; /* 부호 크기 설정 */
	padding-top: 6px; /* 부호를 조금 아래로 내림 */
}

.basketPay-table-bordered td:nth-child(2)::before {
	content: '-';
	left: 0; /* 왼쪽 끝에 위치 */
	width: 51px; /* 동그라미 크기 */
	height: 52px; /* 동그라미 크기 */
}

.basketPay-table-bordered td:nth-child(2)::after {
	content: '=';
	right: 0; /* 오른쪽 끝에 위치 */
	color: red;
	border: 1px solid red; /* 동그라미 테두리 */
}

.basketPay-table-bordered td:nth-child(2) {
	position: relative; /* 부모 요소를 기준으로 절대 위치 설정 */
	text-align: center; /* 중앙 정렬 */
}

.basketPay-table-bordered td:nth-child(1) {
	text-align: center;
}

.basketPay-table-bordered td:nth-child(1) .basketPay-amount,
	.basketPay-table-bordered td:nth-child(2) .basketPay-amount2,
	.basketPay-table-bordered td:nth-child(3) .basketPay-amount3 {
	font-size: 38px; /* 글자 높이 38px */
	line-height: 82px; /* 글자 폭 82px */
}

.basketPay-table-bordered td:nth-child(1) .basketPay-currency,
	.basketPay-table-bordered td:nth-child(2) .basketPay-currency2,
	.basketPay-table-bordered td:nth-child(3) .basketPay-currency3 {
	font-size: 19px; /* 글자 높이 19px */
	line-height: 31px; /* 글자 폭 31px */
	margin-left: 5px; /* 약간의 간격을 추가 */
	font-weight: bold;
}

.basketPay-summary {
	margin-top: 20px;
	text-align: right;
}

.basketPay-summary .basketPay-total-price {
	font-size: 1.5em;
	font-weight: bold;
	color: red;
}

.basketPay-cart-contents {
	height: 132px;
}

.basketPay-table {
	width: 100%;
	border-collapse: collapse;
}

.basketPay-table-bordered {
	width: 100%;
	border: none;
	margin-top: 50px;
}

.basketPay-table-bordered th {
	border: none;
	width: 294px;
	height: 54px;
	text-align: center;
	background: #f3f3f3;
	outline: none;
	border-top: 2px solid #ccc;
}

.basketPay-table-bordered td {
	border: none;
	width: 294px;
	height: 121px;
	text-align: center;
	border-bottom: 4px solid #ccc;
}

.basketPay-member-name {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 15px;
	margin-top: 60px;
}

.basketPay-member-detail {
	width: 100%;
	border-top: 2px solid black;
	border-bottom: 1px solid black;
	padding: 20px 0;
}

.basketPay-member-detail ul {
	list-style-type: none;
	padding: 0;
	margin-left: 40px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.basketPay-info-item {
	flex: 1;
	height: 40px;
	display: flex;
	align-items: center;
}

.basketPay-info-item label {
	margin-right: 10px;
	width: 100px; /* Label의 고정 너비 */
	font-weight: bold;
}

#basketPay-member_name {
	width: 150px; /* 이름 필드의 너비 */
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

#basketPay-member_phone {
	width: 270px; /* 휴대전화 번호 필드의 너비 */
	padding: 8px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.basketPay-info-item+.basketPay-info-item {
	margin-left: 20px; /* 리스트 항목 사이의 간격 */
}

.basketPay-notismsg {
	margin-top: 15px;
	color: #aaa;
	margin-left: 10px;
}

.basketPay-payment {
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 15px;
	margin-top: 60px;
}

.basketPay-payment-title {
	height: 110px;
}

.basketPay-payment-select {
	display: flex;
	gap: 50px;
	border-top: 2px solid black;
	border-bottom: 1px solid black;
	height: 110px;
	align-items: center; /* 라디오 버튼과 라벨이 수직으로 중앙 정렬되도록 */
}

.basketPay-payment-select li {
	display: flex;
	align-items: center; /* 라디오 버튼과 라벨을 수직으로 중앙 정렬 */
	margin-left: 20px;
}

.basketPay-payment-btn {
	width: 120px;
	height: 70px;
	border-radius: 6px;
	background-color: white;
	font-size: 15px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	margin-left: 20px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column; /* 내부 콘텐츠를 수직 정렬 */
}

.basketPay-payment-select input[type="radio"] {
	margin-right: 10px; /* 라디오 버튼과 라벨 간의 간격 */
	transform: translateY(-50%); /* 라디오 버튼을 라벨의 중앙으로 이동 */
	position: relative; /* translateY를 사용하려면 상대 위치를 설정 */
	top: 50%; /* 라벨의 중앙으로 이동하기 위해 상단에서 50% 이동 */
}

.basketPay-payment-icon {
	justify-content: flex-end;
}

.basketPay-payment-img {
	justify-content: center;
}

.basketPay-payment-btn-icon {
	gap: 18px;
}

.basketPay-payment-btn-img {
	gap: 5px;
}

.basketPay-agreement-title {
	width: 100%; height : 24px;
	font-size: 24px;
	margin-top: 65px;
	height: 24px;
}

.basketPay-agreement-checkbox {
	display: none; /* 기본 체크박스를 숨깁니다 */
}

.basketPay-agreement-checkbox+label {
	position: relative;
	padding-left: 30px;
	cursor: pointer;
}

.basketPay-agreement-checkbox+label::before {
	content: "";
	position: absolute;
	left: 0;
	top: 50%; /* 수직 중앙 정렬 */ transform : translateY( -50%);
	/* 수직 중앙 정렬 보정 */
	width: 20px;
	height: 20px;
	border: 2px solid #ccc;
	border-radius: 3px;
	background-color: white;
	transform: translateY(-50%);
}

.basketPay-agreement-checkbox:checked+label::before {
	content: "✔"; /* 체크된 상태에서 표시될 내용 */
	font-size: 16px;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #fdd000;
	border: none;
}

.basketPay-agreement-section {
	padding: 20px;
	border: 1px solid #ddd;
	margin-bottom: 20px;
	height: 100%;
	background-color: #f0f0f0;
	margin-top: 15px;
}

.basketPay-agreement-item {
	display: flex;
	flex-direction: column; /* 요소들을 세로로 배치 */
	align-items: flex-start; /* 왼쪽 정렬 */
	margin-bottom: 20px;
	border-bottom: 1px solid #ddd;
}

.basketPay-agreement-checkbox {
	margin-bottom:3px;
}

.basketPay-agreement-description {
	margin-left: 30px; /* 텍스트의 들여쓰기 설정 */
	color: #555;
	font-size: 14px;
}

.basketPay-sub-agreements {
	padding-top: 10px;
	text-align: left;
}


.basketPay-sub-agreements label {
	margin-right: 10px;
	text-align: left;
	display:flex;
}


.basketPay-payment-click{
display: flex;
align-items:center;
justify-content: center;
}
.basketPay-payment-button{
margin-top: 40px;
    width: 420px ;
    height: 62px ;
    background-color: #fdd000 ;
    color: white ;
    border: none ;
    font-size: 1.5em ;
    border-radius: 8px ;
    display: inline-block ;
    text-align: center ;
}
.basketPay-payment-button:hover {
    background-color: #ffc300; /* 호버 시 약간 더 어두운 배경색 */
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container basketPay-container">
		<!-- 진행 단계 표시 -->
		<ul class="basketPay-step-progress">
			<li>STEP 01<br>장바구니
			</li>
			<li class="active">STEP 02<br>결제하기
			</li>
			<li>STEP 03<br>결제완료
			</li>
		</ul>
		<div class="basketPay-cart-title">
			<div class="basketPay-cart-name">구매상품 정보</div>
		</div>
		<div class="basketPay-product-title">
			<span class="basketPay-product-name">상품명</span> <span
				class="basketPay-product-price">판매금액</span> <span
				class="basketPay-product-quantity">수량</span> <span
				class="basketPay-product-total">구매금액</span>
		</div>
		<div class="basketPay-cart-contents">
			<ul class="list-unstyled">
			<c:forEach var="item" items="${basketList}">
				<li class="basketPay-item">
					<div class="basketPay-item-details">
						<img src="${path}/resources/img/store/${item.product.productImage}" alt="상품 이미지">
						<div class="basketPay-item-text">
							<div class="basketPay-item-title">${item.product.productName}</div>
							<div class="basketPay-item-description"></div>
						</div>
					</div>
					<div class="basketPay-item-price"><fmt:formatNumber value="${item.product.productPrice}" pattern="#,###"/>원</div>
					<div class="basketPay-item-quantity">${item.basketCount}개</div>
					<div class="basketPay-item-total"><fmt:formatNumber value="${item.product.productPrice * item.basketCount}" pattern="#,###"/>원</div>
				</li>
				</c:forEach>
			</ul>
		</div>
		<table class="basketPay-table-bordered">
			<thead>
				<tr>
					<th>총 상품 금액</th>
					<th>할인 금액</th>
					<th>총 결제 예정금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><span class="basketPay-amount">0</span><span
						class="basketPay-currency">원</span></td>
					<td><span class="basketPay-amount2">0</span><span
						class="basketPay-currency2">원</span></td>
					<td><span class="basketPay-amount3">0</span><span
						class="basketPay-currency3">원</span></td>
				</tr>
			</tbody>
		</table>
		<div class="basketPay-member-name">주문자 정보 확인</div>
		<div class="basketPay-member-detail">
			<ul>
<li class="basketPay-info-item">
    <label for="basketPay-member_name">이름</label>
    <input type="text" id="basketPay-member_name" value="${memberName}" readonly>
</li>
<li class="basketPay-info-item">
    <label for="basketPay-member_phone">휴대전화 번호</label>
    <input type="text" id="basketPay-member_phone" value="${memberPhone}" readonly>
</li>
			</ul>
		</div>
		<div class="basketPay-notismsg">
			<span> • 구매하신 CGV 기프트콘은 주문자 정보에 입력된 휴대전화 번호로 MMS로 발송됩니다.<br>
				&nbsp; 입력된 휴대전화 번호가 맞는지 꼭 확인하세요.
			</span>

		</div>

<div class="basketPay-agreement">
    <div class="basketPay-agreement-title">
        <input type="checkbox" id="basketPay_agreement" class="basketPay-agreement-checkbox">
        <label for="basketPay_agreement">주문정보/결제 대행 서비스 약관 모두 동의</label>
    </div>
    <div class="basketPay-agreement-section">
        <div class="basketPay-agreement-item">
            <input type="checkbox" id="basketPay_gift_agreement" class="basketPay-agreement-checkbox">
            <label for="basketPay_gift_agreement"><strong><span style="color: red;">[필수 동의]</span> 기프트콘 구매 동의</strong></label>
            <p class="basketPay-agreement-description">
                기프트콘 발송 및 CS처리 등을 위해 수신자로부터 CJ CGV에 수신자의 휴대전화번호를 제공하는 것에 대한 적합한 동의를 받습니다.
            </p>
        </div>
        <div class="basketPay-agreement-item">
            <input type="checkbox" id="basketPay_all_agreement" class="basketPay-agreement-checkbox">
            <label for="basketPay_all_agreement"><strong>결제 대행 서비스 약관 모두 동의</strong></label>
        </div>
        <div class="basketPay-sub-agreements">
            <div style="display: flex; align-items: center;">
                <input type="checkbox" id="sub1" class="basketPay-agreement-checkbox sub-agreement" style="margin-right: 10px;">
                <label for="sub1" style="flex-grow: 1; text-align: left;"><span style="color: red;">[필수 동의]</span> 전자금융거래 이용약관</label>
            </div>
            <textarea id="terms1" readonly style="width: 100%; height: 150px; margin-top: 10px; padding: 10px; overflow-y: scroll; border: 1px solid #ccc;">
                전자금융거래 이용약관 내용
                제1조 (목적)
                이 약관은 CJ올리브네트웍스(주)(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.
                
                제2조 (용어의 정의)
                이 약관에서 정하는 용어의 정의는 다음과 같습니다.
                1. '전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.
                2. '전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.
                3. '이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.
                4. '접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.
                5. '거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.
                6. '오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.

                부칙
                제 1호, 2006.12.26
                본 약관은 2007년 1월 1일부터 시행한다.
            </textarea>
        </div>
             <div style="display: flex; align-items: center; margin-top: 20px;">
                <input type="checkbox" id="sub2" class="basketPay-agreement-checkbox sub-agreement" style="margin-right: 10px;">
                 <label for="sub2" style="flex-grow: 1; text-align: left;"><span style="color: red;">[필수 동의]</span> 개인정보 수집 이용약관</label>
            </div>
            <textarea id="terms2" readonly style="width: 100%; height: 150px; margin-top: 10px; padding: 10px; overflow-y: scroll; border: 1px solid #ccc;">
                개인정보의 수집 및 이용에 대한 동의
                CJ올리브네트웍스㈜(이하 '회사')는 이용자의 개인정보를 중요시하며, 『전자금융거래법』, 『개인정보보호법』, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『전자상거래 등에서의 소비자보호에 관한 법률』, 『특정금융거래정보의 보고 및 이용 등에 관한 법률』 등을 준수하며 관련 법령에 의거한 개인정보처리방침을 정하여 이용자 권익을 보호하고 있습니다.

                1. 개인정보의 수집 및 이용 목적
                회사는 전자금융거래서비스를 제공함에 있어서 취득한 정보를 이용자의 동의를 얻지 않고 제3자에게 제공, 누설하거나 업무상 목적 외에 사용하지 않습니다. 다만, 업무상 이용자 정보를 제3자에게 위탁할 경우 홈페이지(www.cjolivenetworks.co.kr)을 통해 이용자에게 고지합니다.

                2. 수집하는 개인정보 항목
                회사는 전자금융업자로서 고객 확인 및 검증, 결제내역 조회, 고객상담, 서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
                - 신원 확인 및 고객 검증을 위한 수집 정보
                - 고위험 거래 대상으로 분류 시 개인정보 추가 수집 내역
                - 결제내역 조회, 고객상담, 서비스 신청 등을 위한 수집 정보

                3. 개인정보 수집방법
                가맹점 결제서비스 이용을 위한 계약 시 (전자계약 서비스 글로싸인을 통함)

                4. 개인정보의 보유 및 이용기간
                회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 및 지체 없이 해당 정보를 파기합니다. 단, 관계 법령의 규정에 의하여 보존할 필요가 있는 경우 일정한 기간 동안 보관합니다.

                5. 개인정보의 파기절차 및 방법
                회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.
                - 파기절차: 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 데이터베이스(DB)로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라 일정 기간 저장된 후 파기됩니다.
                - 파기방법: 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.
            </textarea>

            <div style="display: flex; align-items: center; margin-top: 20px;">
                <input type="checkbox" id="sub3" class="basketPay-agreement-checkbox sub-agreement" style="margin-right: 10px;">
             <label for="sub3" style="flex-grow: 1; text-align: left;"><span style="color: red;">[필수 동의]</span> 개인정보 제공 및 위탁안내</label>
            </div>
            <textarea id="terms3" readonly style="width: 100%; height: 150px; margin-top: 10px; padding: 10px; overflow-y: scroll; border: 1px solid #ccc;">
                개인정보의 제3자 제공 동의
                1. 개인정보 제3자 제공에 대한 동의
                CJ올리브네트웍스㈜(이하 '회사')는 이용자의 개인정보를 본 개인정보처리방침에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이 동 범위를 초과하여 이용하거나 이용자의 개인 정보를 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
                - 이용자가 사전에 동의한 경우
                - 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우

                2. 제3자 제공 목록
                회사의 서비스 이행을 위하여 개인정보를 제3자에게 제공하고 있는 경우는 다음과 같습니다.
                1) 신용카드 결제
                - 제공받는 자: 국민, 비씨, 롯데, 삼성, NH농협, 현대, KEB하나, 신한
                - 제공 정보: 결제정보 (카드번호, 고객명, 생년월일, 전화번호 등)
                2) 슈가페이(CJ올리브네트웍스의 자체 간편결제 서비스)
                - 제공받는 자: NICE정보통신, ㈜헥토파이낸셜
                - 제공 정보: 카드사명, 결제정보(카드번호, 카드비밀번호 앞2자리 등)
                3) 간편결제
                - 제공받는 자: 카카오페이, 페이코, 스마일페이, 네이버페이 등
                - 제공 정보: 결제정보 (전화번호, 상품명 등)

                3. 개인정보의 보유 및 이용기간
                개인정보는 원칙적으로 수집 및 이용목적이 달성되면 지체 없이 파기합니다. 단, 법령에 특별한 규정이 있을 경우 관련 법령에 따라 보관됩니다.
            </textarea>
        </div>
    </div>
</div>
<div class ="basketPay-payment-click">
<button type="button" class="basketPay-payment-button">결제하기</button>
</div> 








		</div>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>


<script>
function updateTotalAmount() {
    let totalAmount = 0;
    
    // 각 상품의 총 금액을 합산
    document.querySelectorAll('.basketPay-item-total').forEach(function(element) {
        const itemTotal = parseInt(element.innerText.replace(/[^0-9]/g, ''), 10); // 숫자만 추출하여 정수로 변환
        totalAmount += itemTotal;
    });

    // 총 결제 금액을 해당 영역에 표시
    document.querySelector('.basketPay-amount').innerText = totalAmount.toLocaleString();
    document.querySelector('.basketPay-amount3').innerText = totalAmount.toLocaleString();
}

// 페이지 로드 시 총 결제 금액을 업데이트
document.addEventListener("DOMContentLoaded", function() {
    updateTotalAmount();
});
</script>
<script>
function updateTotalAmount() {
    let totalAmount = 0;
    
    // 각 상품의 총 금액을 합산
    document.querySelectorAll('.basketPay-item-total').forEach(function(element) {
        const itemTotal = parseInt(element.innerText.replace(/[^0-9]/g, ''), 10); // 숫자만 추출하여 정수로 변환
        totalAmount += itemTotal;
    });

    // 총 결제 금액을 해당 영역에 표시
    document.querySelector('.basketPay-amount').innerText = totalAmount.toLocaleString();
    document.querySelector('.basketPay-amount3').innerText = totalAmount.toLocaleString();
}
</script>
<Script>
document.addEventListener("DOMContentLoaded", function () {
    const paymentButton = document.querySelector(".basketPay-payment-button");
    const paymentOptions = document.getElementsByName("basketPay_payment");
    const agreementCheckbox = document.getElementById("basketPay_agreement");

    paymentButton.addEventListener("click", function (event) {
        event.preventDefault(); // 기본 동작인 폼 제출을 막음

        let isPaymentOptionSelected = false;

        // 결제 수단 라디오 버튼 중 하나가 선택되었는지 확인
        for (let i = 0; i < paymentOptions.length; i++) {
            if (paymentOptions[i].checked) {
                isPaymentOptionSelected = true;
                break;
            }
        }

        // 결제 수단 또는 약관 동의 체크가 되어 있지 않으면 결제를 막고 경고 메시지 표시
        if (!isPaymentOptionSelected || !agreementCheckbox.checked) {
            alert("결제 수단을 선택하고 모든 약관에 동의해 주세요.");
            return; // 결제 프로세스를 멈춤
        }

        // 결제 팝업 창을 띄우거나 확인 후 실제 결제 실행
        openPopup();
    });

    function openPopup() {
        const popupWidth = 600;
        const popupHeight = 400;
        const left = (window.screen.width / 2) - (popupWidth / 2);
        const top = (window.screen.height / 2) - (popupHeight / 2);

        const popupWindow = window.open('', '결제 약관 확인', `width=${popupWidth},height=${popupHeight},left=${left},top=${top}`);

        popupWindow.document.write(`
            <html>
            <head><title>결제 약관 확인</title></head>
            <body>
                <h1>결제 약관 확인</h1>
                <p>여기에 결제 약관을 표시하세요.</p>
                <button id="confirmButton">결제 진행</button>
            </body>
            <script>
                document.getElementById('confirmButton').addEventListener('click', function() {
                    window.opener.proceedToPayment(); // 부모 창의 결제 함수 호출
                    window.close(); // 팝업 창 닫기
                });
            </html>
        `);
        popupWindow.document.close();
    }
});

function proceedToPayment() {
    const today = new Date();
    const makeMerchantUid = 'IMP' + today.getTime();
    const amount = document.querySelector('.basketPay-amount3').innerText.replace(/[^0-9]/g, '');
    const buyerName = document.getElementById('basketPay-member_name').value;
    const buyerTel = document.getElementById('basketPay-member_phone').value;

    if (parseInt(amount) > 0) {
        IMP.init("imp67745024");  // 가맹점 식별코드 (실제 사용시 변경 필요)
        IMP.request_pay({
            pg: 'html5_inicis.INIpayTest',  // 결제사 선택
            pay_method: 'card',  // 결제 방식
            merchant_uid: makeMerchantUid,  // 결제 고유 번호
            name: "상품 결제",  // 결제 명
            amount: amount,  // 결제 금액
            buyer_name: buyerName,  // 구매자 이름
            buyer_tel: buyerTel  // 구매자 전화번호
        }, function (rsp) {
            if (rsp.success) {
                $.post("/cinema/verifyIamport/" + rsp.imp_uid, function (data) {
                    if (rsp.paid_amount == data) {
                        $.ajax({
                            type: "POST",
                            url: "/cinema/savePaymentData",
                            data: JSON.stringify({
                                imp_uid: rsp.imp_uid,
                                merchant_uid: rsp.merchant_uid,
                                amount: rsp.paid_amount,
                                buyer_name: rsp.buyer_name,
                                buyer_tel: rsp.buyer_tel
                            }),
                            contentType: "application/json",
                            success: function () {
                                alert("결제가 완료되었습니다.");
                                window.location.href = "/cinema/basket/basketEnd"; // 결제 완료 페이지로 이동
                            },
                            error: function () {
                                alert("결제 정보를 저장하는 중에 오류가 발생했습니다.");
                            }
                        });
                    } else {
                        alert("결제 금액이 일치하지 않습니다.");
                    }
                });
            } else {
                alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
            }
        });
    } else {
        alert("결제 금액이 유효하지 않습니다.");
    }
}


	</script>
</body>
</html>