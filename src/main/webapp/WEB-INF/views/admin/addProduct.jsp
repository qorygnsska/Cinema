<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<style>
.form-control:focus {
	border-color: #fdd000;
	box-shadow: 0 0 0 0.2rem rgba(253, 208, 0, 0.25);
}

.btn.custom {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000
}
.btn-outline.custom{
	background-color: white;
	color: #fdd000;
	border-color: #fdd000
}
.btn-outline.custom:hover{
background-color: #e6c200;
color:white;
border-color: #fdd000
}

.btn-primary.custom:hover {
	background-color: #e6c200;}
.btn.custom.selected,
.btn-outline.custom.selected {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000;
}
.btn.custom.selected:hover,
.btn-outline.custom.selected:hover {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000;
}
.btn.custom:focus,
.btn-outline.custom:focus,
.btn.custom:active,
.btn-outline.custom:active {
	outline: none; /* 클릭 시 기본 테두리 없애기 */
	box-shadow: none; /* 클릭 시 그림자 효과 없애기 */
	border-color: #fdd000; /* 클릭 시 테두리 색상 고정 */
		border-color: #fdd000; /* 클릭 시 테두리 색상 고정 */
	background-color: #cc9f00; /* 클릭 시 어둡게 */
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
                <option value="001">001 - 팝콘</option>
                <option value="002">002 - 음료</option>
                <option value="003">003 - 스낵</option>
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
</body>
</html>
