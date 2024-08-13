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
<style>
.basketMain {
	width: 1220px !important;
	margin-top: 200px;
	height:660px;
	margin-left: 390px !important;
}

.step-progress {
	display: flex;
	justify-content: space-between;
	list-style-type: none;
	padding: 20px 0;
	border-bottom: 2px solid black;
}

.step-progress li {
font-weight: bold;
	flex: 1;
	text-align: left;
	color: #ddd;
	position: relative; /* ::before 및 ::after를 위한 상대 위치 설정 */
	padding-left: 50px; /* 아이콘 공간 확보 */
	margin-left:115px;
}

.step-progress li::before {
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

.step-progress li.active::before {
	background-image: url('${path}/resources/img/basket/basket128px.png'); /* 장바구니 아이콘 */
}

.step-progress li:nth-child(2)::before {
	background-image: url('${path}/resources/img/basket/wallet128.png'); /* 결제하기 아이콘 */
}

.step-progress li:nth-child(3)::before {
	background-image: url('${path}/resources/img/basket/member128.png'); /* 결제완료 아이콘 */
}

.step-progress li.active {
	font-weight: bold;
	color: #fdd000;
	margin-left:115spx;
}

.step-progress li::after {
	content: '>';
	position: absolute;
	right: -15px; /* 기호를 텍스트에 더 가깝게 조정 */
	top: 50%;
	transform: translateY(-50%);
	color: #ddd;
	font-size: 2.5em;
}

.step-progress li:last-child::after {
	content: ''; /* 마지막 항목에서는 > 기호를 표시하지 않음 */
}


.summary {
	margin-top: 20px;
	text-align: right;
}

.summary .total-price {
	font-size: 1.5em;
	font-weight: bold;
	color: red;
}

.cart-contents{
height:132px;
border-bottom: 1.5px solid black;

}
.table{
width: 100%;
 border-collapse: collapse;}
.table-bordered {
width:100%;
border: none;}
.table-bordered th{
border: none;
width:294px;
height:54px;
text-align:center;
background:#f3f3f3;
outline:none;
border-top: 2px solid #ccc;]

}
.table-bordered td{
    border: none;
width:294px;
height:121px;
text-align:center;
border-bottom: 4px solid #ccc;
}
.pay{
width:100%;
height:121px;
  display: flex;
    justify-content: center; 
    align-items: center; 

}

.btn-pay {
margin-top:40px;
    width: 420px !important;
    height: 62px !important;
    background-color: #fdd000 !important; /* 배경색 설정 */
    color: white !important;
    border: none !important; /* 기본 버튼 테두리 제거 */
    font-size: 1.5em !important;/* 텍스트 크기 설정 (선택 사항) */
    border-radius: 8px !important; /* 버튼 모서리를 둥글게 (선택 사항) */
    display: inline-block !important; /* 버튼 크기 설정 유지 */
    text-align: center !important;/* 텍스트 중앙 정렬 */

}
.btn-pay:hover {
    background-color: #e6c000 !important; /* 호버 시 약간 어두운 배경색 */
}


.cart-title {
    align-items: center;
    padding: 10px 0;
    border-bottom: 2px solid #ccc;
height:52px;
background:#fafafa;

}

.cart-title label::before {
    width:24px!important;
    height:24px!important;
    margin-top:10px!important;
}

.cart-title input[type="checkbox"] {
    margin-right: 10px;
        width:24px!important;
    height:24px!important;
}

.cart-title span {
    flex: 1;
    margin-left:20px;
    text-align: center;
     height: 24px; /* 모든 span의 높이를 24px로 설정 */
         line-height: 24px; /* 텍스트가 중앙에 오도록 line-height 설정 */
    display: inline-block; /* inline-block으로 설정하여 너비 적용 */
}

.cart-title .product-name {
    width: 360px !important; /* 상품명의 너비 설정 */
    text-align: left; /* 텍스트를 왼쪽 정렬 */
}
.cart-title .product-price {
    width: 115px; /* 판매금액의 너비 설정 */
}
.cart-title .product-quantity{
width: 165px !important;
}
.cart-title .product-total{
width: 108px !important;
}
.cart-title .product-select{
width: 127px !important;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container basketMain">
		<!-- 진행 단계 표시 -->
		<ul class="step-progress">
			<li class="active">STEP 01<br>장바구니
			</li>
			<li>STEP 02<br>결제하기
			</li>
			<li>STEP 03<br>결제완료
			</li>
		</ul>
		<div class="cart-title">
   <input type="checkbox" class="cart-checkbox" id="select-all">
    <label for="select-all"></label>
   <span class="product-name">상품명</span>
    <span class="product-price">판매금액</span>
    <span class="product-quantity">수량</span>
    <span class="product-total">구매금액</span>
    <span class="product-select">선택</span>
		</div>
		<div class="cart-contents"></div>
		<table class="table-bordered">
			<thead>
				<tr>
					<th>총 상품 금액</th>
					<th>할인 금액</th>
					<th>총 결제 예정금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>100,000원</td>
					<td>10,000원</td>
					<td>90,000원</td>
				</tr>
			</tbody>
		</table>


		<!-- 주문 요약 및 결제 버튼 -->
		<div class="pay">
			<button class="btn btn-pay">결제하기</button>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



