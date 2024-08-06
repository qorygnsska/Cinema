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
			<div class="left--section left--section--menu selected">
				<div>
					<span>01</span> <br> 상영시간
				</div>

				<div class="left--info left--menu--info">
					<ul>
						<li>
							<div>
								<i class="fa-solid fa-circle fa-2xs movie--Title--Icon" style="color: #ffffff;"></i> 
								<span class="movie--title--txt">${movieDTO.movieTitle}</span>
							</div>
						</li>

						<li>
							<div>
								<i class="fa-solid fa-circle fa-2xs cinema--BLG--Icon" style="color: #ffffff;"></i>
								<span class="cinema--BLG--txt">${cinemaLocation}</span> 
								
							</div>
						</li>

						<li>
							<div>
								<i class="fa-solid fa-circle fa-2xs cinema--Screen--Date--Icon" style="color: #ffffff;"></i>
								<span class="cinema--Screen--Date--txt">${screenDate}</span>  
							</div>
						</li>
						<li>
							<div>
								<i class="fa-solid fa-circle fa-2xs theaterNo--Icon" style="color: #ffffff;"></i>
								<span class="theaterNo--txt">${theaterTime}</span>   
							</div>
						</li>
					</ul>
				</div>
			</div>
				
				
				
			<div class="left--section left--section--seat">
				<div>
					<span>02</span> <br> 좌석선택
					
					<div class="left--info left--seat--info">
						<ul>
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs person--cnt--Icon" style="color: #ffffff;"></i>
									<span class="person--cnt"></span> 
								</div>
							</li>
	
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs seat--num--Icon" style="color: #ffffff;"></i>
									<span class="seat-num"></span> 
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			
			
			
			

			<div class="left--section">
				<div>
					<span>03</span> <br> 결제
				</div>
			</div>
		</div>


		<jsp:include page="/WEB-INF/views/ticket/${ticketPage}.jsp"></jsp:include>

	</div>
</section>


<div id="loadingSpinner">
	<div class="loading--spinner">
		<img src="${path}/resources/img/ticket/jerry_run_spinner.gif">
	</div>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>


