<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${path}/resources/css/basket/basketEnd.css">
<style>
.basketEnd-step-progress li:nth-child(1)::before {
	background-image: url('${path}/resources/img/basket/basket128.png');
}

.basketEnd-step-progress li.active::before {
	background-image: url('${path}/resources/img/basket/wallet128y.png');
}

.basketEnd-step-progress li:nth-child(3)::before {
	background-image: url('${path}/resources/img/basket/member128.png');
}
  .changePage2 {
	display: flex;
	gap:30px;
	margin-top: 40px;
	text-align: center;
	justify-content: center;
}

.home--btn2{
	border: 3px solid #ddd;
	width: 150px;
	height: 50px;
	font-size: 22px;
	border-radius: 6px;
	text-align: center;
    padding: 3px;
    margin-right: 40px;
}

.ticketCheck--btn2{
	background-color: #ffffff;
	width: 150px;
	height: 50px;
	font-size: 22px;
	background-color: #fdd000;
	border-radius: 6px;
	text-align: center;
    padding: 4px;
}
</style>
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp"%>
    <div class="container basketEnd-container">
        <!-- 진행 단계 표시 -->
        <ul class="basketEnd-step-progress">
            <li>STEP 01<br>장바구니
            </li>
            <li>STEP 02<br>결제하기
            </li>
            <li class="active">STEP 03<br>결제완료
            </li>
        </ul>
    <div class="basketEnd-cart-name">
    <h2>상품 결제가 성공하였습니다.</h2>
    </div>


<div class="changePage2">
<a class="home--btn2" href="${path}/">홈으로</a>
<a class="ticketCheck--btn2" href="${path}/myProduct">구매 내역</a>

</div>




    
        
        
        
        
        
        
  </div>      
        <%@ include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>