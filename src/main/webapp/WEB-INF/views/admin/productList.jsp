<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
<title>상품 목록</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.table-hover tbody tr:hover {
	background-color: #fdd000;
}

.btn-custom {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000;
}

.btn-custom:hover {
	background-color: #e6c200;
	border-color: #e6c200;
}

.product-thumbnail {
	width: 50px;
	height: auto;
}

.btn-primary.custom:focus, .btn-outline-primary.custom:focus,
	.btn-primary.custom:active, .btn-outline-primary.custom:active {
	outline: none; /* 클릭 시 기본 테두리 없애기 */
	box-shadow: none; /* 클릭 시 그림자 효과 없애기 */
	border-color: #fdd000; /* 클릭 시 테두리 색상 고정 */
}
.pagination {
	display: flex;
	justify-content: center;
}

.pagination a {
	display: flex;
	justify-content: center;
	margin: 0 5px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	text-decoration: none;
	color: #333;
}

.pagination a.active {
	background-color: #fdd000;
	color: white;
	border: 1px solid #fdd000;
}

.pagination a:hover {
	background-color: #e6c200;
}
</style>
</head>
<body>

<div class="container-fluid mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>상품 목록</h2>
    </div>

    <table class="table table-bordered table-hover">
        <thead style="background-color: #fdd000 !important; font-size: 0.8rem;">
            <tr>
                <th scope="col" style="background-color: #fdd000 !important;">#</th>
                <th scope="col" style="background-color: #fdd000 !important;">상품 코드</th>
                <th scope="col" style="background-color: #fdd000 !important;">상품 이름</th>
                <th scope="col" style="background-color: #fdd000 !important;">가격</th>
                <th scope="col" style="background-color: #fdd000 !important;">원산지</th>
                <th scope="col" style="background-color: #fdd000 !important;">이미지</th>
                <th scope="col" style="background-color: #fdd000 !important;">액션</th>
            </tr>
        </thead>
        <tbody>
         <c:forEach var="product" items="${products}" varStatus="status">
    <tr>
        <!-- startNumber를 이용해 페이지 넘버에 따른 연속적인 번호 출력 -->
        <th scope="row">${startNumber + status.index}</th>
                    <td>${product.productCode}</td>
                    <td>${product.productName}</td>
                    <td>${product.productPrice}원</td>
                    <td>${product.productOrigin}</td>
                    <td><c:if test="${not empty product.productImage}">
                            <img src="${pageContext.request.contextPath}/resources/img/store/${product.productImage}"
                                class="product-thumbnail" alt="상품 이미지">
                        </c:if></td>
                    <td> 
                        <a href="${pageContext.request.contextPath}/admin/deleteProduct?id=${product.productNo}"
                            class="btn btn-sm btn-danger"
                            onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    
<%--     <div class="pagination">
    <c:if test="${currentPage > 1}">
        <a href="${pageContext.request.contextPath}/admin/productList?page=${currentPage - 1}">이전</a>
    </c:if>
    <c:forEach var="i" begin="1" end="${totalPages}">
        <a href="${pageContext.request.contextPath}/admin/productList?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
    </c:forEach>
    <c:if test="${currentPage < totalPages}">
        <a href="${pageContext.request.contextPath}/admin/productList?page=${currentPage + 1}">다음</a>
    </c:if>
</div> --%>
    
      <!-- 페이지네이션 -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/admin/adminMain?page=productList&pageNumber=${currentPage - 1}" class="pagination-btn">이전</a>
        </c:if>
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="${pageContext.request.contextPath}/admin/adminMain?page=productList&pageNumber=${i}" class="pagination-btn ${i == currentPage ? 'active' : ''}">${i}</a>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="${pageContext.request.contextPath}/admin/adminMain?page=productList&pageNumber=${currentPage + 1}" class="pagination-btn">다음</a>
        </c:if>
    </div>
</div>  


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>