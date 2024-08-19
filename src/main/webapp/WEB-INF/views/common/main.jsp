<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<link href="${path}/resources/css/main/main.css" rel="stylesheet" />
<script src="${path}/resources/js/main/main.js" defer></script>

<title>JERRY MOVIE</title>
</head>
<body>

	<section>
		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

		<!-- 트레일러 캐러셀 -->
		<div id=carouselExampleCaptions class="carousel slide main--tr"
			data-bs-ride="carousel">
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
						loop="loop"
						src="${path}/resources/img/movie/teaser/${trailerList[0].movieTrailer}"
						class="d-block w-100" id="main--tr--video">
					</video>
					<div class="main--tr--fadeout--box">
						<div class="main--tr--fadeout--details">
							<h5 class="main--tr--details--title">${trailerList[0].movieTitle}</h5>
							<p class="main--tr--details--content">
								<c:choose>
									<c:when test="${trailerList[0].movieAgeLimit eq 'All'}">
								전체 이용가
								</c:when>
									<c:otherwise>
								${trailerList[0].movieAgeLimit}세 이용가
								</c:otherwise>
								</c:choose>
								<br> ${trailerList[0].movieGenre}
							</p>
							<button type="button" class="btn btn-light"
								onclick="location.href='${path}/movieDetail?movieNo=${trailerList[0].movieNo}'"
								id="main--tr--detailBtn">상세보기</button>
						</div>
					</div>
				</div>

				<c:forEach items="${trailerList}" begin="1" var="trailer">
					<div class="carousel-item" id="main--tr--carousel--item">
						<video type="video/mp4" autoplay="autoplay" muted="muted"
							loop="loop"
							src="${path}/resources/img/movie/teaser/${trailer.movieTrailer}"
							class="d-block w-100" id="main--tr--video">
						</video>
						<div class="main--tr--fadeout--box">
							<div class="main--tr--fadeout--details">
								<h5 class="main--tr--details--title">${trailer.movieTitle}</h5>
								<p class="main--tr--details--content">
									<c:choose>
										<c:when test="${trailer.movieAgeLimit eq 'All'}">
								전체 이용가
								</c:when>
										<c:otherwise>
								${trailer.movieAgeLimit}세 이용가
								</c:otherwise>
									</c:choose>
									<br> ${trailer.movieGenre}
								</p>
								<button type="button" class="btn btn-light"
									onclick="location.href='${path}/movieDetail?movieNo=${trailer.movieNo}'"
									id="main--tr--detailBtn">상세보기</button>
							</div>
						</div>
					</div>
				</c:forEach>

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
						<h2>
							<a id="main--moviechart--chartBtn" style="color: black; cursor: pointer;">무비차트</a>
						</h2>
						<div id="main--moviechart--sideBar"></div>
						<h2>
							<a id="main--moviechart--upcoming"
								style="color: lightgray; cursor: pointer;">상영예정작</a>
						</h2>
					</div>
					<div class="main--moviechart--tabBtn--all">
						<button type="button" style="border-radius: 25px;"
							onclick="movieInfo()" class="btn btn-outline-dark">전체 보기</button>
					</div>
				</div>

			</div>

			<div class="slider center" id="main--moviechart--carousel">
				<c:forEach varStatus="status" items="${movieChartList}" var="item">
					<div class="slide-item" id="main--moviechart--carousel--item">
						<img
							src="${path}/resources/img/movie/poster/${item.movieMainImage}"
							alt="${item.movieTitle}" class="main--chart--slide--img">
						<h5 class="main--chart--rank">${status.index+1}위
							${item.movieTitle}</h5>
						<c:if test="${item.movieAgeLimit == 'All'}">
							<img class="main--chart--AgeImg"
								src="${path}/resources/img/ticket/Image_Age_All.png"
								alt="${movieAgeLimit}">
						</c:if>
						<c:if test="${item.movieAgeLimit == '12'}">
							<img class="main--chart--AgeImg"
								src="${path}/resources/img/ticket/Image_Age_12.png"
								alt="${movieAgeLimit}">
						</c:if>
						<c:if test="${item.movieAgeLimit == '15'}">
							<img class="main--chart--AgeImg"
								src="${path}/resources/img/ticket/Image_Age_15.png"
								alt="${movieAgeLimit}">
						</c:if>
						<c:if test="${item.movieAgeLimit == '19'}">
							<img class="main--chart--AgeImg"
								src="${path}/resources/img/ticket/Image_Age_19.png"
								alt="${movieAgeLimit}">
						</c:if>


						<div class="main--moviechart--carousel--overlay"
							onclick="location.href='${path}/movieDetail?movieNo=${item.movieNo}'"
							style="cursor: pointer;">
							<div class="main--moviechart--carousel--overlay--content">
								<h3>${item.movieTitle}</h3>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- 무비차트/상영예정작 끝 -->

		<!-- 이벤트 배너 -->
		<div class="main--banner--Wrap">
			<div class="main--moviechart--button">
				<div class="main--event--tabBtn">
					<div class="main--moviechart--tabBtn--select">
						<h2>EVENT</h2>
					</div>
				</div>

			</div>
			<div class="main--banner--event--Wrap">
				<div class="main--banner--event main--event--card">
					<div class="main--event--Tab">
						<h3>진행중인 이벤트</h3>
						<button type="button" style="border-radius: 25px;"
							class="btn btn-outline-dark"
							onclick="location.href='${path}/eventList'">전체 보기</button>
					</div>

					<div class="main--event--items">
						<c:forEach items="${eventList}" var="event">
							<a href="${path}/eventDetail?eventNo=${event.eventNo}">
								<div class="main--event--item">
									<img alt="${event.eventNo}"
										src="${path}/resources/img/event/${event.eventTitleImage}"
										class="main--event--img">
									<div class="main--event--content">
										<span>${event.eventName}</span>
									</div>
								</div>
							</a>
						</c:forEach>
					</div>
				</div>
				<div class="main--banner--event main--event--stamp">
					<div class="main--event--Tab">
						<h3>스탬프</h3>

						<c:if test="${sessionId != null && admin == null}">
							<button type="button" style="border-radius: 25px;"
								class="btn btn-outline-dark"
								onclick="location.href='${path}/myStamp'">MY COUPON</button>
						</c:if>
					</div>

					<div class="main--event--items" id="main--stamp--Wrap">
						<div class="myStamp--stampinfo" id="main--stamp">
							<c:if test="${sessionId == null && admin == null}">
								<div class="main--stamp--needLogin">
									<div class="main--stamp--needLogin--input">
										<h5>회원 로그인 후</h5>
										<h5>이용 가능합니다.</h5>
										<button type="button" id="main--stamp--loginBtn"
											onclick="location.href='${path}/login'"
											style="border-radius: 25px;" class="btn btn-outline-dark">회원
											로그인</button>
									</div>
								</div>
							</c:if>
							<c:if test="${sessionId != null && admin != null}">
								<div class="main--stamp--needLogin">
									<div class="main--stamp--needLogin--input">
										<h5>고객 회원만</h5>
										<h5>사용 가능한 메뉴입니다.</h5>
									</div>
								</div>
							</c:if>
							<table class="myStamp--table" id="main--stamp--table">
								<!-- 스탬프 반복문 -->
								<c:forEach var="row" begin="0" end="2">
									<tr>
										<c:forEach var="col" begin="0" end="2">
											<td><c:choose>
													<c:when test="${row * 3 + col < member.memberStamp}">
														<img src="${path}/resources/img/mypageimg/후스탬프.png"
															alt="Stamp Image" class="myStamp--stampimg">
													</c:when>
													<c:otherwise>
														<img src="${path}/resources/img/mypageimg/전스탬프.png"
															alt="Stamp Image" class="myStamp--stampimg">
													</c:otherwise>
												</c:choose></td>
										</c:forEach>
									</tr>
								</c:forEach>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>

		<script>
		/* 개봉예정작 */
		$('#main--moviechart--upcoming').click(()=>{
			let movieChartBtn = $('#main--moviechart--chartBtn');
			movieChartBtn.css('color', 'lightgray');
			$('#main--moviechart--upcoming').css('color', 'black');
			
			$.ajax({
				method : 'GET',
				url : '${path}/movieCharts?name=scheduledRelease',
				contentType : 'application/json',
				dataType : 'json',
				success : (result)=>{
		            if ($('.slider').hasClass('slick-initialized')) {
		                $('.slider').slick('unslick');
		            }
		            $('.slider').empty();
		            
		            result.forEach(function(movie, index) {
		            	/* 디데이 계산 */
		            	var movieTimeStamp = movie.movieStartDate;
		            	var today = new Date();
		            	var movieDate = new Date(movieTimeStamp);
		            	var day = movieDate - today;
		            	var Dday = Math.floor(day / (1000 * 60 * 60 * 24));
		            	
		            	/* 연령제한 */
		            	var age = movie.movieAgeLimit;
		            	console.log(age);
		            	
		            	/* var = $('<img>') */
		            	
		            	if(age == 'ALL'){
		            		
		            	} else if(age == '12') {
		            		
		            	}
		            	 else if(age == '15') {
		            		
		            	}
		            	 else {
		            		
		            	}
		            	
		            	
		            	idx = index+1;
		                var imgElement = $('<img>').attr('src', '${path}/resources/img/movie/poster/' + movie.movieMainImage)
		                                           .attr('alt', movie.movieTitle)
		                                           .addClass('main--chart--slide--img');
		                
		                var Ddays = $('<span>').text(Dday);
		                
		                var rank = $('<h5>').addClass('main--chart--rank')
		                					.text('D - ')
		                					.append(Ddays);
		                
		                var overlayContent = $('<div>').addClass('main--moviechart--carousel--overlay--content')
		                                               .append($('<h3>').text(movie.movieTitle));
		                
		                var overlay = $('<div>').addClass('main--moviechart--carousel--overlay')
		                                        .append(overlayContent)
												.attr('onclick', 'location.href="${path}/movieDetail?movieNo=' + movie.movieNo + '"')
		                                        .css('cursor', 'pointer');
		                
		                var ageLimit = $('<img>').addClass('main--chart--AgeImg')
												.attr('alt', movie.movieAgeLimit)
						if(movie.movieAgeLimit == "All"){
							ageLimit.attr('src', '${path}/resources/img/ticket/Image_Age_All.png');
						} else if(movie.movieAgeLimit == "12"){
							ageLimit.attr('src', '${path}/resources/img/ticket/Image_Age_12.png');
						} else if(movie.movieAgeLimit == "15"){
							ageLimit.attr('src', '${path}/resources/img/ticket/Image_Age_15.png');
						} else {
							ageLimit.attr('src', '${path}/resources/img/ticket/Image_Age_19.png');
						}
		                
		                var slideItem = $('<div>').addClass('slide-item')
		                                          .append(imgElement)
		                                          .append(rank)
		                                          .append(ageLimit)
		                                          .append(overlay);
		                
		                $('.slider').append(slideItem);
		            });
		            $('.center').slick({
		                centerMode: true,
		                centerPadding: '60px',
		                slidesToShow: 3,
		                autoplay: true,     
		                autoplaySpeed: 2500,   
		                arrows: true,       
		                responsive: [
		                    {
		                        breakpoint: 768,
		                        settings: {
		                            arrows: false,
		                            centerMode: true,
		                            centerPadding: '40px',
		                            slidesToShow: 3
		                        }
		                    },
		                    {
		                        breakpoint: 480,
		                        settings: {
		                            arrows: false,
		                            centerMode: true,
		                            centerPadding: '40px',
		                            slidesToShow: 1
		                        }
		                    }
		                ]
		            });
				},
				
			});
			
			
		});
		
		
		
		
		
		/* 무비차트 */
		$('#main--moviechart--chartBtn').click(()=>{
			let upcomingChartBtn = $('#main--moviechart--upcoming');
			upcomingChartBtn.css('color', 'lightgray');
			$('#main--moviechart--chartBtn').css('color', 'black');
			
			$.ajax({
				method : 'GET',
				url : '${path}/movieCharts',
				contentType : 'application/json',
				dataType : 'json',
				success : (result)=>{
		            if ($('.slider').hasClass('slick-initialized')) {
		                $('.slider').slick('unslick');
		            }
		            $('.slider').empty();

		            result.forEach(function(movie, index) {
		            	idx = index+1;
		                var imgElement = $('<img>').attr('src', '${path}/resources/img/movie/poster/' + movie.movieMainImage)
		                                           .attr('alt', movie.movieTitle)
		                                           .addClass('main--chart--slide--img');
		                
		                var indexText = $('<span>').text('위 ');
		                
		                var movieTitle = $('<span>').text(movie.movieTitle);
		                
		                var rank = $('<h5>').addClass('main--chart--rank')
		                					.text(idx)
		                					.append(indexText)
		                					.append(movieTitle);
		                
		                var overlayContent = $('<div>').addClass('main--moviechart--carousel--overlay--content')
		                                               .append($('<h3>').text(movie.movieTitle));
		                
		                var overlay = $('<div>').addClass('main--moviechart--carousel--overlay')
		                                        .append(overlayContent)
												.attr('onclick', 'location.href="${path}/movieDetail?movieNo=' + movie.movieNo + '"')
		                                        .css('cursor', 'pointer');
		                
		                var ageLimit = $('<img>').addClass('main--chart--AgeImg')
		                						.attr('alt', movie.movieAgeLimit)
		                if(movie.movieAgeLimit == "All"){
		                	ageLimit.attr('src', '${path}/resources/img/ticket/Image_Age_All.png');
		                } else if(movie.movieAgeLimit == "12"){
		                	ageLimit.attr('src', '${path}/resources/img/ticket/Image_Age_12.png');
		                } else if(movie.movieAgeLimit == "15"){
		                	ageLimit.attr('src', '${path}/resources/img/ticket/Image_Age_15.png');
		                } else {
		                	ageLimit.attr('src', '${path}/resources/img/ticket/Image_Age_19.png');
		                }
		                
		                var slideItem = $('<div>').addClass('slide-item')
		                                          .append(imgElement)
		                                          .append(rank)
		                                          .append(ageLimit)
		                                          .append(overlay);
		                
		                	
		                $('.slider').append(slideItem);
		            });
		            
		            $('.center').slick({
		                centerMode: true,
		                centerPadding: '60px',
		                slidesToShow: 3,
		                autoplay: true,     
		                autoplaySpeed: 2500,   
		                arrows: true,       
		                responsive: [
		                    {
		                        breakpoint: 768,
		                        settings: {
		                            arrows: false,
		                            centerMode: true,
		                            centerPadding: '40px',
		                            slidesToShow: 3
		                        }
		                    },
		                    {
		                        breakpoint: 480,
		                        settings: {
		                            arrows: false,
		                            centerMode: true,
		                            centerPadding: '40px',
		                            slidesToShow: 1
		                        }
		                    }
		                ]
		            });
				},
				
			});
			
			
		});
		
		function movieInfo() {
			const reserveTopBtnColor = $('#main--moviechart--chartBtn').css('color');
			
			if(reserveTopBtnColor === 'rgb(0, 0, 0)'|| reserveTopBtnColor === '#000000' || reserveTopBtnColor === 'black'){
				window.location.href='${path}/movieList?sort=reservation';
			} else {
				window.location.href='${path}/movieList?select=Upcoming';
			}
		}
		
		</script>

	</section>
</body>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>