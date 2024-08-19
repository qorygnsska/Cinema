<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section class="myMovie--section">
    <div class="container" id="myConfirm--container">
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
        <div class="myConfirm--main">
            <div class="myConfirm--category">
                <div class="myConfirm--myMovie">
                    <a href="myMovie">
                        <p>영화 예매 내역</p>
                    </a>
                </div>

                <div class="myConfirm--myProduct">
                    <a href="myProduct">
                        <p>상품 구매 내역</p>
                    </a>
                </div>

                <div class="myConfirm--myStamp">
                    <a href="myStamp">
                        <p>스탬프 / 쿠폰</p>
                    </a>
                </div>
                
                <div class="myConfirm--myReview">
                    <a href="myReview">
                        <p>내가 쓴 리뷰</p>
                    </a>
                </div>

                <div class="myConfirm--myEdit">
                    <a href="myConfirm">
                        <p>회원정보 수정</p>
                    </a>
                </div>
            </div>

            <div style="border: 1px solid rgb(219, 219, 219); margin-left: 50px; height: 200px;"></div>

            <div class="myConfirm--content">
                <div class="myConfirm--title">
                    <h2>비밀번호 입력</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>

                <div class="myConfirm--confirmbox">
                    <form action="myEdit" method="POST">
                    	<label for="password">비밀번호 입력</label>
                        <input type="password" name="password" id="password" style="margin-left: 20px" required><br><br>
                        
                        <input type="submit" value="확인">
                    </form>
                </div>
            </div>

        </div>
    </div>
    
    
	<script type="text/javascript">
	    var errorMessage = "${errorMessage}";
	 
	    if (errorMessage) {
	        alert(errorMessage);
	    }
	</script>
	
	<script type="text/javascript">
	    var editMessage = "${editMessage}";
	 
	    if (editMessage) {
	        alert(editMessage);
	    }
	</script>
	
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