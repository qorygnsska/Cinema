<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<!-- Slick JS 라이브러리 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
<!-- Slick CSS -->
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css" />
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://kit.fontawesome.com/31d16c06da.js"
	crossorigin="anonymous"></script>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<link href="${path}/resources/css/main/main.css" rel="stylesheet" />

<title>JERRY MOVIE</title>
</head>
<body>
	<section>
		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

		<!-- 트레일러 캐러셀 -->
		<div id=carouselExampleCaptions class="carousel slide main--tr">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleCaptions"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner" id="main--tr--carousel--inner">
				<div class="carousel-item active" id="main--tr--carousel--item">
					<video type="video/mp4" autoplay="autoplay" muted="muted"
						loop="loop" src="${path}/resources/img/main/임시_10라이브즈예고편.mp4"
						class="d-block w-100" id="main--tr--video">
					</video>
					<div class="main--tr--fadeout--box">
						<div class="main--tr--fadeout--details">
							<h5 class="main--tr--details--title">10라이브즈</h5>
							<p class="main--tr--details--content">
								엉뚱한 동물로 또 다시 태어난다고?!<br> 배우 소유진 강력 추천 영화!
							</p>
							<button type="button" class="btn btn-light"
								id="main--tr--detailBtn">상세보기</button>
						</div>
					</div>
				</div>
				<div class="carousel-item" id="main--tr--carousel--item">
					<video type="video/mp4" autoplay="autoplay" muted="muted"
						loop="loop" src="${path}/resources/img/main/임시_극장총집편예고편.mp4"
						class="d-block w-100" id="main--tr--video">
					</video>
					<div class="main--tr--fadeout--box">
						<div class="main--tr--fadeout--details">
							<h5 class="main--tr--details--title">극장총집편 봇치 더 록! 전편</h5>
							<p class="main--tr--details--content">
								결속밴드! CGV에서 다시 결속!<br> 8월 7일 대개봉
							</p>
							<button type="button" class="btn btn-light"
								id="main--tr--detailBtn">상세보기</button>
						</div>
					</div>
				</div>
				<div class="carousel-item" id="main--tr--carousel--item">
					<video type="video/mp4" autoplay="autoplay" muted="muted"
						loop="loop" src="${path}/resources/img/main/임시_파일럿예고편.mp4"
						class="d-block w-100" id="main--tr--video">
					</video>
					<div class="main--tr--fadeout--box">
						<div class="main--tr--fadeout--details">
							<h5 class="main--tr--details--title">파일럿</h5>
							<p class="main--tr--details--content">
								웃음 공감 다잡은<br> 일등석 코미디
							</p>
							<button type="button" class="btn btn-light"
								id="main--tr--detailBtn">상세보기</button>
						</div>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
			</button>
		</div>
		<!-- 트레일러 캐러셀 끝 -->

		<!-- 무비차트/상영예정작 -->
		<div class="main--moviechart--wrap">
			<div class="main--moviechart--button">
				<div class="main--moviechart--tabBtn">
					<div class="main--moviechart--tabBtn--select">
						<h3>
							<a href="#">무비차트</a>
						</h3>
						<div id="main--moviechart--sideBar"></div>
						<h3>
							<a href="#">개봉예정작</a>
						</h3>
					</div>
					<div class="main--moviechart--tabBtn--all">
						<button type="button" style="border-radius: 25px;"
							class="btn btn-warning">전체 보기</button>
					</div>
				</div>

			</div>

			<div class="slider center" id="main--moviechart--carousel">
				<!-- 이미지를 순서에 맞게 배치 -->
				<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/결백.jpg" alt="Slide 1">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
				<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/그녀가죽었다.jpg" alt="Slide 2">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
				<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/달짝지근해.jpg" alt="Slide 3">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
				<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/도그데이즈.jpg" alt="Slide 4">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
				<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/드림.jpg" alt="Slide 5">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
				<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/범죄도시4.jpg" alt="Slide 6">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
				<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/아바타.jpg" alt="Slide 7">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
				<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/오늘밤.jpg" alt="Slide 8">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
				<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/파묘.jpg" alt="Slide 9">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
				<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/하이재킹.jpg" alt="Slide 10">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 무비차트/상영예정작 끝 -->

		<!-- 이벤트 배너 -->
		<div class="main--banner--Wrap">
			<div class="main--moviechart--button">
				<div class="main--moviechart--tabBtn">
					<div class="main--moviechart--tabBtn--select">
						<h3>EVENT</h3>
					</div>
				</div>

			</div>
			<div class="main--banner--event--Wrap">
				<div class="main--banner--event main--event--card">
					<div class="main--event--Tab">
						<h3>제휴 할인</h3>
						<button type="button" style="border-radius: 25px;"
							class="btn btn-outline-dark">전체 보기</button>
					</div>

					<div class="main--event--items">
						<a href="">
							<div class="main--event--item">
								<img alt="이벤트사진"
									src="${path}/resources/img/main/제휴할인(kt)_임시.jpg"
									class="main--event--img">
								<div class="main--event--content">
									<span>2024년 KT멤버십 혜택!</span>
								</div>
							</div>
						</a> <a href="">
							<div class="main--event--item">
								<img alt="이벤트사진"
									src="${path}/resources/img/main/제휴할인(lg)_임시.jpg"
									class="main--event--img">
								<div class="main--event--content">
									<span>LGU+ VIP영화 무료! 영화 할인은 덤</span>
								</div>
							</div>
						</a> <a href="">
							<div class="main--event--item">
								<img alt="이벤트사진"
									src="${path}/resources/img/main/제휴할인(sk)_임시.jpg"
									class="main--event--img">
								<div class="main--event--content">
									<span>SKT 8월 T데이</span>
								</div>
							</div>
						</a>
					</div>
				</div>
				<div class="main--banner--event main--event--stamp">
					<div class="main--event--Tab">
						<h3>스탬프</h3>
						<button type="button" style="border-radius: 25px;"
							class="btn btn-outline-dark"
							onclick="location.href='${path}/myStamp'">MY COUPON</button>
					</div>

					<div class="main--event--items">
						
						<!-- 스탬프 자리 -->
						
						
					</div>
				</div>
			</div>
		</div>




	</section>
</body>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>