<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/movie/detail.css'/>">
<script src="https://kit.fontawesome.com/56395bc9f8.js" crossorigin="anonymous"></script>
<title>영화 상세정보</title>
</head>
<body>
	<div id="container">
		<div id="contents">
			<div class="wrap-movie-detail">
				<div class="sect-base-movie">
					<div class="box-image">
						<a href="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_1000.jpg" title="포스터 크게 보기 새창" target="_blank">
							<span class="thumb-image">
								<img class="movie-poster" src="https://img.cgv.co.kr/Movie/Thumbnail/Poster/000088/88228/88228_320.jpg" alt="데드풀과 울버린 포스터">
								<img class="age" src="resources/img/Image_Age_19.png">
							</span>
						</a>
					</div>
					
					<div class="box-contents">
						<div class="title">
							<strong>데드풀과 울버린</strong>
						</div>
						<div class="score">
							<strong class="percent">
								예매율 <span class="percent-span">16.8%</span>
							</strong>
							<div class="star-rating">
								<i class="fa-solid fa-star"></i>
								<span class="star">9.1</span>
							</div>
						</div>
						
						<div class="box-info">
							<ul class="box-info-ui">
								<li class="box-info-ui-li">감독 : 숀레비</li>
								<li class="box-info-ui-li">배우 : 라이언 레이놀즈, 휴 잭맨, 엠마 코린, 모레나 바카린, 롭 딜레이니, 레슬리 우감스, 카란 소니, 매튜 맥퍼딘</li>
								<li class="box-info-ui-li">장르 : 액션, 코미디, SF</li>
								<li class="box-info-ui-li">기본 정보 : 청소년관람불가, 127분, 미국</li>
								<li class="box-info-ui-li">개봉일 : 2024.07.24</li>
							</ul>
						</div>
						
						<span class="like">
							<a class="link-reservation" href=""> <!-- 예매 사이트로 이동 -->
								예매하기										
							</a>
						</span>
					</div>
				</div>
				
				<div class="cols-content">
					<div class="sect-story-movie">
					히어로 생활에서 은퇴한 후, <br>
					평범한 중고차 딜러로 살아가던 ‘데드풀’이 <br>
					예상치 못한 거대한 위기를 맞아 <br>
					모든 면에서 상극인 ‘울버린’을 찾아가게 되며 펼쳐지는 <br>
					도파민 폭발 액션 블록버스터
					</div>
					
					<div class="sect-trailer-movie">
						<div class="sect-trailer-movie-heading">
							<h4>트레일러</h4>
						</div>
						<ul class="video-ul">
							<li class="video-li">
								<div class="video-image">
									<a href="" title="새창" class="movie_player_popup" > <!-- 영화보는 팝업으로 이동 -->
										<span class="video-image">
											<img src="https://img.cgv.co.kr/Movie/Thumbnail/Trailer/88228/88228228266_1024.jpg" alt="[데드풀과 울버린]파이널 예고편" />
											<span class="ico-play"></span> <!-- 동영상 재생 버튼? -->
										</span>
									</a>
								</div>
							</li>
						</ul>
					</div>
				</div>
				
				
			</div>
		</div>
	</div>
</body>
</html>