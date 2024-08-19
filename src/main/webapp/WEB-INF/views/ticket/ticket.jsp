<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>



<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>


<section class="ticket--section">
	<div class="ticket--container">
		<div class="ticket--left">
		
			<%-- Left 영화 선택 --%>
			<div class="left--section left--section--menu selected">
				<div>
					<span>01</span> <br> 영화선택
				</div>

				<div class="left--info left--menu--info selected">
					<ul>
						<%-- Left 영화 제목 --%>
						<li>
							<div>
								<i class="fa-solid fa-circle fa-2xs left--movie--Title--Icon" style="color: #ffffff;"></i> 
								<span class="left--movie--title--txt">${movieDTO.movieTitle}</span>
							</div>
						</li>
						
						<%-- Left 영화 지역 --%>
						<li>
							<div>
								<i class="fa-solid fa-circle fa-2xs left--cinema--BLG--Icon" style="color: #ffffff;"></i>
								<span class="left--cinema--BLG--txt">${cinemaLocation}</span> 
								
							</div>
						</li>
						
						<%-- Left 영화 날짜 --%>
						<li>
							<div>
								<i class="fa-solid fa-circle fa-2xs left--cinema--Screen--Date--Icon" style="color: #ffffff;"></i>
								<span class="left--cinema--Screen--Date--txt">${screenDate}</span>  
							</div>
						</li>
						
						<%-- Left 영화 상영시간 --%>
						<li>
							<div>
								<i class="fa-solid fa-circle fa-2xs left--theaterNo--Icon" style="color: #ffffff;"></i>
								<span class="left--theaterNo--txt">${theaterTime}</span>   
							</div>
						</li>
					</ul>
				</div>
			</div>
				
				
			<%-- Left 좌석 선택 --%>
			<div class="left--section left--section--seat">
				<div>
					<span>02</span> <br> 좌석선택
					
					<div class="left--info left--seat--info">
						<ul>
							<%-- Left 인원수 --%>
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs left--person--cnt--Icon" style="color: #ffffff;"></i>
									<span class="left--person--cnt">${leftPerson}</span> 
								</div>
							</li>
								
							<%-- Left 좌석 번호 --%>
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs left--seat--num--Icon" style="color: #ffffff;"></i>
									<span class="left--seat-num">${leftSeatNum}</span> 
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			
			
			
			
			<%-- Left 결제 선택 --%>
			<div class="left--section left--section--pay">
				<div>
					<span>03</span> <br> 결제
					
					<div class="left--info left--pay--info">
						<ul>
							<%-- Left 결제 상품금액 --%>
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs left--price--Icon" style="color: #ffffff;"></i>
									<span>상품금액 <span class="left--ticket--price">${ticketPrice}</span>원</span>
								</div>
							</li>
	
							<%-- Left 결제 할인금액 --%>
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs left--price--Icon" style="color: #ffffff;"></i>
									<span>할인금액 -<span class="left--discount--price">0</span>원</span>
								</div>
							</li>
							
							<%-- Left 결제 결제금액 --%>
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs left--price--icon" style="color: #ffffff;"></i>
									<span>결제금액 <span class="left--total--price">${ticketPrice}</span>원</span>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>


		<jsp:include page="/WEB-INF/views/ticket/${ticketPage}.jsp"></jsp:include>

	</div>
</section>


<div id="loadingSpinner">
	<div class="loading--spinner">
		<img src="${path}/resources/img/ticket/Spinner.gif">
	</div>
</div>

<div class="inform--blush"></div>
<div class="inform--container">
	<div class="inform--box">
		<div class="inform--content--box">
		</div>
		
		
		<div class="inform--btn--box">
			<button class="inform--btn">
				확인
			</button>
		</div>
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

