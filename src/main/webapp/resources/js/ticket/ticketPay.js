const prices = {'teenSeat' : 8000, 
					'adultSeat' : 10000, 
					'seniorSeat' : 6000,
					'event' : 5000};

const jerryDay = 15;

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
$(document).on('click', '.coupon--list--box > ul > li', function () {

	let couponCnt = parseInt($('.useCouponCnt').text());
	
	if($(this).hasClass('selected')){
		$(this).toggleClass('selected');
		$(this).find('.check').toggleClass('show');
		$(this).find('.uncheck').toggleClass('show');
	
		couponCnt -= 1;
		
		$('.useCouponCnt').text(couponCnt);
		
		useCoupon(couponCnt);

	}else{
		const couponMax = parseInt($('#couponMax').attr('value'));
		
		if(couponCnt < couponMax){

		    $(this).toggleClass('selected');
		    $(this).find('.check').toggleClass('show');
			$(this).find('.uncheck').toggleClass('show');
				
			couponCnt += 1;
			
			$('.useCouponCnt').text(couponCnt);
			
			useCoupon(couponCnt);

		}else{
			alert('최대사용수 초과함');
		}
	}
	
	
})


// 쿠폰 사용
function useCoupon(couponCnt){
	
	let teens = parseInt($('#ticketTeen').attr('value'));
	let adults = parseInt($('#ticketAdult').attr('value'));
	let seniors = parseInt($('#ticketSenior').attr('value'));
	
	let discountPrice = 0;
	console.log(discountPrice);
	const ticketPrice = parseInt($('.ticket--price').text().replace(/,/g, ''));
	
	// 제리의 날 체크
	const date = $('#screenDate').val();
	const day = parseInt(date.slice(-2));
	
	for(let i = 0; i < couponCnt; i++){
		
		if(day === jerryDay){
			discountPrice += prices.event;
		}else{
			if(adults){
				discountPrice += prices.adultSeat;
				adults--;
			}else if(teens){
				discountPrice += prices.teenSeat;
				teens--;
			}else if(seniors){
				discountPrice += prices.seniorSeat;
				seniors--;
			}
		}
	}
	
	// 카드 할인 적용
	const discountRate = $('.card--type--wrap > li.selected').attr('discountRate');
	
	if(discountRate){
		discountPrice += ticketPrice * (discountRate / 100);
	}
	discountPrice = discountPrice > ticketPrice ? ticketPrice : discountPrice;
	
	const totalPrice = ticketPrice - discountPrice;
	
	$('.discount--price').text(discountPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('.total--price').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('.pay--discount').text(discountPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('.pay--totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}

// 결제 타입 클릭 시
$(document).on('click', '.pay--type--btn', function () {

	$('.pay--type--btn').removeClass('selected');
	$(this).addClass('selected');
	
	if($(this).find('span').length > 0){
		$('.card--type--wrap').addClass('show');
	}else{
		$('.card--type--wrap').removeClass('show');
		$('.card--type--wrap > li').removeClass('selected');
	}
})


// 은행 선택 시
$(document).on('click', '.card--type--wrap > li', function () {

	$('.card--type--wrap > li').removeClass('selected');
	$(this).addClass('selected');

	let couponCnt = parseInt($('.useCouponCnt').text());
	useCoupon(couponCnt);
})


