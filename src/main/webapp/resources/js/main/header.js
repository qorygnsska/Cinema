$(document).ready(function() {
    $(window).on('scroll', function() {
        if ($(this).scrollTop() > 315) {
            // 스크롤 위치가 임계값을 넘으면 '스크롤 헤더'를 표시하고 '기본 헤더'와 '내비게이션'을 숨깁니다.
            $('header').fadeOut(50); // 빠르게 사라지도록 설정
            $('nav').fadeOut(50);     // 빠르게 사라지도록 설정
            $('.header--scroll--wrap').addClass('show');
        } else {
            // 스크롤 위치가 임계값 이하이면 '기본 헤더'와 '내비게이션'을 표시하고 '스크롤 헤더'를 숨깁니다.
            $('header').fadeIn(50);  // 빠르게 나타나도록 설정
            $('nav').fadeIn(50);     // 빠르게 나타나도록 설정
            $('.header--scroll--wrap').removeClass('show');
        }
    });
});