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
.btn-primary.custom {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000
}

.btn-primary.custom:hover {
	background-color: #e6c200;

</style>
<body>
<div class="container mt-5">
    <h2>제품 추가</h2>
     <form action="${pageContext.request.contextPath}/admin/addProduct" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="productName">제품 이름</label>
            <input type="text" class="form-control" id="productName" name="productName" placeholder="제품 이름을 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="productPrice">제품 가격</label>
            <input type="number" class="form-control" id="productPrice" name="productPrice" placeholder="제품 가격을 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="productOrigin">제품 원산지</label>
            <input type="text" class="form-control" id="productOrigin" name="productOrigin" placeholder="원산지를 입력하세요" required>
        </div>
        <div class="form-group">
            <label for="productImage">이미지 파일</label>
            <input type="file" class="form-control" id="productImage" name="productImage" required>
        </div>
        
        <button type="submit" class="btn btn-primary custom">제품 추가</button>
    </form>
</div>
</body>
</html>
