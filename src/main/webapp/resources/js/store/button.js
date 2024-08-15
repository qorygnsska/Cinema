document.addEventListener("DOMContentLoaded", function() {
    // ------------ 증감 버튼 ---------------
    const minusButton = document.querySelector(".storeDetail--count--min");
    const plusButton = document.querySelector(".storeDetail--count--plus");
    const resultElement = document.querySelector(".storeDetail--count--result");
    const totalCostElement = document.querySelector(".storeDetail--total--cost");

    // 장바구니 버튼
    const addCartButton = document.querySelector(".storeDetail--AddCart--send");
    const modalElement = new bootstrap.Modal(document.getElementById('exampleModal')); // Bootstrap 모달 제어 객체 생성
    
    const confirmButton = document.getElementById("confirmAddToBasket");
    const basketForm = document.getElementById("basketForm");
    const countElement = document.querySelector(".storeDetail--count--result");
    const basketCountInput = document.getElementById("basketCount");
    
    // productPrice는 JSP에서 전달받은 값이므로 전역 스코프에서 접근 가능
    let count = parseInt(resultElement.textContent);

    function updateTotalCost() {
        const totalCost = count * productPrice;
        totalCostElement.textContent = new Intl.NumberFormat().format(totalCost) + "원";
    }

    minusButton.addEventListener("click", function(event) {
        event.preventDefault();
        if (count > 1) {
            count--;
            resultElement.textContent = count;
            updateTotalCost();
        }
    });

    plusButton.addEventListener("click", function(event) {
        event.preventDefault();
        count++;
        resultElement.textContent = count;
        updateTotalCost();
    });

    updateTotalCost();

    // 장바구니 버튼 클릭
    addCartButton.addEventListener("click", function(e) {
        e.preventDefault();
        if (!id || id.trim() === '') {
            alert("로그인이 필요한 서비스입니다. 로그인 후 이용해 주세요.");
            return;
        } else {
            modalElement.show();
        }
    });

    // 장바구니 확인 버튼 클릭 시 (한 번만 이벤트 리스너 등록)
    confirmButton.addEventListener("click", function(event) {
        event.preventDefault();
        // 현재 수량으로 숨겨진 입력 값 업데이트
        basketCountInput.value = countElement.textContent;
        // 서버로 폼 제출
        basketForm.submit();
    });

    


});
