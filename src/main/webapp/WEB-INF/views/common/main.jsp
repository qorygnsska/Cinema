<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

<!-- 트레일러 캐러셀 -->
<div id="carouselExampleCaptions" class="carousel slide">
	<div class="carousel-indicators">
		<button type="button" data-bs-target="#carouselExampleCaptions"
			data-bs-slide-to="0" class="active" aria-current="true"
			aria-label="Slide 1"></button>
		<button type="button" data-bs-target="#carouselExampleCaptions"
			data-bs-slide-to="1" aria-label="Slide 2"></button>
		<button type="button" data-bs-target="#carouselExampleCaptions"
			data-bs-slide-to="2" aria-label="Slide 3"></button>
	</div>
	<div class="carousel-inner">
		<div class="carousel-item active">
			<video type="video/mp4" autoplay="autoplay" muted="muted" loop="loop"
				src="${path}/resources/img/main/임시_10라이브즈예고편.mp4"
				class="d-block w-100 main_trailer">
			</video>
			<div class="fade-out-box">
				<div class="trailer_details">
					<h5 class="trailer_title">10라이브즈</h5>
					<p class="trailer_content">
						엉뚱한 동물로 또 다시 태어난다고?!<br> 배우 소유진 강력 추천 영화!
					</p>
					<button type="button" class="btn btn-light trailer_button">상세보기</button>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<video type="video/mp4" autoplay="autoplay" muted="muted" loop="loop"
				src="${path}/resources/img/main/임시_극장총집편예고편.mp4"
				class="d-block w-100 main_trailer">
			</video>
			<div class="fade-out-box">
				<div class="trailer_details">
					<h5 class="trailer_title">극장총집편 봇치 더 록! 전편</h5>
					<p class="trailer_content">
						결속밴드! CGV에서 다시 결속!<br> 8월 7일 대개봉
					</p>
					<button type="button" class="btn btn-light trailer_button">상세보기</button>
				</div>
			</div>
		</div>
		<div class="carousel-item">
			<video type="video/mp4" autoplay="autoplay" muted="muted" loop="loop"
				src="${path}/resources/img/main/임시_파일럿예고편.mp4"
				class="d-block w-100 main_trailer">
			</video>
			<div class="fade-out-box">
				<div class="trailer_details">
					<h5 class="trailer_title">파일럿</h5>
					<p class="trailer_content">
						웃음 공감 다잡은<br> 일등석 코미디
					</p>
					<button type="button" class="btn btn-light trailer_button">상세보기</button>
				</div>
			</div>
		</div>
	</div>
	<button class="carousel-control-prev" type="button"
		data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button"
		data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
	</button>
</div>
<!-- 트레일러 캐러셀 끝 -->
<!-- 무비차트/상영예정작 -->
<div class="movie_chart_wrap" style="background-color: #FDFDFB;">
	<div style="margin: auto;"
		class="container fixed-width contents movie_chart">
		<div class="movie_chart_button">
			<div class="movie_chart_tabButton">
				<h3>
					<a href="#">무비차트</a>
				</h3>
				<div style="background: lightgray; width: 2px;"></div>
				<h3>
					<a href="#">개봉예정작</a>
				</h3>
			</div>
		</div class="movie_chart_items">
		<div class="movie_chart_item"></div>
		<div></div>

	</div>
</div>