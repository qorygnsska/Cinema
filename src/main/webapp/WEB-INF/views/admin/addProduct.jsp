<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
    .btn.custom {
        background-color: #fdd000 !important;
        color: white !important;
        border-color: #fdd000 !important;
    }

    .btn.custom:hover {
        background-color: #e6c200 !important;
        color: white !important;
        border-color: #fdd000 !important;
    }

    .btn.custom:focus, .btn.custom:active {
        outline: none !important; /* 클릭 시 기본 테두리 없애기 */
        box-shadow: none !important; /* 클릭 시 그림자 효과 없애기 */
        border-color: #fdd000 !important; /* 클릭 시 테두리 색상 고정 */
        background-color: #e6c200 !important; /* 클릭 시 배경색 고정 */
        color: white !important; /* 클릭 시 글씨 색상 고정 */
    }

    .btn.custom.selected {
        background-color: #fdd000 !important;
        color: white !important;
        border-color: #fdd000 !important;
    }

    .btn.custom.selected:hover {
        background-color: #e6c200 !important; /* 호버 시 배경색 */
        color: white !important; /* 호버 시 글씨 색상 */
        border-color: #fdd000 !important; /* 호버 시 테두리 색상 */
    }
        /* 에러 메시지를 기본적으로 숨기기 */
    .alert-danger {
        display: none;
    }

    /* 에러 메시지가 있을 때 표시 */
    .alert-danger.visible {
        display: block;
    }
    
</style>
<body>
<div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center">
        <h2>상품 추가</h2>
        <a href="${pageContext.request.contextPath}/admin/adminMain?page=productList" class="btn btn custom">상품 리스트</a>
    </div>
   
     <form action="${pageContext.request.contextPath}/admin/addProduct" method="post" enctype="multipart/form-data">
     
        <div class="form-group">
            <label for="productCode">상품 코드</label>
            <select class="form-control" id="productCode" name="productCode" required>
                <option value="P1">001 - 팝콘</option>
                <option value="P2">002 - 음료</option>
                <option value="P3">003 - 스낵</option>
            </select>
        </div>
                <div class="form-group">
            <label for="productName">상품 이름</label>
            <input type="text" class="form-control" id="productName" name="productName" placeholder="상품 이름을 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="productPrice">상품 가격</label>
            <input type="number" class="form-control" id="productPrice" name="productPrice" placeholder="상품 가격을 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="productOrigin">상품 원산지</label>
            <input type="text" class="form-control" id="productOrigin" name="productOrigin" placeholder="원산지를 입력하세요" required>
        </div>
     <div class="form-group">
    <label for="productImage">이미지 파일</label>
    <input type="file" class="form-control" id="productImage" name="productImageFile" required>
</div>
                <div class="form-group">
            <label for="productContent">상품 내용</label>
            <input type="text" class="form-control" id="productContent" name="productContent" placeholder="상품 내용을 입력하세요" required>
        </div>

        
        <div class="d-flex justify-content-end">
    <button type="submit" class="btn btn custom">상품 추가</button>
</div>
    </form>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        var errorMessage = "${errorMessage}";
        if (errorMessage) {
            alert(errorMessage); // 에러 메시지를 경고창으로 띄움
        }
    });
</script>

</body>
</html>
