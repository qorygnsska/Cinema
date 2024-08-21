<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section class="myMovie--section">
    <div class="container" id="myProduct--container">
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
                
                <div class="myProduct--myReview">
                    <a href="myReview">
                        <p>내가 쓴 리뷰</p>
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
                
                <c:choose>
	                <c:when test="${propayment.size() == 0}">
	                	<h3 style="margin-top: 50px;">상품 결제 내역이 존재하지 않습니다..</h3>
	                </c:when>
	                <c:otherwise>
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
		                                <th></th>
		                            </tr>
		                        </thead>
		                        <tbody>
		                        	<c:forEach var="item" items="${pagepropayment}" varStatus="status">
		                        		<tr>
			                                <td><a href="${path}/storeDetail?productNo=${item.productNo}"><img src="resources/img/store/${item.productImage}" alt="" class="myProduct--storeimg"></a></td>
			                                <td>${item.paymentNo}</td>
			                                <td><fmt:formatDate value="${item.paymentDate}" pattern="yy/MM/dd" /></td>
			                                <td>${item.productName}</td>
			                                <td>${item.totalCount}개</td>
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
			                                        	<div class="procontent">
			                                            	주문번호 : ${item.paymentNo}<br>
			                                            	구매일 : <fmt:formatDate value="${item.paymentDate}" pattern="yy/MM/dd HH:mm" /><br>
			                                            	구매정보 : ${item.productInfo}<br>
			                                            	총 수량 : ${item.totalCount}개<br>
			                                            	결제수단 : ${item.paymentType}<br>
			                                            	결제금액 : <fmt:formatNumber value="${item.paymentPrice}" type="number" groupingUsed="true"/>원<br>
			                                            </div>    
			                                        </div>
			                                    </div>
			                                </td>
			                            </tr>
		                        	</c:forEach>
		                        </tbody>
		                    </table>
		                </div>
		                
		                <div class="myMovie--page">
		                    <nav aria-label="Page navigation example">
							  <ul class="pagination justify-content-center">
							    <c:if test="${currentPage > 1}">
							    	<li class="page-item">
										<a class="page-link" id="mypaging" href="${path}/myProduct?page=${currentPage - 1}">&laquo;</a>
							    	</li>
								</c:if>
							   <c:forEach var="i" begin="1" end="${totalPages}">
							   		<li>
						            	<a href="${path}/myProduct?page=${i}" class="page-link ${i == currentPage ? 'active' : ''}" id="mypaging">${i}</a>
						            </li>
						        </c:forEach>
							    <c:if test="${currentPage < totalPages}">
							    	<li class="page-item">
										<a class="page-link" id="mypaging" href="${path}/myProduct?page=${currentPage + 1}">&raquo;</a>
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