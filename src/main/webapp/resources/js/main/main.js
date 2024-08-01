$(document).ready(function() {
            $('.center').slick({
                centerMode: true,
                centerPadding: '60px',
                slidesToShow: 3,
                autoplay: true,           // 자동 재생 활성화
                autoplaySpeed: 3000,      // 자동 재생 간격 (2.5초)
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
        });
        
        
        
        