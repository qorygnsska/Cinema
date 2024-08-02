$(document).ready(function() {
            $('.center').slick({
                centerMode: true,
                centerPadding: '60px',
                slidesToShow: 3,
                autoplay: true,           // 자동 재생 활성화
                autoplaySpeed: 2000,      // 자동 재생 간격 (2.5초)
                arrows: true,             // 화살표 표시
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
        
        