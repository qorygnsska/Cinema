document.addEventListener("DOMContentLoaded", function() {
    // ------------ 증감 버튼 ---------------
    const minusButton = document.querySelector(".storeDetail--count--min");
    const plusButton = document.querySelector(".storeDetail--count--plus");
    const resultElement = document.querySelector(".storeDetail--count--result");
    const totalCostElement = document.querySelector(".storeDetail--total--cost");
    const addCartButton = document.querySelector(".storeDetail--AddCart--send");
    const modalElement = new bootstrap.Modal(document.getElementById('exampleModal')); // Bootstrap 모달 제어 객체 생성
    
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
        }
        // 로그인이 되어 있는 경우 모달을 수동으로 띄웁니다.
        else {
            modalElement.show();
        }
    });



});
