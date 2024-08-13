<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>장바구니</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .step-progress {
            display: flex;
            justify-content: space-between;
            list-style-type: none;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .step-progress li {
            flex: 1;
            text-align: center;
            color: #999;
        }

        .step-progress li.active {
            font-weight: bold;
            color: #fdd000;
        }

        .cart-items {
            margin: 20px 0;
        }

        .cart-items table {
            width: 100%;
            border-collapse: collapse;
        }

        .cart-items th, .cart-items td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

    </style>
</head>
<body>

<header class="bg-light py-3">
    <div class="container">
        <!-- 헤더 내용 (로고, 검색창, 로그인 버튼 등) -->
    </div>
</header>

<div class="container">
    <!-- 진행 단계 표시 -->
    <ul class="step-progress">
        <li class="active">STEP 01<br>장바구니</li>
        <li>STEP 02<br>주문 정보 입력</li>
        <li>STEP 03<br>결제</li>
        <li>STEP 04<br>완료</li>
    </ul>

    <!-- 장바구니 항목 리스트 -->
    <div class="cart-items">
        <table>
            <thead>
                <tr>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>합계</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>상품 1</td>
                    <td>10,000원</td>
                    <td><input type="number" value="1" class="form-control" style="width: 60px; margin: 0 auto;"></td>
                    <td>10,000원</td>
                </tr>
                <tr>
                    <td>상품 2</td>
                    <td>20,000원</td>
                    <td><input type="number" value="2" class="form-control" style="width: 60px; margin: 0 auto;"></td>
                    <td>40,000원</td>
                </tr>
            </tbody>
        </table>
    </div>

    <!-- 주문 요약 및 결제 버튼 -->
    <div class="summary">
        <p>총 상품 금액: 50,000원</p>
        <p class="total-price">총 결제 금액: 50,000원</p>
        <button class="btn btn-primary">결제하기</button>
    </div>
</div>

<footer class="footer">
    <!-- 푸터 내용 (고객센터, 이용 약관 등) -->
    <p>고객센터 | 이용 약관 | 개인정보 처리 방침</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


