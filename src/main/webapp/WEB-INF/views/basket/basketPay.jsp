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
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
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
	margin: 230px auto 0 auto; /* 위쪽에 200px 여백을 주고, 좌우는 중앙에 배치 */
	padding: 0 20px; /* 좌우 여백 추가 (반응형을 위해) */
}

.basketPay-step-progress {
	display: flex;
	justify-content: space-between;
	list-style-type: none;
	padding: 20px 0;
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

.basketPay-cart-name {
	width: 100%;
	height: 50px;
	padding: 12px 0px 8px;
	font-size: 18px;
	border-bottom: 3px solid black;
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
	border-bottom: 1px solid black;
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
	height: 350px;
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
	margin-left: 30px;
	padding-top: 10px;
}

.basketPay-sub-agreements div {
	display: flex;
	align-items: center;
	margin-bottom: 5px;
}

.basketPay-sub-agreements label {
	margin-right: 10px;
}

.basketPay-sub-agreements a {
	margin-left:10px;
	color: #007bff;
	text-decoration: none;
}
.basketPay-sub-agreements div:nth-of-type(1) a{
    margin-left: 32px; /* 원하는 마진 값으로 설정 */
}
.basketPay-sub-agreements div:nth-of-type(2) a {
    margin-left: 28px; /* 원하는 마진 값으로 설정 */
}

.basketPay-sub-agreements a:hover {
	text-decoration: underline;
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
				<li class="basketPay-item">
					<div class="basketPay-item-details">
						<img src="${path}/resources/img/store/달콤팝콘(L).jpg" alt="상품 이미지">
						<div class="basketPay-item-text">
							<div class="basketPay-item-title">달콤팝콘(L)</div>
							<div class="basketPay-item-description"></div>
						</div>
					</div>
					<div class="basketPay-item-price">14,000원</div>
					<div class="basketPay-item-quantity">2개</div>
					<div class="basketPay-item-total">14,000원</div>
				</li>
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
					<td><span class="basketPay-amount">14,000</span><span
						class="basketPay-currency">원</span></td>
					<td><span class="basketPay-amount2">0</span><span
						class="basketPay-currency2">원</span></td>
					<td><span class="basketPay-amount3">14,000</span><span
						class="basketPay-currency3">원</span></td>
				</tr>
			</tbody>
		</table>
		<div class="basketPay-member-name">주문자 정보 확인</div>
		<div class="basketPay-member-detail">
			<ul>
				<li class="basketPay-info-item"><label
					for="basketPay-member_name">이름</label> <input type="text"
					id="basketPay-member_name" value="홍길동" readonly></li>
				<li class="basketPay-info-item"><label
					for="basketPay-member_phone">휴대전화 번호</label> <input type="text"
					id="basketPay-member_phone" value="010-2222-****" readonly>
				</li>
			</ul>
		</div>
		<div class="basketPay-notismsg">
			<span> • 구매하신 CGV 기프트콘은 주문자 정보에 입력된 휴대전화 번호로 MMS로 발송됩니다.<br>
				&nbsp; 입력된 휴대전화 번호가 맞는지 꼭 확인하세요.
			</span>

		</div>

		<div class="basketPay-payment">결제 수단</div>
		<div class="basketPay-payment-title">
			<ul class="basketPay-payment-select">
				<li><input type="radio" id="basketPay_payment_card"
					name="basketPay_payment" value="card" discountRate="${card}">
					<label for="basketPay_payment_card" class="basketPay-payment-btn">
						<div class="basketPay-payment-btn-icon basketPay-payment-icon">
							<i class="fa-regular fa-credit-card fa-2xl"
								style="color: #000000;"></i> <span>신용카드</span>
						</div>
				</label></li>
				<li><input type="radio" id="basketPay_payment_kakao"
					name="basketPay_payment" value="kakao" discountRate="${kakao}">
					<label for="basketPay_payment_kakao" class="basketPay-payment-btn">
						<div class="basketPay-payment-btn-img basketPay-payment-img">
							<img alt="카카오 아이콘"
								src="${path}/resources/img/ticket/kakao_icon.png">
						</div>
				</label></li>
			</ul>
		</div>
		<div class="basketPay-agreement">
			<div class="basketPay-agreement-title">
				<input type="checkbox" id="basketPay_agreement"
					class="basketPay-agreement-checkbox"> <label
					for="basketPay_agreement">주문정보/결제 대행 서비스 약관 모두 동의</label>
			</div>
<div class="basketPay-agreement-section">
    <div class="basketPay-agreement-item">
        <input type="checkbox" id="basketPay_agreement" class="basketPay-agreement-checkbox">
        <label for="basketPay_agreement"><strong>기프트콘 구매 동의</strong></label>
        <p class="basketPay-agreement-description">
            기프트콘 발송 및 CS처리 등을 위해 수신자로부터 CJ CGV에 수신자의 휴대전화번호를 제공하는 것에 대한 적합한 동의를 받습니다.
        </p>
    </div>

    <div class="basketPay-agreement-item">
        <input type="checkbox" id="basketPay_all_agreement" class="basketPay-agreement-checkbox">
        <label for="basketPay_all_agreement"><strong>결제 대행 서비스 약관 모두 동의</strong></label>
    </div>

    <div class="basketPay-sub-agreements">
        <div>
            <input type="checkbox" class="basketPay-agreement-checkbox sub-agreement">
            <label for="sub1">전자금융거래 이용약관</label>
            <a href="#" onclick="openPopup()">전문확인</a>
        </div>
        <div>
            <input type="checkbox" class="basketPay-agreement-checkbox sub-agreement">
            <label for="sub2">개인정보 수집 이용약관</label>
            <a href="#">전문확인</a>
        </div>
        <div>
            <input type="checkbox" class="basketPay-agreement-checkbox sub-agreement">
            <label for="sub3">개인정보 제공 및 위탁안내</label>
            <a href="#">전문확인</a>
        </div>
    </div>
</div>


</div>
		</div>


	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
		
<script>
function openPopup() {
    const popupContent = `
        <html>
        <head>
            <title>전자금융거래 이용약관</title>
            <style>
                body {
                    font-family: Arial, sans-serif;
                    line-height: 1.6;
                    padding: 20px;
                }
                h1, h2, h3 {
                    font-weight: bold;
                }
                p {
                    margin-bottom: 10px;
                }
            </style>
        </head>
        <body>
            <h1>전자금융거래 기본약관</h1>

            <h2>제1조 (목적)</h2>
            <p>이 약관은 CJ올리브네트웍스(주)(이하 '회사'라 합니다)가 제공하는 전자지급결제대행서비스를 이용자가 이용함에 있어 회사와 이용자 사이의 전자금융거래에 관한 기본적인 사항을 정함을 목적으로 합니다.</p>

            <h2>제2조 (용어의 정의)</h2>
            <p>이 약관에서 정하는 용어의 정의는 다음과 같습니다.</p>
            <ol>
                <li>'전자금융거래'라 함은 회사가 전자적 장치를 통하여 전자지급결제대행서비스 및 결제대금예치서비스(이하 '전자금융거래 서비스'라고 합니다)를 제공하고, 이용자가 회사의 종사자와 직접 대면하거나 의사소통을 하지 아니하고 자동화된 방식으로 이를 이용하는 거래를 말합니다.</li>
                <li>'전자지급결제대행서비스'라 함은 전자적 방법으로 재화의 구입 또는 용역의 이용에 있어서 지급결제정보를 송신하거나 수신하는 것 또는 그 대가의 정산을 대행하거나 매개하는 서비스를 말합니다.</li>
                <li>'이용자'라 함은 이 약관에 동의하고 회사가 제공하는 전자금융거래 서비스를 이용하는 자를 말합니다.</li>
                <li>'접근매체'라 함은 전자금융거래에 있어서 거래지시를 하거나 이용자 및 거래내용의 진실성과 정확성을 확보하기 위하여 사용되는 수단 또는 정보로서 전자식 카드 및 이에 준하는 전자적 정보(신용카드번호를 포함한다), '전자서명법'상의 인증서, 회사에 등록된 이용자번호, 이용자의 생체정보, 이상의 수단이나 정보를 사용하는데 필요한 비밀번호 등 전자금융거래법 제2조 제10호에서 정하고 있는 것을 말합니다.</li>
                <li>'거래지시'라 함은 이용자가 본 약관에 의하여 체결되는 전자금융거래계약에 따라 회사에 대하여 전자금융거래의 처리를 지시하는 것을 말합니다.</li>
                <li>'오류'라 함은 이용자의 고의 또는 과실 없이 전자금융거래가 전자금융거래계약 또는 이용자의 거래지시에 따라 이행되지 아니한 경우를 말합니다.</li>
            </ol>

            <h2>부칙</h2>
            <p><strong>제 1호, 2006.12.26</strong></p>
            <p>본 약관은 2007년 1월 1일부터 시행한다.</p>
        </body>
        </html>
    `;
    
    const popupWindow = window.open("", "popupWindow", "width=600,height=600,scrollbars=yes");
    popupWindow.document.write(popupContent);
    popupWindow.document.close();
}
</script>
</body>
</html>