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
<link href="${path}/resources/css/basket/basketMain.css?v=1.1"
	rel="stylesheet">
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

.basketMain-cart-contents {
	height: 600px; /* 높이를 제한하여 3~5개의 항목만 보이도록 설정 */
	overflow-y: auto; /* 세로 스크롤바 추가 */
	border-bottom: 1.5px solid black;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<div class="container basketMain-container">
		<!-- 진행 단계 표시 -->
		<ul class="basketMain-step-progress">
			<li class="active">STEP 01<br>장바구니
			</li>
			<li>STEP 02<br>결제하기
			</li>
			<li>STEP 03<br>결제완료
			</li>
		</ul>
		<div class="basketMain-cart-title">
			<input type="checkbox" class="cart-checkbox" id="select-all">
			<label for="select-all"></label> <span
				class="basketMain-product-name">상품명</span> <span
				class="basketMain-product-price">판매금액</span> <span
				class="basketMain-product-quantity">수량</span> <span
				class="basketMain-product-total">구매금액</span> <span
				class="basketMain-product-select">선택</span>
		</div>
		<div class="basketMain-cart-contents">
			<ul class="list-unstyled">
				<c:forEach var="item" items="${basketList}">
					<li class="basketMain-item"><input type="checkbox"
						id="checkbox${item.basketNo}" name="checkbox"
						value="${item.basketNo}">
						<div class="basketMain-item-details">
						<img src="${path}/resources/img/store/${item.product.productImage}"
								alt="상품 이미지">
							<div class="basketMain-item-text">
                        <div class="basketMain-item-title">${item.product.productName}</div>
                    </div>
                </div>
                <div class="basketMain-item-price">${item.product.productPrice}원</div>
                <div class="basketMain-item-quantity">
                    <input type="number" value="${item.basketCount}">
                </div>
                <div class="basketMain-item-total">${item.product.productPrice * item.basketCount}원</div>
                <div class="basketMain-item-actions">
                    <button onclick="deleteBasketItem(${item.basketNo})">삭제하기</button>
                </div></li>
				</c:forEach>
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
					<td><span class="basketMain-amount">100,000</span><span
						class="basketMain-currency">원</span></td>
					<td><span class="basketMain-amount2">100,000</span><span
						class="basketMain-currency2">원</span></td>
					<td><span class="basketMain-amount3">100,000</span><span
						class="basketMain-currency3">원</span></td>
				</tr>
			</tbody>
		</table>
		<!-- 주문 요약 및 결제 버튼 -->
		<div class="basketMain-pay">
			<button class="basketMain-btn-pay" onclick="goToPayPage()">결제하기</button>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
        function goToPayPage() {
            window.location.href = '${path}/basket/basketPay';
        }
    </script>
	<script>
    function deleteBasketItem(basketNo) {
        if (confirm("정말로 이 항목을 삭제하시겠습니까?")) {
            window.location.href = '${path}/basket/deleteBasketItem?basketNo=' + basketNo;
        }
    }
</script>




<script>
    // DOM이 로드되었을 때 실행
   document.addEventListener("DOMContentLoaded", function() {
    const selectAllCheckbox = document.getElementById("select-all");
    const itemCheckboxes = document.querySelectorAll(".basketMain-item input[type='checkbox']");
    const deleteSelectedButton = document.querySelector(".basketMain-btn-del-selected");

    // select-all 체크박스 클릭 이벤트 핸들러
    selectAllCheckbox.addEventListener("change", function() {
        const isChecked = selectAllCheckbox.checked;
        itemCheckboxes.forEach(function(checkbox) {
            checkbox.checked = isChecked;
        });
    });

    // 개별 항목의 체크 상태가 변경될 때 전체 선택 체크박스의 상태를 업데이트
    itemCheckboxes.forEach(function(checkbox) {
        checkbox.addEventListener("change", function() {
            if (document.querySelectorAll(".basketMain-item input[type='checkbox']:checked").length === itemCheckboxes.length) {
                selectAllCheckbox.checked = true;
            } else {
                selectAllCheckbox.checked = false;
            }
        });
    });

    // 선택된 항목 삭제 버튼 클릭 이벤트 핸들러
    deleteSelectedButton.addEventListener("click", function() {
        const selectedItems = [];
        itemCheckboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                selectedItems.push(checkbox.value);
            }
        });

        if (selectedItems.length > 0) {
            if (confirm("정말로 선택한 항목을 삭제하시겠습니까?")) {
                // 선택된 항목들을 서버로 전송하여 삭제 처리
                window.location.href = `${path}/basket/deleteSelectedBasketItems?basketNos=` + selectedItems.join(',');
            }
        } else {
            alert("삭제할 항목을 선택해주세요.");
        }
    });
});
</script>

</body>
</html>



