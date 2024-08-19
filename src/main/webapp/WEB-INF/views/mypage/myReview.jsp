<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section class="myMovie--section">
	<div class="container" id="myReview--container">
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
                <c:choose>
                	<c:when test="${pagereview.size() == 0}">
						<h3 style="margin-top: 50px;">작성한 리뷰가 존재하지 않습니다..</h3>
					</c:when>
					<c:otherwise>
						<div class="myReview--reviewbox">
		                    <ul class="myReview--reviewul">
		                    	<c:forEach var="item" items="${pagereview}" varStatus="status">
			                        <li>
			                            <div class="myReview--revieli">
			                                <div class="myReview--movieinfo">
			                                    <a href="${path}/movieDetail?movieNo=${item.movieNo}"><img src="resources/img/movie/poster/${item.movieMainImage}" alt="" class="myReview--reviewimg"></a>
			                                    <div class="myReview--movietitle">
			                                        <a href="${path}/movieDetail?movieNo=${item.movieNo}"><p>${item.movieTitle}</p></a>
			                                    </div>
			                                </div>
			                                <div class="myReview--reviewinfo">
			                                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-top: 20px; margin-bottom: 7px"></div>
			                                    <div class="myReview--score">
			                                        <p id="myReview--star">
			                                        	<c:forEach var="i" begin="0" end="${item.reviewStarRating - 1}">
           													★
			                                        	</c:forEach>
			                                        	<c:forEach var="i" begin="1" end="${5 - item.reviewStarRating}">
           													☆
			                                        	</c:forEach>
			                                        </p>
			                                        <i class="fa-regular fa-thumbs-up" id="myReview--like"></i>
			                                        <span class="myReview--count">${item.reviewLikeCount}</span>
			                                    </div>
			                                    <div class="myReview--review">
			                                        <p>${item.reviewContent}</p>
			                                        <i class="fa-solid fa-x" id="reviewDeletelBtn" onclick="return confirm('리뷰를 삭제하시겠습니까?') ? location.href='deleteReview?no=${item.reviewNo}' : false;"></i>
			                                    </div>
			                                </div>
			                            </div>
			                        </li>
			                        <p id="reviewdate"><fmt:formatDate value="${item.reviewWriteDate}" pattern="yyyy.MM.dd" /></p>
			                        <div style="border: 1px solid rgba(158, 158, 158, 0.664); margin-bottom: 60px;"></div>
		                    	</c:forEach>
		                    </ul>
		                </div>
		                
		                <div class="myMovie--page">
					        <nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:if test="${currentPage > 1}">
										<li class="page-item">
											<a class="page-link" id="mypaging" href="${path}/myReview?page=${currentPage - 1}">&laquo;</a>
										</li>
									</c:if>
									<c:forEach var="i" begin="1" end="${totalPages}">
										<li>
											<a href="${path}/myReview?page=${i}" class="page-link ${i == currentPage ? 'active' : ''}" id="mypaging">${i}</a>
										</li>
									</c:forEach>
									<c:if test="${currentPage < totalPages}">
										<li class="page-item">
											<a class="page-link" id="mypaging" href="${path}/myReview?page=${currentPage + 1}">&raquo;</a>
										</li>
									</c:if>
								</ul>
							</nav>
				        </div>
				        
					</c:otherwise>
                </c:choose>

                
		        
            </div>
            
        </div>
        
	</div>
	
	<script type="text/javascript">
	    var delreviewMessage = "${delreviewMessage}";
	 
	    if (delreviewMessage) {
	        alert(delreviewMessage);
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