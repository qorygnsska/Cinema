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

<style>
.basketPay-container {
    width: 1200px !important; /* header--navbar와 동일한 width로 설정 */
    margin: 230px auto 0 auto; /* 중앙 정렬을 위해 auto로 설정 */
    min-height: 100vh; /* 컨테이너가 화면 전체 높이를 차지하게 설정 */
    clear: both;
 	height: 100% !important;
 padding: 10px !important; /* 패딩을 제거하여 전체 너비를 사용할 수 있도록 함 */
    box-sizing: border-box; /* 패딩과 보더를 width에 포함시킴 */
}
body, html {
    margin: 0; /* 페이지 전체의 기본 마진을 제거 */
    padding: 0; /* 페이지 전체의 기본 패딩을 제거 */
    width: 100%; /* 페이지 전체의 너비를 100%로 설정 */
    height: 100%; /* 페이지 전체의 높이를 100%로 설정 */
}
.basketPay-step-progress {
    display: flex;
    justify-content: space-between;
    list-style-type: none;
    clear: both; /* float 문제가 있을 때 컨테이너 높이를 자동으로 맞춤 */
    width:100%;
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
    border-bottom: 1.5px solid black;
}

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



.basketPay-payment {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 15px;
    margin-top: 60px;
}

.basketPay-payment-title {
    height: 110px;
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
			<li id="step01">STEP 01<br>장바구니</li>
			<li class="active">STEP 02<br>결제하기</li>
			<li>STEP 03<br>결제완료</li>
		</ul>
		<div class="basketPay-cart-title">
			<div class="basketPay-cart-name">구매상품 정보</div>
		</div>
		<div class="basketPay-product-title">
			<span class="basketPay-product-name">상품명</span>
			<span class="basketPay-product-price">판매금액</span>
			<span class="basketPay-product-quantity">수량</span>
			<span class="basketPay-product-total">구매금액</span>
		</div>
		<div class="basketPay-cart-contents">
			<ul class="list-unstyled">
				<c:if test="${not empty basketList}">
					<c:forEach var="item" items="${basketList}">
						<li class="basketMain-item" data-basket-no="${item.basketNo}">
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
				</c:if>
				<c:if test="${empty basketList}">
					<li class="basketPay-item">선택된 상품이 없습니다.</li>
				</c:if>
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
					<td><span class="basketPay-amount">0</span><span class="basketPay-currency">원</span></td>
					<td><span class="basketPay-amount2">0</span><span class="basketPay-currency2">원</span></td>
					<td><span class="basketPay-amount3">0</span><span class="basketPay-currency3">원</span></td>
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

		<div class="basketPay-payment-click">
			<button type="button" class="basketPay-payment-button" onclick="proceedToPayment()">결제하기</button>
			<input type="hidden" id="paymentDate" name="paymentDate" value="">
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

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
		function proceedToPayment() {
			const today = new Date();
			const makeMerchantUid = 'IMP' + today.getTime();
			const amount = $('.basketPay-amount').text();
			const buyerName = document.getElementById('basketPay-member_name').value;
			const buyerTel = document.getElementById('basketPay-member_phone').value;
			console.log(amount);
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
						// 장바구니 번호 리스트 생성
						const basketNo = Array.from(document.querySelectorAll('.basketMain-item')).map(item => {
							return parseInt(item.getAttribute('data-basket-no'), 10);
						});
						
						// 결제 검증
			        	$.ajax({
				        	type : "POST",
				        	url : "/cinema/verifyIamport/" + rsp.imp_uid 
				        }).done(function(data) {
				        	
				        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
				        	if(rsp.paid_amount == data.response.amount){		
				        		
				        		$('#paymentDate').val(today.getTime());
				        		
				        		$.ajax({
								    type: "POST",
								    url: "/cinema/basket/savePaymentData",  // 여기서 basket 경로 추가
								    data: JSON.stringify({
								        imp_uid: rsp.imp_uid,
								        merchant_uid: rsp.merchant_uid,
								        amount: amount,
								        basketNo: basketNo,
								        cardName: data.response.cardName,
								        paymentDate: $('#paymentDate').val()
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
				        		alert(`결제에 실패하였습니다.`);
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
<Script>
document.getElementById("step01").addEventListener("click", function() {
    var targetUrl = "basketMain";
    if (document.referrer) { // 사용자가 이전 페이지에서 온 경우
        window.location.href = targetUrl; // 지정된 URL로 이동
    } else {
        window.history.back(); // 이전 페이지로 이동
    }
});
</Script>
</body>
</html>