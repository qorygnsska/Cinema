<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	
	
<div class="ticket-main">
	<div class="section section-movie">
		<div class="col-head" id="login">
			영화
		</div>

		<div class="col-body">
			<div class="tap-menu">
				<button class="btn">
					애매율순
				</button>
				
				<button class="btn">
					가나다순
				</button>
			</div>
			
			<div class="movie-list">
				<ul>
					<c:forEach var="movie" items="${movieList}">
						<li>
							<div class="movie-section">
								<c:if test="${movie.movieAgeLimit == '19'}">
									<img alt="19세 이상 이미지" src="${path}/resources/img/ticket/Image_Age_19.png">
								</c:if>
								
								<c:if test="${movie.movieAgeLimit == '15'}">
									<img alt="15세 이상 이미지" src="${path}/resources/img/ticket/Image_Age_15.png">
								</c:if>
								
								<c:if test="${movie.movieAgeLimit == '12'}">
									<img alt="12세 이상 이미지" src="${path}/resources/img/ticket/Image_Age_12.png">
								</c:if>
								
								<c:if test="${movie.movieAgeLimit == 'ALL'}">
									<img alt="전체 연령가 이미지" src="${path}/resources/img/ticket/Image_Age_All.png">
								</c:if>
								
								<span class="movie-title">${movie.movieTitle}</span>
							</div>
						</li>
					</c:forEach>
				</ul>			
			</div>
		</div>
	</div>

	<div class="section section-theater">
		<div class="col-head">극장</div>
		<div class="col-body">
			<div>
				<div class="theater-list">
					<ul>
						<li class="selected">
							<a href="#">
								<span class="name">서울</span><span class="count">(4)</span>
							</a>
							
							<div class="theater-list-section">
								<ul>
									<li>
										<a href="#">
											강남
										</a>
									</li>
									<li>
										<a href="#">
											강변
										</a>
									</li>
									<li>
										<a href="#">
											건대입구
										</a>
									</li>
									<li>
										<a href="#">
											구로
										</a>
									</li>
								</ul>
							</div>
						</li>
						
						
						<li>
							<a href="#">
								<span class="name">경기</span><span class="count">(4)</span>
							</a>
							
							<div class="theater-list-section">
								<ul>
									<li>
										<a href="#">
											경기광주
										</a>
									</li>
									<li>
										<a href="#">
											구리
										</a>
									</li>
									<li>
										<a href="#">
											하남
										</a>
									</li>
								</ul>
							</div>
						</li>
						
						<li>
							<a href="#">
								<span class="name">인천</span><span class="count">(3)</span>
							</a>
							
							<div class="theater-list-section">
								<ul>
									<li>
										<a href="#">
											계양
										</a>
									</li>
									
									<li>
										<a href="#">
											부양
										</a>
									</li>
									
									<li>
										<a href="#">
											인천
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#">
								<span class="name">강원</span><span class="count">(3)</span>
							</a>
							
							<div class="theater-list-section">
								<ul>
									<li>
										<a href="#">
											강릉
										</a>
									</li>
									
									<li>
										<a href="#">
											기린
										</a>
									</li>
									
									<li>
										<a href="#">
											춘천
										</a>
									</li>
								</ul>
							</div>
						</li>
						<li>
							<a href="#">
								<span class="name">부산</span><span class="count">(3)</span>
							</a>
							
							<div class="theater-list-section">
								<ul>
									<li>
										<a href="#">
											부산명지
										</a>
									</li>
									
									<li>
										<a href="#">
											서면
										</a>
									</li>
									
									<li>
										<a href="#">
											센텀시티
										</a>
									</li>
								</ul>
							</div>
						</li>
					</ul>
				</div>
				
				<div>
				
				</div>
			</div>	
		</div>
	</div>

	<div class="section section-date">
		<div class="col-head">날짜</div>

		<div class="col-body">
			<div class="date">
			</div>
		</div>
	</div>

	<div class="section section-time">
		<div class="col-head">시간</div>

		<div class="col-body">
			<div class="theater-time-wrap">
				<div class="theater-time">
					<span>1관</span>
					<ul>
						<li>
							<button type="button" class="btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
							
						</li>
						
						<li>
							<button type="button" class="btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
						</li>
						
						<li>
							<button type="button" class="btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
						</li>
						
						<li>
							<button type="button" class="btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
						</li>
					</ul>
				</div>
				
				<div class="theater-time">
					<span>2관</span>
					<ul>
						<li>
							<button type="button" class="btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
							
						</li>
						
						<li>
							<button type="button" class="btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
						</li>
						
						<li>
							<button type="button" class="btn">
								<span class="time">14:50</span>
								<span class="count">44석</span>
							</button>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<script src="${path}/resources/js/ticket/ticketMe.js" defer></script>
