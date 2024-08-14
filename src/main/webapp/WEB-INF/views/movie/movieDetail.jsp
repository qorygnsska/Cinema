<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${path}/resources/css/movie/detail.css?after">
<!-- <script src="https://kit.fontawesome.com/56395bc9f8.js" crossorigin="anonymous"></script> -->

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<div id="detail--container">
		<div id="detail--contents">
			<div class="detail--wrap-movie-detail">
				<div class="detail--sect-base-movie">
					<div class="detail--box-image">
						<a href="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_1000.jpg" title="포스터 크게 보기 새창" target="_blank">
							<span class="detail--thumb-image">
								<img class="detail--movie-poster" src="resources/img/movie/poster/${movie.movieMainImage}" alt="데드풀과 울버린 포스터">
								<!-- <img class="detail--age" src="resources/img/movie/Image_Age_19.png"> -->
							</span>
						</a>
					</div>
					
					<div class="detail--box-contents">
						<div class="detail--title">
							<strong>${movie.movieTitle}</strong>
						</div>
						<div class="detail--score">
							<strong class="detail--percent">
								예매율 <span class="percent-span">${movieReservationInfo}%</span>
							</strong>
							<div class="detail--star-rating">
								<i class="fa-solid fa-star" style="color: red;"></i>
								<span class="detail--star">${movie.ratingStarAVG}</span>
							</div>
						</div>
						
						<div class="detail--box-info">
							<ul class="detail--box-info-ui">
								<li class="detail--box-info-ui-li">감독 : ${movie.movieDirector}</li>
								<li class="detail--box-info-ui-li">배우 : ${movie.movieActor}</li>
								<li class="detail--box-info-ui-li">장르 : ${movie.movieGenre}</li>
								<li class="detail--box-info-ui-li">기본 정보 : 
								<c:choose>
        							<c:when test="${movie.movieAgeLimit == 'All'}">
            							전체 이용가
        							</c:when>
        							<c:when test="${movie.movieAgeLimit == '12' || movie.movieAgeLimit == '15' || movie.movieAgeLimit == '19'}">
            							${movie.movieAgeLimit}세 이용가
        							</c:when>
        							<c:otherwise>
            							${movie.movieAgeLimit}
        							</c:otherwise>
    									</c:choose>
    									, ${movie.movieShowtime}분, ${movie.movieNationality}</li>
								<li class="detail--box-info-ui-li">개봉일 : <fmt:formatDate value="${movie.movieStartDate}" pattern="yyyy.MM.dd" /></li>
							</ul>
						</div>
						
						<span class="detail--like">
							<a class="detail--link-reservation" href="ticket"> <!-- 예매 사이트로 이동 -->
								예매하기										
							</a>
						</span>
					</div>
					
				</div>
				
				<div class="detail--cols-content">
				
					<div class="detail--sect-story-movie">
					<h4>줄거리</h4>
					${movie.movieSummary}
					<!-- 히어로 생활에서 은퇴한 후, <br>
					평범한 중고차 딜러로 살아가던 ‘데드풀’이 <br>
					예상치 못한 거대한 위기를 맞아 <br>
					모든 면에서 상극인 ‘울버린’을 찾아가게 되며 펼쳐지는 <br>
					도파민 폭발 액션 블록버스터 -->
					</div>
					
					<!-- 트레일러 시작 -->
					<div class="detail--sect-trailer-movie">
						<div class="detail--sect-trailer-movie-heading">
							<h4>트레일러</h4>
						</div>
						<ul class="detail--video-ul">
							<li class="detail--video-li">
								<div class="detail--video-image-div">
									<a href="#" title="새창" class="detail--movie_player_popup" > <!-- 영화보는 팝업으로 이동 -->
										<span>
											<img class="detail--video-image" src="resources/img/movie/Thumbnail/${movie.movieMainThumbnail}"/>
											<img class="detail--ico-play" src="resources/img/movie/icon-play.png"> <!-- 동영상 재생 버튼 -->
										</span> 
									</a>
								</div>
								<div class="detail--video-contents">
									<a href="#" title="새창" class="detail--movie_player_popup"> <!-- 영화보는 팝업으로 이동 -->
									 	<strong>파이널 예고편</strong>
									</a>
								</div>
								
								<!-- 팝업창 -->
							<div class="detail--movie--popup">
								<div class="popup-content">
									<iframe class="detail--trailer" src="https://www.youtube.com/embed/${movie.movieMainTrailer}&autoplay=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
									<i type="button" class="fa-solid fa-xmark detail--close"></i>
								</div>
							</div>
							</li>


							<li class="detail--video-li">
								<div class="detail--video-image-div">
									<a href="#" title="새창" class="detail--movie_player_popup" > <!-- 영화보는 팝업으로 이동 -->
										<span>
											<img class="detail--video-image" src="resources/img/movie/Thumbnail/${movie.movieSubThumbnail}"/>
											<img class="detail--ico-play" src="resources/img/movie/icon-play.png"> <!-- 동영상 재생 버튼 -->
										</span> 
									</a>
								</div>
								<div class="detail--video-contents">
									<a href="#" title="새창" class="detail--movie_player_popup"> <!-- 영화보는 팝업으로 이동 -->
									 	<strong>2차 예고편</strong>
									</a>
								</div>
								
								<!-- 팝업창 -->
							<div class="detail--movie--popup">
								<div class="popup-content">
									<iframe class="detail--trailer" src="https://www.youtube.com/embed/${movie.movieSubTrailer}&autoplay=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
									<i type="button" class="fa-solid fa-xmark detail--close"></i>
								</div>
							</div>
							</li>
							
							
							<li class="detail--video-li">
								<div class="detail--video-image-div">
									<a href="#" title="새창" class="detail--movie_player_popup" > <!-- 영화보는 팝업으로 이동 -->
										<span>
											<img class="detail--video-image" src="resources/img/movie/Thumbnail/${movie.movieSsubThumbnail}"/>
											<img class="detail--ico-play" src="resources/img/movie/icon-play.png"> <!-- 동영상 재생 버튼 -->
										</span> 
									</a>
								</div>
								<div class="detail--video-contents">
									<a href="#" title="새창" class="detail--movie_player_popup"> <!-- 영화보는 팝업으로 이동 -->
									 	<strong>1차 예고편</strong>
									</a>
								</div>
								
								<!-- 팝업창 -->
							<div class="detail--movie--popup">
								<div class="popup-content">
									<iframe class="detail--trailer" src="https://www.youtube.com/embed/${movie.movieSsubTrailer}&autoplay=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
									<i type="button" class="fa-solid fa-xmark detail--close"></i>
								</div>
							</div>
							</li>
						</ul>
					</div>
					<!-- 트레일러 끝 -->
					
					<!-- 스틸컷 시작 -->
					<div class="detail--sect-stillcut-movie">
						<div class="detail--sect-trailer-movie-heading">
							<h4>스틸컷</h4>
						</div>
						<div id="carouselExample" class="carousel slide detail--carouselExample">
							<div id="detail--carousel-inner" class="carousel-inner">
								<div class="carousel-item active detail--carousel-item">
									<img
										src="resources/img/movie/poster/${movie.movieMainImage}"
										class="d-block w-100 carousel-image detail--carousel-image" alt="...">
								</div>
								<div class="carousel-item detail--carousel-item">
									<img src="resources/img/movie/poster/${movie.movieSubImage}"
										class="d-block w-100 carousel-image detail--carousel-image" alt="...">
								</div>
								<div class="carousel-item detail--carousel-item">
									<img src="resources/img/movie/poster/${movie.movieSsubImage}"
										class="d-block w-100 carousel-image detail--carousel-image" alt="...">
								</div>
							</div>
							<button class="carousel-control-prev detail--carousel-control-prev" type="button"
								data-bs-target="#carouselExample" data-bs-slide="prev">
								<span class="carousel-control-prev-icon detail--carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</button>
							<button class="carousel-control-next detail--carousel-control-next " type="button"
								data-bs-target="#carouselExample" data-bs-slide="next">
								<span class="carousel-control-next-icon detail--carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</button>
						</div>
					</div>
					<!-- 스틸컷 끝 -->

					<!-- 리뷰 시작 -->
					<div class="detail--sect-review-movie">
						<div class="detail--sect-trailer-movie-heading">
							<h4>관람평</h4>
						</div>
						<div class="detail--review--write">
							<h4>
								리뷰 <span class="detail--review--total">${reviewTotal.reviewTotal}</span>
							</h4>
						</div>
						<hr class="detail--hr" />
						<ul class="detail--review-list">
							<c:forEach var="review" items="${review}">
								<li>
									<div class="detail--review-top-info">
										<span class="detail--review-name">${review.reviewMemberId}</span>
										<div class="detail--review--score">
											<p id="detail--review--star">★★★★★</p>
											<i class="fa-regular fa-thumbs-up" id="detail--review--like" onclick="incrementLike(this)"></i>
											<span class="detail--review--count">${review.reviewLikeCount}</span>
										</div>
										<div class="detail--review">
											<p>${review.reviewContent}</p>
										</div>
										 <p id="detail--reviewdate"><fmt:formatDate value="${review.reviewWriteDate}" pattern="yyyy.MM.dd" /></p> 
									</div>
								</li>
							</c:forEach>
						</ul>

						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if test="${currentPage > 1}">
									<li class="page-item"><a class="page-link"
										href="?movieNo=${movie.movieNo}&page=${currentPage - 1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>

								<c:forEach var="i" begin="1" end="${totalPage}">
									<li class="page-item ${i == currentPage ? 'active' : ''}">
										<a class="page-link"
										href="?movieNo=${movie.movieNo}&page=${i}">${i}</a>
									</li>
								</c:forEach>

								<c:if test="${currentPage < totalPage}">
									<li class="page-item"><a class="page-link"
										href="?movieNo=${movie.movieNo}&page=${currentPage + 1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
					<!-- 리뷰 끝 -->

				</div>
				
			</div>
		</div>
	</div>
</section>

<script src="${path}/resources/js/movie/like.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>