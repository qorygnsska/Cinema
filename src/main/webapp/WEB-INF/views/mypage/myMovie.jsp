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
			                                    <img src="${path}/resources/img/mypageimg/아바타.jpg" alt="" class="myMovie--postimg">
			                                </div>
			
			                                <div class="myMovie--movieinfo">
			                                    <h3><span>${item.movieTitle}</span></h3>
			                                    <p>
			                                        <fmt:formatDate value="${item.cinemaScreenDate}" pattern="yyyy.MM.dd (E)" /> <fmt:formatDate value="${item.theaterStartTime}" pattern="HH:mm" /> ~ <fmt:formatDate value="${item.theaterEndTime}" pattern="HH:mm" /><br>
			                                        ${item.cinemaRlg} ${item.cinemaBlg} ${item.theaterName} / ${item.ticketTeen + item.ticketAdult + item.ticketSenior}명
			                                    </p>
			
			                                    <a onclick="openreview(${status.index})">리뷰 작성하기</a>
			                                </div>
			
			                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse${status.index}" aria-expanded="false" aria-controls="flush-collapse${status.index}">
			                                    펼쳐보기
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
			                                    결제수단 : ${item.paymentType}(${item.cardCompanyName})<br>
			                                    결제금액 : <fmt:formatNumber value="${item.paymentPrice}" type="number" groupingUsed="true"/>원<br>
			                                    
			                                </div>
			                            </div>
			                        </li>
			
			                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>
			                        
			                        <div class="myreview"></div>
									<div class="myreviewbox" id="myreviewbox${status.index}">
										<h3 style="margin-top: 20px">상형후기</h3>
										<i class="fa-solid fa-x" onclick="closereview(${status.index})" id="reviewCancelBtn"></i>
										<div
											style="border: 1px solid #fdd000; margin-bottom: 20px; margin-top: 20px;"></div>
										<form action="writeReview" method="post">
											<img src="${path}/resources/img/mypageimg/아바타.jpg" alt="" class="myMovie--reviewimg">
											<h6 style="margin-top: 10px;">${item.movieTitle}</h6>
											<input type="hidden" name="movieNo" value="${item.movieNo}">
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
										<a class="page-link" id="mypaging" href="${path}/myMovie?page=${currentPage - 1}">이전</a>
							    	</li>
								</c:if>
							   <c:forEach var="i" begin="1" end="${totalPages}">
							   		<li>
						            	<a href="${path}/myMovie?page=${i}" class="page-link ${i == currentPage ? 'active' : ''}" id="mypaging">${i}</a>
						            </li>
						        </c:forEach>
							    <c:if test="${currentPage < totalPages}">
							    	<li class="page-item">
										<a class="page-link" id="mypaging" href="${path}/myMovie?page=${currentPage + 1}">다음</a>
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
    
	
	<script>
        function closereview(idx){
            const myreview = document.querySelector(".myreview");
            const myreviewbox = document.querySelector("#myreviewbox" + idx);
            
            myreview.style.visibility = 'hidden';
            myreviewbox.style.visibility = 'hidden';
            
        }

        function openreview(idx){
        	const myreview = document.querySelector(".myreview");
            const myreviewbox = document.querySelector("#myreviewbox" + idx);
         	console.log(idx);
            myreview.style.visibility = 'visible';
            myreviewbox.style.visibility = 'visible';
             
        }
    </script>
    
    <script type="text/javascript">
	    var reviewMessage = "${reviewMessage}";
	 
	    if (reviewMessage) {
	        alert(reviewMessage);
	    }
	</script>
    
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>