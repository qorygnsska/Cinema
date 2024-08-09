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
					<h2 class="list--header">현재상영작</h2>
					<div class="list--submenu">
						<ul class="list--submenu-ul">
							<li class="list--submenu-ul-li list--submenu-ul-li-1">
								<a class="list--submenu-a" href="" title="선택">현재상영작</a>
							</li>
							<li class="list--submenu-ul-li list--submenu-ul-li-2">
								<a class="list--submenu-a" href="">상영예정작</a>
							</li>
						</ul>
					</div>			
				</div>
				<hr class="list--hr"/>
				
				<div class="list--sect-sorting">
					<ul class="list--sect-sorting-ul">
						<li class="list--sect-sorting-ul-li list--sect-sorting-ul-li-1" >
							<a class="list--sect-sorting-a list--sect-sorting-a1" href="" type="botton">예매율순</a>
						</li>
						<li class="list--sect-sorting-ul-li list--sect-sorting-ul-li-2">
							<a class="list--sect-sorting-a list--sect-sorting-a2" href="" type="botton">별점순</a> 
						</li>
					</ul>
				</div>
				
				<div class="list--sect-movie-chart">
					<!-- 무비차트 시작 -->
					<ol class="list--sect-movie-chart-ol list--sect-movie-chart-ol-1">
						<c:forEach var="movie" items="${movieList}">
							<li class="list--sect-movie-chart-ol-li">
								<div class="list--box-image">
									<a href="movieDetail?movieNo=${movie.movieNo}"> <!-- 상세정보 페이지로 이동 -->
										<span class="list--thumb-image">
											<img class="list--movie-poster" src="resources/img/movie/${movie.movieImage}" alt="">
										</span>
									</a>
								</div>
								<div class="list--box-contents">
									<a class="list--box-contents-a" href="movieDetail?movieNo=${movie.movieNo}"> <!-- 상세정보 페이지로 이동 -->
										<strong class="list--title">${movie.movieTitle}</strong>
									</a>
									<div class="list--score">
										<strong class="list--percent">
											예매율 <span> 16.8%</span> <!-- 예매율 데이터가 있다면 여기서 수정 -->
										</strong>
										<div class="list--star-rating">
											<i class="fa-solid fa-star" style="color: red;"></i>
											<span class="list--star">${movie.ratingStarAVG}</span> <!-- 별점 데이터가 있다면 여기서 수정 -->
										</div>
									</div>
									<span class="list--like">
										<a class="list--link-reservation" href=""> <!-- 예매 사이트로 이동 -->
											예매하기										
										</a>
									</span>
								</div>
							</li>
						</c:forEach>
					</ol>
					<!-- 무비차트 끝 -->
				</div>
			</div>
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
