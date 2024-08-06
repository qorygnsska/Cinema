<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!--  내가 가지고 있는 파일 포함하기  -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section class="myMovie--section">
    <div class="container" id="myMovie--container">
        <div class="myMovie--infoBox">
            <div class="myMovie--memberInfo">
                <div style="display: flex;">
                    <div>
                        <img src="${path}/resources/img/mypageimg/열동그라미.png" alt="" class="myMovie--profileimg">
                    </div>
                    <div class="myMovie--memberInfo2">
                        <h2>${member.memberName}님의 마이페이지</h2>
                        <p>${member.memberId}</p>
                    </div>
                </div>
                <div style="border: 1px solid rgba(228, 228, 228, 0.664); height: 50%;"></div>
                <div class="myMovie--stmapcount">
                    <a href="myStamp">
                        <h3 style="color: rgb(129, 129, 129);">스탬프</h3>
                        <h2>${member.memberStamp} / 9</h2>
                    </a>
                </div>
                <div style="border: 1px solid rgba(228, 228, 228, 0.664); height: 50%;"></div>
                <div class="myMovie--couponcount">
                    <a href="myStamp">
                        <h3 style="color: rgb(129, 129, 129);">쿠폰</h3>
                        <h2>${member.memberCoupon}개</h2>
                    </a>
                </div>
            </div>
        </div>
        <div class="myProduct--main">
            <div class="myProduct--category">
                <div class="myProduct--myMovie">
                    <a href="myMovie">
                        <p>영화 예매 내역</p>
                    </a>
                </div>

                <div class="myProduct--myProduct">
                    <a href="myProduct">
                        <p>상품 구매 내역</p>
                    </a>
                </div>

                <div class="myProduct--myStamp">
                    <a href="myStamp">
                        <p>스탬프 / 쿠폰</p>
                    </a>
                </div>

                <div class="myProduct--myEdit">
                    <a href="myConfirm">
                        <p>회원정보 수정</p>
                    </a>
                </div>
            </div>

            <div style="border: 1px solid rgb(219, 219, 219); margin-left: 50px; height: 200px;"></div>

            <div class="myProduct--content">
                <div class="myProduct--title">
                    <h2>상품 결제 내역</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>
                
                <div class="accordion" id="accordionFlushExample">
                    <table class="table" id="protable">
                        <thead>
                            <tr>
                                <th>상품사진</th>
                                <th>주문번호</th>
                                <th>구매일</th>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>결제금액</th>
                                <th>펼쳐보기</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach var="item" items="${propayment}" varStatus="status">
                        		<tr>
	                                <td><img src="${path}/resources/img/mypageimg/스토어1.jpg" alt="" class="myProduct--storeimg"></td>
	                                <td>${item.productNo}</td>
	                                <td><fmt:formatDate value="${item.paymentDate}" pattern="yy/MM/dd" /></td>
	                                <td>${item.productName}</td>
	                                <td>${item.basketCount}개</td>
	                                <td><fmt:formatNumber value="${item.paymentPrice}" type="number" groupingUsed="true"/>원</td>
	                                <td>
	                                    <div class="accordion-text" id="proacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse${status.index}" aria-expanded="false" aria-controls="flush-collapse${status.index}">
	                                        펼쳐보기
	                                    </div>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td colspan="7">
	                                    <div id="flush-collapse${status.index}" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
	                                        <div class="accordion-body" id="proacobody">
	                                            주문번호 : ${item.productNo}<br>
	                                            구매일 : <fmt:formatDate value="${item.paymentDate}" pattern="yy/MM/dd HH:mm" /><br>
	                                            상품명 : ${item.productName}<br>
	                                            수량 : ${item.basketCount}개<br>
	                                            결제수단 : ${item.paymentType}(${item.cardCompanyName})<br>
	                                            결제금액 : <fmt:formatNumber value="${item.paymentPrice}" type="number" groupingUsed="true"/>원<br>    
	                                        </div>
	                                    </div>
	                                </td>
	                            </tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>