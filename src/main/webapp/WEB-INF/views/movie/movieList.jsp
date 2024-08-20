<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<div id="list--container">
		<div id="list--contents">
			<div class="list--wrap-movie-chart">
				<div class="list--heading-wrap">
				
				<c:choose>
					<c:when test="${selectedMenu == 'current'}">
						<h2 class="list--header">현재상영작</h2>
					</c:when>
					<c:when test="${selectedMenu == 'Upcoming'}">
						<h2 class="list--header">상영예정작</h2>
					</c:when>
					<c:when test="${selectedMenu == 'search'}">
						<h2 class="list--header">검색결과</h2>
					</c:when>
				</c:choose>
				
					<div class="list--submenu">
						<ul class="list--submenu-ul">
							<li class="list--submenu-ul-li list--submenu-ul-li-1">
								<a class="list--submenu-a ${selectedMenu == 'current' ? 'list--select' : ''}" href="?select=current" title="선택">현재상영작</a>
							</li>
							<li class="list--submenu-ul-li list--submenu-ul-li-2">
								<a class="list--submenu-a ${selectedMenu == 'Upcoming' ? 'list--select' : ''}" href="?select=Upcoming">상영예정작</a>
							</li>
						</ul>
					</div>			
				</div>
				<hr class="list--hr"/>
				
			<c:if test="${selectedMenu == 'current'}">
				<div class="list--sect-sorting">
					<ul class="list--sect-sorting-ul">
						<li class="list--sect-sorting-ul-li list--sect-sorting-ul-li-1" >
							<a class="list--sect-sorting-a list--sect-sorting-a1 ${sortedMenu == 'reservation' ? 'list--sort' : ''}" href="?sort=reservation" type="botton">예매율순</a>
						</li>
						<li class="list--sect-sorting-ul-li list--sect-sorting-ul-li-2">
							<a class="list--sect-sorting-a list--sect-sorting-a2 ${sortedMenu == 'rating' ? 'list--sort' : ''}" href="?sort=rating" type="botton">별점순</a> 
						</li>
					</ul>
				</div>
			</c:if>
				
				<div class="list--sect-movie-chart">
					<!-- 무비차트 시작 -->
					<ol class="list--sect-movie-chart-ol list--sect-movie-chart-ol-1">
						<c:forEach var="movie" items="${movieList}" varStatus="status">
							<li class="list--sect-movie-chart-ol-li">
								<div class="list--box-image">
									<a href="movieDetail?movieNo=${movie.movieNo}"> <!-- 상세정보 페이지로 이동 -->
										<span class="list--thumb-image">
											<img class="list--movie-poster" src="resources/img/movie/poster/${movie.movieMainImage}" alt="">
											<c:choose>
											    <c:when test="${movie.movieAgeLimit == 'All'}">
											        <img class="list--age" src="resources/img/ticket/Image_Age_All.png" alt="All">
											    </c:when>
											    <c:when test="${movie.movieAgeLimit == '12'}">
											        <img class="list--age" src="resources/img/ticket/Image_Age_12.png" alt="12">
											    </c:when>
											    <c:when test="${movie.movieAgeLimit == '15'}">
											        <img class="list--age" src="resources/img/ticket/Image_Age_15.png" alt="15">
											    </c:when>
											    <c:when test="${movie.movieAgeLimit == '19'}">
											        <img class="list--age" src="resources/img/ticket/Image_Age_19.png" alt="19">
											    </c:when>
											</c:choose>
											<c:if test="${selectedMenu == 'Upcoming'}">
												<div class="list--Dday--box" data-start-date="${movie.movieStartDate}">
													<span>D-</span>
												</div>
											</c:if>
										</span>
									</a>
								</div>
								<div class="list--box-contents">
									<a class="list--box-contents-a" href="movieDetail?movieNo=${movie.movieNo}"> <!-- 상세정보 페이지로 이동 -->
										<strong class="list--title" title="${movie.movieTitle}">${movie.movieTitle}</strong>
									</a>
									<div class="list--score">
										<strong class="list--percent">
											예매율 <span> ${movie.movieReservation}%</span> <!-- 예매율 데이터가 있다면 여기서 수정 -->
										</strong>
										<div class="list--star-rating">
											<i class="fa-solid fa-star" style="color: red;"></i>
											<span class="list--star">${movie.ratingStarAVG}</span> <!-- 별점 데이터가 있다면 여기서 수정 -->
										</div>
									</div>
									<span class="list--like">
										<a class="list--link-reservation" href="ticket"> <!-- 예매 사이트로 이동 -->
											예매하기										
										</a>
									</span>
								</div>
							</li>
						</c:forEach>
					</ol>
					<!-- 무비차트 끝 -->
					
					<!-- 페이지네이션 -->
				<nav aria-label="Page navigation">
					<ul class="pagination d-flex justify-content-center">
						<c:if test="${currentPage > 1}">
							<li class="page-item">
								<a class="page-link detail--page-link" href="?page=${currentPage - 1}&sort=${sortedMenu}&select=${selectedMenu}">&laquo;</a>
							</li>
						</c:if>
						
						<c:forEach var="i" begin="1" end="${totalPages}">
							<li class="page-item ${i == currentPage ? 'active' : ''}">
								<a class="page-link detail--page-link" href="?page=${i}&sort=${sortedMenu}&select=${selectedMenu}">${i}</a>
							</li>
						</c:forEach>

						<c:if test="${currentPage < totalPages}">
							<li class="page-item">
								<a class="page-link detail--page-link" href="?page=${currentPage + 1}&sort=${sortedMenu}&select=${selectedMenu}">&raquo;</a>
							</li>
						</c:if>
					</ul>
				</nav>
					
					
				</div>
			</div>
		</div>
	</div>
</section>
<script src="${path}/resources/js/movie/ddayCalculator.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
