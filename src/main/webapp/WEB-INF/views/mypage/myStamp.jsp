<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section class="myMovie--section">
    <div class="container" id="myStamp--container">
        <div class="myMovie--infoBox">
            <div class="myMovie--memberInfo">
                <div style="display: flex; margin-top: 7px">
                    <div>
                        <img src="${path}/resources/img/profile/${member.memberImg}" alt="" class="myMovie--profileimg" id="profileImage">
                        <form action="profileupload" method="post" enctype="multipart/form-data" id="profileform">
                        	<input type="file" id="fileInput" name="file" style="display: none;" accept="image/*">
                        </form>
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
        <div class="myStamp--main">
            <div class="myStamp--category">
                <div class="myStamp--myMovie">
                    <a href="myMovie">
                        <p>영화 예매 내역</p>
                    </a>
                </div>

                <div class="myStamp--myProduct">
                    <a href="myProduct">
                        <p>상품 구매 내역</p>
                    </a>
                </div>

                <div class="myStamp--myStamp">
                    <a href="myStamp">
                        <p>스탬프 / 쿠폰</p>
                    </a>
                </div>
                
                <div class="myStamp--myReview">
                    <a href="myReview">
                        <p>내가 쓴 리뷰</p>
                    </a>
                </div>

                <div class="myStamp--myEdit">
                    <a href="myConfirm">
                        <p>회원정보 수정</p>
                    </a>
                </div>
            </div>

            <div style="border: 1px solid rgb(219, 219, 219); margin-left: 50px; height: 200px;"></div>

            <div class="myStamp--content">
                <div class="myStamp--title">
                    <h2>스탬프</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>
                <div class="myStamp--stampinfo">
                    <table class="myStamp--table">
                    	<!-- 스탬프 반복문 -->
                        <c:forEach var="row" begin="0" end="2">
				            <tr>
				                <c:forEach var="col" begin="0" end="2">
				                    <td>
				                        <c:choose>
				                            <c:when test="${row * 3 + col < member.memberStamp}">
				                                <img src="${path}/resources/img/mypageimg/후스탬프.png" alt="Stamp Image" class="myStamp--stampimg">
				                            </c:when>
				                            <c:otherwise>
				                            	<img src="${path}/resources/img/mypageimg/전스탬프.png" alt="Stamp Image" class="myStamp--stampimg">
				                            </c:otherwise>
				                        </c:choose>
				                    </td>
				                </c:forEach>
				            </tr>
				        </c:forEach>
                    </table>
                </div>

                <div class="myStamp--title2">
                    <h2>쿠폰</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>
                <div class="myStamp--couponinfo">
                	<c:choose>
                		<c:when test="${member.memberCoupon == 0}">
                			<h3 style="margin-top: 50px;">보유하신 쿠폰이 없습니다..</h3>
                			<h3 style="margin-top: 15px;">영화를 보고 스탬프를 찍어 쿠폰을 모아보세요!</h3>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="row" begin="0" end="${member.memberCoupon / 3}">
		                		<div class="row">
		                			<c:forEach var="col" begin="0" end="2">
		                				<div class="col" id="myStamp--col">
		                					<c:choose>
		                						<c:when test="${row * 3 + col < member.memberCoupon}">
							                    	<div class="myStamp--coupon">
						                                <h3>영화관람권</h3>
						                                <p>스탬프 이벤트 완료</p>
						                                <button type="button" class="myStamp--couponbtn" onclick="window.location.href='ticket'">예매하기</button>
						                            </div>
						                        </c:when>
						                        <c:otherwise />
						                    </c:choose>
		                				</div>
		                			</c:forEach>
		                		</div>
		                	</c:forEach>
                		</c:otherwise>
                	</c:choose>
                	
               
                </div>

            </div>

        </div>
    </div>
    
    <script>
        // 이미지 요소와 파일 입력 요소 가져오기
        const profileImage = document.getElementById('profileImage');
        const fileInput = document.getElementById('fileInput');
        const form = document.getElementById('profileform');

        // 이미지 클릭 시 파일 입력 요소 클릭
        profileImage.addEventListener('click', () => {
            fileInput.click();
        });
        
        fileInput.addEventListener('change', () => {
            if (fileInput.files.length > 0) {
                form.submit(); // 파일이 선택되면 자동으로 폼 제출
            }
        });
    </script>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<script src="${path}/resources/js/mypage/myStamp.js"></script>