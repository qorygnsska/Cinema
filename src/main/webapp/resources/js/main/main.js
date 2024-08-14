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
            
            
     $('#main--moviechart--chartBtn').css('color', 'black');
				$('#main--moviechart--upcoming').css('color', 'lightgray');

				$('#main--moviechart--chartBtn').click(function() {
					$(this).css('color', 'black');
					$('#main--moviechart--upcoming').css('color', 'lightgray');
				});

				$('#main--moviechart--upcoming').click(function() {
					$(this).css('color', 'black');
					$('#main--moviechart--chartBtn').css('color', 'lightgray');
				});
				
				
				
				
				
				
				
				
            // 버튼 클릭 시 AJAX로 데이터 로드
    $('#main--moviechart--upcoming').click(function(event) {
        event.preventDefault();  // 기본 링크 동작 방지
        
        var url = $(this).data('url'); // 클릭한 링크의 URL 가져오기
        
        $.ajax({
            url: url,
            method: 'GET',
            success: function(data) {
                // 데이터가 성공적으로 로드되면 Slick Slider 업데이트
                var carouselHtml = '';
                $.each(data, function(index, item) {
                    carouselHtml += '<div class="slide-item" id="main--moviechart--carousel--item">';
                    carouselHtml += '<img src="' + item.imageUrl + '" alt="' + item.movieTitle + '">';
                    carouselHtml += '<div class="main--moviechart--carousel--overlay" onclick="location.href=\'${path}/movieDetail?movieNo=' + item.movieNo + '\'">';
                    carouselHtml += '<div class="main--moviechart--carousel--overlay--content">';
                    carouselHtml += '<h3>' + item.movieTitle + '</h3>';
                    carouselHtml += '</div></div></div>';
                });
                
                
                **<div class="slide-item" id="main--moviechart--carousel--item">
					<img src="${path}/resources/img/mypageimg/도그데이즈.jpg" alt="Slide 4">
					<div class="main--moviechart--carousel--overlay">
						<div class="main--moviechart--carousel--overlay--content">
							<h3>영화 제목</h3>
							<button type="button">상세 보기</button>
						</div>
					</div>
				</div>
				**
				
				

                $('#main--moviechart--carousel').html(carouselHtml);

                // Slick Slider 재초기화
                $('.center').slick('unslick');
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
            }
        });
    });
    
    
    
    
    
  
        });
        