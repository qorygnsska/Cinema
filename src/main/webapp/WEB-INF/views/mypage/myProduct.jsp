<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!--  내가 가지고 있는 파일 포함하기  -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<link rel ="stylesheet" href="${path}/resources/css/mypage/myProduct.css" type="text/css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section>
    <div class="container fixed-width2">
        <div class="infoBox">
            <div class="memberInfo">
                <div style="display: flex;">
                    <div>
                        <img src="${path}/resources/img/mypageimg/열동그라미.png" alt="" class="profileimg">
                    </div>
                    <div class="memberInfo2">
                        <h2>배교훈님의 마이페이지</h2>
                        <p>qorygnsska</p>
                    </div>
                </div>
                <div style="border: 1px solid rgba(228, 228, 228, 0.664); height: 50%;"></div>
                <div class="stmapcount">
                    <a href="myStamp">
                        <h3 style="color: rgb(129, 129, 129);">스탬프</h3>
                        <h2>5 / 9</h2>
                    </a>
                </div>
                <div style="border: 1px solid rgba(228, 228, 228, 0.664); height: 50%;"></div>
                <div class="couponcount">
                    <a href="myStamp">
                        <h3 style="color: rgb(129, 129, 129);">쿠폰</h3>
                        <h2>5개</h2>
                    </a>
                </div>
            </div>
        </div>
        <div class="main">
            <div class="category">
                <div class="myMovie">
                    <a href="myMovie">
                        <p>영화 예매 내역</p>
                    </a>
                </div>

                <div class="myProduct">
                    <a href="myProduct">
                        <p>상품 구매 내역</p>
                    </a>
                </div>

                <div class="myStamp">
                    <a href="myStamp">
                        <p>스탬프 / 쿠폰</p>
                    </a>
                </div>

                <div class="myEdit">
                    <a href="myEdit">
                        <p>회원정보 수정</p>
                    </a>
                </div>
            </div>

            <div style="border: 1px solid rgb(219, 219, 219); margin-left: 50px; height: 200px;"></div>

            <div class="content">
                <div class="title">
                    <h2>상품 결제 내역</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>
                
                <div class="accordion" id="accordionFlushExample">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>상품사진</th>
                                <th>구매일</th>
                                <th>주문번호</th>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>결제금액</th>
                                <th>상세보기</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><img src="${path}/resources/img/mypageimg/스토어1.jpg" alt="" class="storeimg"></td>
                                <td>24/07/20</td>
                                <td>1</td>
                                <td>우리 패키지</td>
                                <td>1개</td>
                                <td>62,000원</td>
                                <td>
                                    <div class="accordion-text" data-bs-toggle="collapse" data-bs-target="#flush-collapse1" aria-expanded="false" aria-controls="flush-collapse1">
                                        상세보기
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="7">
                                    <div id="flush-collapse1" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">
                                            구매일 : 24/07/20<br>
                                            주문번호 : 1<br>
                                            상품명 : 우리 패키지<br>
                                            수량 : 1개<br>
                                            결제수단 : 신용카드<br>
                                            결제금액 : 62,000원<br>    
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <td><img src="${path}/resources/img/mypageimg/스토어2.jpg" alt="" class="storeimg"></td>
                                <td>24/07/23</td>
                                <td>2</td>
                                <td>나랑 너 패키지</td>
                                <td>2개</td>
                                <td>70,000원</td>
                                <td>
                                    <div class="accordion-text" data-bs-toggle="collapse" data-bs-target="#flush-collapse2" aria-expanded="false" aria-controls="flush-collapse2">
                                        상세보기
                                    </div>
                                </td>
                            </tr>
                            <tr class="acotr">
                                <td colspan="7">
                                    <div id="flush-collapse2" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">
                                            구매일 : 24/07/23<br>
                                            주문번호 : 2<br>
                                            상품명 : 나랑 너 패키지<br>
                                            수량 : 2개개<br>
                                            결제수단 : 신용카드<br>
                                            결제금액 : 70,000원<br>   
                                        </div>
                                    </div>
                                </td>
                            </tr>

                            <tr>
                                <td><img src="${path}/resources/img/mypageimg/스토어3.jpg" alt="" class="storeimg"></td>
                                <td>24/07/29</td>
                                <td>3</td>
                                <td>좋은 날 패키지</td>
                                <td>3개</td>
                                <td>54,000원</td>
                                <td>
                                    <div class="accordion-text" data-bs-toggle="collapse" data-bs-target="#flush-collapse3" aria-expanded="false" aria-controls="flush-collapse3">
                                        상세보기
                                    </div>
                                </td>
                            </tr>
                            <tr class="acotr">
                                <td colspan="7">
                                    <div id="flush-collapse3" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                        <div class="accordion-body">
                                            구매일 : 24/07/29<br>
                                            주문번호 : 3<br>
                                            상품명 : 좋은 날 패키지<br>
                                            수량 : 3개<br>
                                            결제수단 : 신용카드<br>
                                            결제금액 : 54,000원<br>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                


            </div>

        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>