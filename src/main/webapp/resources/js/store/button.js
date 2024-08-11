document.addEventListener("DOMContentLoaded", function() {
    // ------------ 증감 버튼 ---------------
    const minusButton = document.querySelector(".storeDetail--count--min");
    const plusButton = document.querySelector(".storeDetail--count--plus");
    const resultElement = document.querySelector(".storeDetail--count--result");
    const totalCostElement = document.querySelector(".storeDetail--total--cost");
    
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



    // ------------- 장바구니 버튼 ---------------
    $('.storeDetail--AddCart > a')
});
