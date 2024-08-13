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
	
	initView();
});


function initView(){

	const elCouponListItem = $('.coupon--list--item');
	const couponCnt = $('#memberCoupon').val();
	
	let input = "";

	for(let i = 0; i < couponCnt; i++){
		input += `
						<li>
							<button class='coupon--btn'>
								<div class='coupon--btn--box'>
									<div class='coupon--btn--title'>
										<span class="coupon--name">관람권</span>
										<span>(최대 1인까지 사용가능)</span>
									</div>
									
									<div>
										<i class='fa-regular fa-circle-check fa-xl uncheck show'></i>
										<i class='fa-solid fa-circle-check fa-xl check'></i>
									</div>
								</div>
							</button>
						</li>
						`;	
	}
	
	elCouponListItem.append(input);
}


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

	const ticketPrice = parseInt($('.left--ticket--price').text().replace(/,/g, ''));
	
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
	const discountRate = $('.pay--type--btn.selected').attr('discountRate');
	
	if(discountRate){
		discountPrice += ticketPrice * (discountRate / 100);
	}

	discountPrice = discountPrice > ticketPrice ? ticketPrice : discountPrice;
	
	const totalPrice = ticketPrice - discountPrice;
	
	$('.left--discount--price').text(discountPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('.left--total--price').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('.pay--discount').text(discountPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('.pay--totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('#totalPrice').val(totalPrice.toString());
}

// 결제 타입 클릭 시
$(document).on('click', '.pay--type--btn', function () {

	$('.pay--type--btn').removeClass('selected');
	$(this).addClass('selected');
	
	
	let couponCnt = parseInt($('.useCouponCnt').text());
	useCoupon(couponCnt);
})

// 결제 클릭 시
$(document).on('click', '.pay--btn', function () {

	const payType = $('.pay--type--btn.selected').attr('name');
	const movieTitle = $('#movieTitle').val();
	const totalPrice = $('#totalPrice').val();
	
	const payInfo = {
						'movieTitle' : movieTitle,
						'totalPrice' : totalPrice
					 };
	
	if(payType === "card"){
	
	}else if(payType === "kakao"){
	
		$.ajax({
	        url: "kakaoPay",
	        type: "POST",
	        data: JSON.stringify(payInfo),
	        contentType: 'application/json',
	        success: function (data) {
	        
	        },
	        error: function () {
	        	console.log(payInfo);
	            console.log("ajax 처리 실패");
	        }
	    });
	}
})



