<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/movie/list.css'/>">
<script src="https://kit.fontawesome.com/56395bc9f8.js" crossorigin="anonymous"></script>
<title>무비차트</title>
</head>
<body>
	<div id="container">
		<div id="contents">
			<div class="wrap-movie-chart">
				<div class="heading-wrap">
					<h2 class="header">현재상영작</h2>
					<div class="submenu">
						<ul class="submenu-ul">
							<li class="submenu-ul-li submenu-ul-li-1">
								<a class="submenu-a" href="/movies/" title="선택">현재상영작</a>
							</li>
							<li class="submenu-ul-li submenu-ul-li-2">
								<a class="submenu-a" href="/movies/pre-movies.aspx">상영예정작</a>
							</li>
						</ul>
					</div>			
				</div>
				<hr />
				
				<div class="sect-sorting">
					<!-- <select id=order_type">
						<option value="1">예매율순</option>
						<option value="2">별점순</option>
					</select> -->
					<ul class="sect-sorting-ul">
						<li class="sect-sorting-ul-li sect-sorting-ul-li-1" >
							<a class="sect-sorting-a sect-sorting-a1" href="" type="botton">예매율순</a>
						</li>
						<li class="sect-sorting-ul-li sect-sorting-ul-li-2">
							<a class="sect-sorting-a sect-sorting-a2" href="" type="botton">별점순</a> 
						</li>
					</ul>
				</div>
				
				<div class="sect-movie-chart">
					<!-- 무비차트 맨 윗 줄 시작 -->
					<ol class="sect-movie-chart-ol sect-movie-chart-ol-1">
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href="cinema/movieDetail"> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span> 16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
					</ol>
					<!-- 무비차트 맨 윗 줄 끝 -->
					
					<!-- 무비차트 2번째 줄 시작 -->
					<ol class="sect-movie-chart-ol sect-movie-chart-ol-after">
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
					</ol>
					<!-- 무비차트 2번째 줄 끝 -->
					
					<!-- 무비차트 3번째 줄 시작 -->
					<ol class="sect-movie-chart-ol sect-movie-chart-ol-after">
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
						
						<li class="sect-movie-chart-ol-li">
							<div class="box-image">
								<a href=""> <!-- 상세정보 페이지로 이동 -->
									<span class="thumb-image">
										<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
										<img class="age" src="resources/img/Image_Age_19.png">
									</span>
								</a>
							</div>
							<div class="box-contents">
								<a class="box-contents-a" href=""> <!-- 상세정보 페이지로 이동 -->
									<strong class="title">데드풀과 울버린</strong>
								</a>
								<div class="score">
									<strong class="percent">
										예매율 <span>16.8%</span>
									</strong>
									<div class="star-rating">
										<i class="fa-solid fa-star"></i>
										<span class="star">9.1</span>
									</div>
								</div>
								<span class="like">
									<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
										예매하기										
									</a>
								</span>
							</div>
						</li>
					</ol>
					<!-- 무비차트 3번째 줄 끝 -->
				</div>
			</div>
		</div>
	</div>

</body>
</html>