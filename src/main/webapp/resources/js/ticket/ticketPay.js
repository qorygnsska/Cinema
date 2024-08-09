$(function(){

	$('.left--section').removeClass('selected');
	
	$('.left--menu--info').removeClass('selected');
	$('.left--menu--info').addClass('success');
	$('.left--section--menu').addClass('success');
	
	$('.left--section--seat').addClass('success');
	$('.left--seat--info').addClass('success');
	
	
	$('.left--section--pay').addClass('selected');
	$('.left--pay--info').addClass('selected');
	
	$('.left--menu--info > ul > li > div > i').addClass('show');
	$('.left--seat--info > ul > li > div > i').addClass('show');
	$('.left--seat--info > ul > li > div > i').addClass('show');
	$('.left--pay--info > ul > li > div > i').addClass('show');
	
});


// 쿠폰 클릭 시
$(document).on('click', '.coupon--list--box > ul > li', function (e) {
    $(this).find('.uncheck').toggleClass('show');
    $(this).find('.check').toggleClass('show');

})