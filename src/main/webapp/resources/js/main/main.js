$(document).ready(function() {
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
            
            
            
            
            
            
                        // 부트스트랩 캐러셀 초기화
            $('#carouselExampleCaptions').carousel({
                interval: 4000 // 자동 재생 간격 설정 (4초)
            });

            // 슬라이드 변경 시 비디오를 처음부터 재생
            $('#carouselExampleCaptions').on('slid.bs.carousel', function(event) {
                // 현재 슬라이드에서 비디오 요소 선택
                var $currentSlide = $(event.relatedTarget); // 현재 슬라이드
                var $video = $currentSlide.find('video').get(0); // 비디오 요소
                
                if ($video) {
                    $video.currentTime = 0; // 비디오를 처음으로 되돌리기
                    $video.play(); // 비디오 재생
                }
            });
            
        });
        
        
        
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

		            result.forEach(function(movie) {
		                var imgElement = $('<img>').attr('src', '${path}/resources/img/movie/poster/' + movie.movieMainImage)
		                                           .attr('alt', movie.movieTitle);
		                
		                var overlayContent = $('<div>').addClass('main--moviechart--carousel--overlay--content')
		                                               .append($('<h3>').text(movie.movieTitle));
		                
		                var overlay = $('<div>').addClass('main--moviechart--carousel--overlay')
		                                        .append(overlayContent)
												.attr('onclick', 'location.href="${path}/movieDetail?movieNo=' + movie.movieNo + '"')
		                                        .css('cursor', 'pointer');
		                
		                var slideItem = $('<div>').addClass('slide-item')
		                                          .append(imgElement)
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
				error : (e)=>{
				console.log(e);
				}
				
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

		            result.forEach(function(movie) {
		                var imgElement = $('<img>').attr('src', '${path}/resources/img/movie/poster/' + movie.movieMainImage)
		                                           .attr('alt', movie.movieTitle);
		                
		                var overlayContent = $('<div>').addClass('main--moviechart--carousel--overlay--content')
		                                               .append($('<h3>').text(movie.movieTitle));
		                
		                var overlay = $('<div>').addClass('main--moviechart--carousel--overlay')
		                                        .append(overlayContent)
		                                        .attr('onclick', 'location.href="${path}/movieDetail?movieNo=' + movie.movieNo + '"')
		                                        .css('cursor', 'pointer');
		                
		                var slideItem = $('<div>').addClass('slide-item')
		                                          .append(imgElement)
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
				error : (e)=>{
				console.log(e);
				}
				
			});
			
			
		});