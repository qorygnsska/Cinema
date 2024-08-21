<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>

<section class="myMovie--section">
    <div class="container" id="myMovie--container">
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
        <div class="myMovie--main">
            <div class="myMovie--category">
                <div class="myMovie--myMovie">
                    <a href="myMovie">
                        <p>영화 예매 내역</p>
                    </a>
                </div>

                <div class="myMovie--myProduct">
                    <a href="myProduct">
                        <p>상품 구매 내역</p>
                    </a>
                </div>

                <div class="myMovie--myStamp">
                    <a href="myStamp">
                        <p>스탬프 / 쿠폰</p>
                    </a>
                </div>
                
                <div class="myMovie--myReview">
                    <a href="myReview">
                        <p>내가 쓴 리뷰</p>
                    </a>
                </div>

                <div class="myMovie--myEdit">
                    <a href="myConfirm">
                        <p>회원정보 수정</p>
                    </a>
                </div>
            </div>

            <div style="border: 1px solid rgb(219, 219, 219); margin-left: 50px; height: 200px;"></div>

            <div class="myMovie--content">
                <div class="myMovie--title">
                    <h2>영화 예매 내역</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>
				
				<c:choose>
					<c:when test="${moviepayment.size() == 0}">
						<h3 style="margin-top: 50px;">영화 예매 내역이 존재하지 않습니다..</h3>
					</c:when>
					<c:otherwise>
		                <div class="accordion" id="accordionFlushExample">
		                    <ul class="myMovie--movieul">
		                    	<c:forEach var="item" items="${pagemoviepayment}" varStatus="status">
		                    		<li class="myMovie--movieli">
			                            <div class="accordion-item" id="movacoitem">
			                                <div>
			                                    <a href="${path}/movieDetail?movieNo=${item.movieNo}"><img src="resources/img/movie/poster/${item.movieImage}" alt="" class="myMovie--postimg"></a>
			                                </div>
			
			                                <div class="myMovie--movieinfo">
			                                    <h3><a href="${path}/movieDetail?movieNo=${item.movieNo}"><span>${item.movieTitle}</span></a></h3>
			                                    <p>
			                                    	<input type="hidden" class="mymovie--start" value="<fmt:formatDate value="${item.theaterStartTime}" pattern="yyyy.MM.dd HH:mm" />">
			                                        <fmt:formatDate value="${item.cinemaScreenDate}" pattern="yyyy.MM.dd (E)"/> <fmt:formatDate value="${item.theaterStartTime}" pattern="HH:mm" /> ~ <fmt:formatDate value="${item.theaterEndTime}" pattern="HH:mm" /><br>
			                                        ${item.cinemaRlg} ${item.cinemaBlg} ${item.theaterName} / ${item.ticketTeen + item.ticketAdult + item.ticketSenior}명
			                                    </p>
			
			                                    <a onclick="openreview(${status.index})"
			                                    	data-movieNo="${item.movieNo}" 
           											data-memberId="${member.memberId}" 
           											data-ticketNo="${item.ticketNo}" 
           										id="reviewgo">리뷰 작성하기</a>
			                                </div>
											
											<div class="myMovie--cancelbox">
	                                    		<a href="cancelticket?tno=${item.ticketNo}&pno=${item.paymentNo}&tc=${item.ticketCoupon}&seat=${item.ticketSeat}&tt=${item.ticketTeen}&ta=${item.ticketAdult}&ts=${item.ticketSenior}&theater=${item.theaterNO}&uid=${item.paymentImpUid}" class="myMovie--cancel" id="myMovie--cancel${status.index}" onclick="return confirm('예매를 취소하시겠습니까?');">
	                                    			예매취소
	                                    		</a>
				                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse${status.index}" aria-expanded="false" aria-controls="flush-collapse${status.index}">
					                            	펼쳐보기
					                            </div>
				                            </div>
			
			                            </div>
			
			                            <div id="flush-collapse${status.index}" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
			                                <div class="accordion-body">
			                                    영화제목 : ${item.movieTitle}<br>
			                                    상영날짜 : <fmt:formatDate value="${item.cinemaScreenDate}" pattern="yyyy.MM.dd (E)" /> <fmt:formatDate value="${item.theaterStartTime}" pattern="HH:mm" /> ~ <fmt:formatDate value="${item.theaterEndTime}" pattern="HH:mm" /><br>
			                                    인원 : ${item.ticketTeen + item.ticketAdult + item.ticketSenior}명
			                                    <c:choose>
			                                    	<c:when test="${item.ticketAdult > 0 and item.ticketTeen > 0 and item.ticketSenior > 0}">
			                                    		(일반 ${item.ticketAdult}, 청소년 ${item.ticketTeen}, 우대 ${item.ticketSenior})<br>
			                                    	</c:when>
			                                    	<c:when test="${item.ticketAdult > 0 and item.ticketTeen > 0 and item.ticketSenior == 0}">
			                                    		(일반 ${item.ticketAdult}, 청소년 ${item.ticketTeen})<br>
			                                    	</c:when>
			                                    	<c:when test="${item.ticketAdult > 0 and item.ticketTeen == 0 and item.ticketSenior > 0}">
			                                    		(일반 ${item.ticketAdult}, 우대 ${item.ticketSenior})<br>
			                                    	</c:when>
			                                    	<c:when test="${item.ticketAdult > 0 and item.ticketTeen == 0 and item.ticketSenior == 0}">
			                                    		(일반 ${item.ticketAdult})<br>
			                                    	</c:when>
			                                    	<c:when test="${item.ticketAdult == 0 and item.ticketTeen > 0 and item.ticketSenior > 0}">
			                                    		(청소년 ${item.ticketTeen}, 우대 ${item.ticketSenior})<br>
			                                    	</c:when>
			                                    	<c:when test="${item.ticketAdult == 0 and item.ticketTeen > 0 and item.ticketSenior == 0}">
			                                    		(청소년 ${item.ticketTeen})<br>
			                                    	</c:when>
			                                    	<c:otherwise>
			                                    		(우대 ${item.ticketSenior})<br>
			                                    	</c:otherwise>
			                                    </c:choose>
			                                    좌석 : ${item.ticketSeat}<br>
			                                    결제수단 : ${item.paymentType}(쿠폰 ${item.ticketCoupon}개 사용)<br>
			                                    결제금액 : <fmt:formatNumber value="${item.paymentPrice}" type="number" groupingUsed="true"/>원<br>
			                                    
			                                </div>
			                            </div>
			                        </li>
			
			                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>
			                        
			                        <div class="myreview"></div>
									<div class="myreviewbox" id="myreviewbox${status.index}">
										<h3 style="margin-top: 20px">상영후기</h3>
										<i class="fa-solid fa-x" onclick="closereview(${status.index})" id="reviewCancelBtn"></i>
										<div
											style="border: 1px solid #fdd000; margin-bottom: 20px; margin-top: 20px;"></div>
										<form action="writeReview" method="post">
											<img src="resources/img/movie/poster/${item.movieImage}" alt="" class="myMovie--reviewimg">
											<h6 style="margin-top: 10px; font-weight: bold">${item.movieTitle}</h6>
											<input type="hidden" name="movieNo" value="${item.movieNo}">
											<input type="hidden" name="ticketNo" value="${item.ticketNo}">
											<div class="star-rating">
												<input type="radio" class="star" name="star" value="1" required>
												<input type="radio" class="star" name="star" value="2" required>
												<input type="radio" class="star" name="star" value="3" required>
												<input type="radio" class="star" name="star" value="4" required>
												<input type="radio" class="star" name="star" value="5" required>
											</div>
											<textarea rows="12" cols="33" name="reContent" id="reviewArea" placeholder="솔직한 리뷰 작성해주세요!" required></textarea><br> 
											<input type="submit" value="작성하기" id="reviewBtn"> 
										</form>

									</div>
								</c:forEach>
		
		                    </ul>
		                </div>
		                
		                <div class="myMovie--page">
		                    <nav aria-label="Page navigation example">
							  <ul class="pagination justify-content-center">
							    <c:if test="${currentPage > 1}">
							    	<li class="page-item">
										<a class="page-link" id="mypaging" href="${path}/myMovie?page=${currentPage - 1}">&laquo;</a>
							    	</li>
								</c:if>
							   <c:forEach var="i" begin="1" end="${totalPages}">
							   		<li>
						            	<a href="${path}/myMovie?page=${i}" class="page-link ${i == currentPage ? 'active' : ''}" id="mypaging">${i}</a>
						            </li>
						        </c:forEach>
							    <c:if test="${currentPage < totalPages}">
							    	<li class="page-item">
										<a class="page-link" id="mypaging" href="${path}/myMovie?page=${currentPage + 1}">&raquo;</a>
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
	    var reviewMessage = "${reviewMessage}";
	 
	    if (reviewMessage) {
	        alert(reviewMessage);
	    }
	</script>
	
	 <script type="text/javascript">
	    var cancelMessage = "${cancelMessage}";
	 
	    if (cancelMessage) {
	        alert(cancelMessage);
	    }
	</script>
	
	 <script type="text/javascript">
	    var cancelfalseMessage = "${cancelfalseMessage}";
	 
	    if (cancelfalseMessage) {
	        alert(cancelfalseMessage);
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

<script src="${path}/resources/js/mypage/myMovie.js" ></script>