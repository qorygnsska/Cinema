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

.basketMain-count-min{
	width: 28px;
	height: 28px;
	font-size: 25px;
	border: 1px solid #bdc1c8;
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight:lighter;
	color: #666666;

}
.basketMain-count-plus {
	width: 28px;
	height: 28px;
	font-size: 25px;
	border: 1px solid #bdc1c8;
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight:lighter;
	color: #666666;
}

.basketMain-count-result {
width: 43px;
	height: 28px;
	font-size : 18px;
	color: #000;
	display: flex;
	justify-content: center;
	align-items: center;
	border-top: 1px solid #bdc1c8;
	border-bottom: 1px solid #bdc1c8;
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
            <label for="select-all"></label> 
            <span class="basketMain-product-name">상품명</span> 
            <span class="basketMain-product-price">판매금액</span> 
            <span class="basketMain-product-quantity">수량</span> 
            <span class="basketMain-product-total">구매금액</span> 
            <span class="basketMain-product-select">선택</span>
        </div>
        <div class="basketMain-cart-contents">
            <ul class="list-unstyled">
                <c:forEach var="item" items="${basketList}">
                    <li class="basketMain-item" data-product-price="${item.product.productPrice}">
                        <input type="checkbox" id="checkbox${item.basketNo}" name="checkbox" value="${item.basketNo}">
                        <div class="basketMain-item-details">
                            <img src="${path}/resources/img/store/${item.product.productImage}" alt="상품 이미지">
                            <div class="basketMain-item-text">
                                <div class="basketMain-item-title">${item.product.productName}</div>
                            </div>
                        </div>
                        <div class="basketMain-item-price">
                            <fmt:formatNumber value="${item.product.productPrice}" pattern="#,###"/>원
                        </div>
                        <div class="basketMain-item-quantity">
                            <a href="#" class="basketMain-count-min">-</a>
                            <span class="basketMain-count-result">${item.basketCount}</span>
                            <a href="#" class="basketMain-count-plus">+</a>
                        </div>
                        <div class="basketMain-item-total">
                            <span class="basketMain-total-cost">${item.product.productPrice * item.basketCount}</span>
                        </div>
                        <input type="hidden" class="basketMain-final-quantity" name="basketQuantities[${item.basketNo}]" value="${item.basketCount}">
                        <div class="basketMain-item-actions">
                            <form action="${path}/basket/deleteBasketItem" method="post" onsubmit="return confirm('정말로 이 항목을 삭제하시겠습니까?');">
                                <input type="hidden" name="basketNo" value="${item.basketNo}">
                                <button type="submit">삭제하기</button>
                            </form>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="basketMain-note">
            <form id="deleteSelectedForm" action="${path}/basket/deleteSelectedBasketItems" method="post">
                <input type="hidden" name="basketNos" id="selectedBasketNos">
                <button type="button" class="basketMain-btn-del-selected" onclick="submitDeleteForm()">선택상품 삭제</button>
            </form>
       
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
                    <td><span class="basketMain-amount">0</span><span class="basketMain-currency">원</span></td>
                    <td><span class="basketMain-amount2">0</span><span class="basketMain-currency2">원</span></td>
                    <td><span class="basketMain-amount3">0</span><span class="basketMain-currency3">원</span></td>
                </tr>
            </tbody>
        </table>
        <!-- 주문 요약 및 결제 버튼 -->
        <div class="basketMain-pay">
            <button type="button" class="basketMain-btn-pay">결제하기</button>
        </div>
    </div>




	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
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
document.addEventListener("DOMContentLoaded", function() {
    const selectAllCheckbox = document.getElementById("select-all");
    const itemCheckboxes = document.querySelectorAll(".list-unstyled .basketMain-item input[type='checkbox']");

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
            if (document.querySelectorAll(".list-unstyled .basketMain-item input[type='checkbox']:checked").length === itemCheckboxes.length) {
                selectAllCheckbox.checked = true;
            } else {
                selectAllCheckbox.checked = false;
            }
        });
    });
});

    

    // 선택된 항목 삭제 버튼 클릭 이벤트 핸들러
function submitDeleteForm() {
    const selectedItems = [];
    const itemCheckboxes = document.querySelectorAll(".basketMain-item input[type='checkbox']");
    itemCheckboxes.forEach(function(checkbox) {
        if (checkbox.checked) {
            selectedItems.push(checkbox.value);
        }
    });

    if (selectedItems.length > 0) {
        if (confirm("정말로 선택한 항목을 삭제하시겠습니까?")) {
            document.getElementById("selectedBasketNos").value = selectedItems.join(',');
            document.getElementById("deleteSelectedForm").submit();
        }
    } else {
        alert("삭제할 항목을 선택해주세요.");
    }
}
</script>

<script>
    // 선택된 항목 삭제 버튼 클릭 이벤트 핸들러
    function submitDeleteForm() {
        const selectedItems = [];
        const itemCheckboxes = document.querySelectorAll(".basketMain-item input[type='checkbox']");
        itemCheckboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                selectedItems.push(checkbox.value);
            }
        });

        if (selectedItems.length > 0) {
            if (confirm("정말로 선택한 항목을 삭제하시겠습니까?")) {
                document.getElementById("selectedBasketNos").value = selectedItems.join(',');
                document.getElementById("deleteSelectedForm").submit();
            }
        } else {
            alert("삭제할 항목을 선택해주세요.");
        }
    }
</script>


<script> 
document.addEventListener("DOMContentLoaded", function() {
    const items = document.querySelectorAll('.basketMain-item');
    const totalAmountElement = document.querySelector('.basketMain-amount');
    const totalPaymentElement = document.querySelector('.basketMain-amount3');
    const selectAllCheckbox = document.getElementById("select-all");

    // 페이지 로드 시 모든 체크박스를 기본적으로 체크된 상태로 설정
    items.forEach(function(item) {
        const checkbox = item.querySelector("input[type='checkbox']");
        checkbox.checked = true; // 모든 체크박스를 체크 상태로 설정
    });

    // 전체 선택 체크박스를 체크된 상태로 설정
    selectAllCheckbox.checked = true;

    function updateTotalAmounts() {
        let totalAmount = 0;

        items.forEach(function(item) {
            const checkbox = item.querySelector("input[type='checkbox']");
            if (checkbox.checked) { // 체크박스가 체크된 항목만 계산
                const price = parseInt(item.dataset.productPrice, 10);
                const count = parseInt(item.querySelector('.basketMain-count-result').textContent.trim(), 10);
                const itemTotalCostElement = item.querySelector('.basketMain-total-cost');
                
                if (!isNaN(price) && !isNaN(count)) {
                    const itemTotalCost = price * count;
                    itemTotalCostElement.textContent = new Intl.NumberFormat().format(itemTotalCost) + '원';

                    totalAmount += itemTotalCost;
                } else {
                    console.error("Invalid number detected:", {price, count});
                }
            }
        });

        if (!isNaN(totalAmount)) {
            totalAmountElement.textContent = new Intl.NumberFormat().format(totalAmount);
            totalPaymentElement.textContent = new Intl.NumberFormat().format(totalAmount);
        } else {
            totalAmountElement.textContent = '0';
            totalPaymentElement.textContent = '0';
        }
    }

    // 체크박스 상태가 변경될 때 총 금액 업데이트
    items.forEach(function(item) {
        const checkbox = item.querySelector("input[type='checkbox']");
        checkbox.addEventListener("change", updateTotalAmounts);

        // 수량 변경 버튼 클릭 이벤트 추가
        const minusButton = item.querySelector(".basketMain-count-min");
        const plusButton = item.querySelector(".basketMain-count-plus");
        const resultElement = item.querySelector(".basketMain-count-result");

        minusButton.addEventListener("click", function(event) {
            event.preventDefault();
            let count = parseInt(resultElement.textContent.trim(), 10);
            if (count > 1) {
                count--;
                resultElement.textContent = count;
                updateTotalAmounts(); // 수량이 변경될 때 총 금액 업데이트
            }
        });

        plusButton.addEventListener("click", function(event) {
            event.preventDefault();
            let count = parseInt(resultElement.textContent.trim(), 10);
            count++;
            resultElement.textContent = count;
            updateTotalAmounts(); // 수량이 변경될 때 총 금액 업데이트
        });
    });

    // '전체 선택' 체크박스 상태 변경 시 모든 항목 체크박스의 상태를 변경하고, 총 금액 업데이트
    selectAllCheckbox.addEventListener("change", function() {
        const isChecked = selectAllCheckbox.checked;
        items.forEach(function(item) {
            const checkbox = item.querySelector("input[type='checkbox']");
            checkbox.checked = isChecked;
        });
        updateTotalAmounts(); // 전체 선택이 변경될 때 총 금액을 업데이트
    });

    // 초기 총 금액 설정
    updateTotalAmounts();
});

</script>
<script>
// 결제하기 버튼 클릭 시
document.addEventListener("DOMContentLoaded", function() {
    document.querySelector(".basketMain-btn-pay").addEventListener("click", function(event) {
        event.preventDefault(); // 기본 동작 방지

        const items = document.querySelectorAll('.basketMain-item');
        const selectedItems = [];

        // 체크된 항목만 필터링
        items.forEach(function(item) {
            const checkbox = item.querySelector("input[type='checkbox']");
            if (checkbox.checked) {
                const basketNo = item.querySelector('.basketMain-final-quantity').name.match(/\d+/)[0];
                const quantity = parseInt(item.querySelector('.basketMain-count-result').textContent.trim(), 10);

                selectedItems.push({ basketNo, quantity });
            }
        });

        if (selectedItems.length > 0) {
            // AJAX를 사용하여 서버에 수량 데이터를 전송
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "/cinema/basket/updateSelectedQuantities", true);  // 새로운 URL로 요청 전송
            xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    // 서버에서 성공적으로 처리되면 결제 페이지로 이동
                    window.location.href = "/cinema/basket/basketPay";
                }
            };

            xhr.send(JSON.stringify(selectedItems));
        } else {
            alert("결제할 상품을 선택해주세요.");
        }
    });
});
</script>