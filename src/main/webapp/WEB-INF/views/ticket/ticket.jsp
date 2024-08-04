<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />


<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>



<script src="${path}/resources/js/jquery-3.7.1.min.js" defer></script>

<section class="ticket--section">
	<div class="ticket--container">
		<div class="ticket--left">
			<div class="left--section left--section--menu selected">
				<form action="${path}/ticket/seat" method="post">
					<div>
						<span>01</span> <br> 상영시간
					</div>
	
					<div class="left--menu--info">
						<ul>
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs movie--Title--Icon" style="color: #ffffff;"></i> 
									<input type="text" id="movieTitle" name="movieTitle" value="" readonly>
								</div>
							</li>
	
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs cinema--BLG--Icon" style="color: #ffffff;"></i> 
									<input type="text" id="cinemaBLG" name="cinemaBLG" value="" readonly>
								</div>
							</li>
	
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs cinema--Screen--Date--Icon" style="color: #ffffff;"></i> 
									<input type="text" id="cinemaScreenDate" name="cinemaScreenDate" value="" readonly>
								</div>
							</li>
							<li>
								<div>
									<i class="fa-solid fa-circle fa-2xs theaterNo--Icon" style="color: #ffffff;"></i> 
									<input type="text" id="theaterTime" name="theaterTime" value="" readonly>
								</div>
							</li>
						</ul>
					</div>
					<input type="hidden" id="movieNo" name="movieNo" value="">
					<input type="hidden" id="cinemaNo" name="cinemaNo" value="">
					<input type="hidden" id="theaterNo" name="theaterNo" value="">
				
					<div id="layerReserve" ></div>
					<div id="layerReserveStep01" class="layerReserveStep01" >
							<div class="layer--header">
								<strong>
									몇시부터 몇시까지 몇관
								</strong>
							</div>
							
							<div class="layer--contents">
								<div class="layer--seat--infor">
									<div class="layer--seat">
										<span>잔여좌석</span>
										<br>
										<strong></strong><span>/150</span>
									</div>
									
									<div class="layer--content">
										<p class="tlt">
											<img alt="" src="">
											<span>본영화는 <strong></strong> 영화입니다.
											</span>
										</p>
										<p class="txt"></p>
										
									</div>
								</div>
								
								<div class="layer--btn">
									<button type="submit" class="layer--btn--submit t--btn">인원/좌석 선택</button>
									<button type="button" class="layer--btn--cancle t--btn">취소</button>
								</div>
							</div>				
						</div>	
				</form>
			</div>
				
				

			<div class="left--section">
				<div>
					<span>02</span> <br> 좌석선택
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


