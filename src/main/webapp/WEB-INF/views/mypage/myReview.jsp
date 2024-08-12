<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

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
        <div class="myReview--main">
        	<div class="myReview--category">
                <div class="myReview--myMovie">
                    <a href="myMovie">
                        <p>영화 예매 내역</p>
                    </a>
                </div>

                <div class="myReview--myProduct">
                    <a href="myProduct">
                        <p>상품 구매 내역</p>
                    </a>
                </div>

                <div class="myReview--myStamp">
                    <a href="myStamp">
                        <p>스탬프 / 쿠폰</p>
                    </a>
                </div>

                <div class="myReview--myReview">
                    <a href="myReview">
                        <p>내가 쓴 리뷰</p>
                    </a>
                </div>

                <div class="myReview--myEdit">
                    <a href="myConfirm">
                        <p>회원정보 수정</p>
                    </a>
                </div>
            </div>
            
            <div style="border: 1px solid rgb(219, 219, 219); margin-left: 50px; height: 250px;"></div>
            
            <div class="myReview--content">
                <div class="myReview--title">
                    <h2>내가 쓴 리뷰</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>

                <div class="myReview--reviewbox">
                    <ul class="myReview--reviewul">
                        <li>
                            <div class="myReview--revieli">
                                <div class="myReview--movieinfo">
                                    <img src="${path}/resources/img/mypageimg/아바타.jpg" alt="" class="myReview--reviewimg">
                                    <div class="myReview--movietitle">
                                        <p>하이재킹</p>
                                    </div>
                                </div>
                                <div class="myReview--reviewinfo">
                                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-top: 20px;"></div>
                                    <p id="myReview--star">★★★★★</p>
                                    <div class="myReview--review">
                                        <p>진짜 재미있네요~~ㅁㄴㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㄴㅁㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</p>
                                        <i class="fa-solid fa-x" id="reviewDeletelBtn"></i>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <p id="reviewdate">24/01/05</p>
                        <div style="border: 1px solid rgba(158, 158, 158, 0.664); margin-bottom: 60px;""></div>

                        <li>
                            <div class="myReview--revieli">
                                <div class="myReview--movieinfo">
                                    <img src="${path}/resources/img/mypageimg/아바타.jpg" alt="" class="myReview--reviewimg">
                                    <div class="myReview--movietitle">
                                        <p>하이재킹</p>
                                    </div>
                                </div>
                                <div class="myReview--reviewinfo">
                                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-top: 20px;"></div>
                                    <p id="myReview--star">★</p>
                                    <div class="myReview--review">
                                        <p>하 노잼인데요</p>
                                        <i class="fa-solid fa-x" id="reviewDeletelBtn"></i>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <p id="reviewdate">24/01/05</p>
                        <div style="border: 1px solid rgba(158, 158, 158, 0.664); margin-bottom: 60px;""></div>

                        <li>
                            <div class="myReview--revieli">
                                <div class="myReview--movieinfo">
                                    <img src="${path}/resources/img/mypageimg/아바타.jpg" alt="" class="myReview--reviewimg">
                                    <div class="myReview--movietitle">
                                        <p>하이재킹</p>
                                    </div>
                                </div>
                                <div class="myReview--reviewinfo">
                                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-top: 20px;"></div>
                                    <p id="myReview--star">★★★</p>
                                    <div class="myReview--review">
                                        <p>걍 그럭저럭 낫 배드 인듯 ㅋㅋ.. 돈이 조금 아깝나??</p>
                                        <i class="fa-solid fa-x" id="reviewDeletelBtn"></i>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <p id="reviewdate">24/01/05</p>
                        <div style="border: 1px solid rgba(158, 158, 158, 0.664); margin-bottom: 60px;""></div>

                    </ul>
                </div>
            </div>
        </div>
	</div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>