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
	$('#paymentPrice').val(totalPrice.toString());
}

// 결제 타입 클릭 시
$(document).on('click', '.pay--type--btn', function () {

	$('.pay--type--btn').removeClass('selected');
	$(this).addClass('selected');
	$('#cardNo').val($(this).attr('cardNo'));
	$('#paymentType').val($(this).attr('name'));
	
	let couponCnt = parseInt($('.useCouponCnt').text());
	useCoupon(couponCnt);
})

// 결제 클릭 시
$(document).on('click', '.pay--btn', function() {

	// 결제 타입 선택했는지 확인
	const paymentType = $('#paymentType').val();
	if(!(paymentType.length > 0)){
		alert('결제타입을 선택해주세요');
		return;
	}

	const today = new Date();
	$('#paymentDate').val(today.getTime());
	
	
	const payType = $('.pay--type--btn.selected').attr('name');
	const movieTitle = $('#movieTitle').val();
	const totalPrice = $('#totalPrice').val();
	const memberId = $('#memberId').val();
	const memberName = $('#memberName').val();
	const memberEmail = $('#memberEmail').val();
	const memberPhone = $('#memberPhone').val();
	
	
	
	const payInfo = {
						'movieTitle' : movieTitle,
						'totalPrice' : totalPrice,
						'memberId' : memberId,
						'memberName' : memberName,
						'memberEmail' : memberEmail,
						'memberPhone' : memberPhone,
						'today' : today.getTime()
					 };
	
	
	if(parseInt(totalPrice) > 0){
		
		// 신용카드 or 카카오페 체크
		if(paymentType === "신용카드"){
	
		}else if(paymentType === "카카오페이"){
			kakaoPay(payInfo);
		}
	}else{
		insertTicket();
	}
	
})



function kakaoPay(payInfo) {

	const IMP = window.IMP;
    IMP.init("imp67745024"); // 가맹점 식별코드
    
	
	const makeMerchantUid = payInfo.today;


    IMP.request_pay({
        pg: 'kakaopay.TC0ONETIME', // PG사 코드표에서 선택
        pay_method: 'card', // 결제 방식
        merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
        name: payInfo.movieTitle, // 제품명
        amount: payInfo.totalPrice, // 가격
        //구매자 정보 ↓
        buyer_email: payInfo.memberEmail,
        buyer_name: payInfo.memberName,
        buyer_tel : payInfo.memberPhone,
    }, function (rsp) {
        if (rsp.success) {
	      	console.log(rsp);
	      	insertTicket();
	    } else {
	      alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
	    }
    });
}



function insertTicket(){

	const leftSeatNum = $('#leftSeatNum').val();
	const theaterNo = $('#theaterNo').val();
	const cardNo = $('#cardNo').val();
	const paymentType = $('#paymentType').val();
	const paymentDate = $('#paymentDate').val();
	const paymentPrice = $('#paymentPrice').val();
	const memberId = $('#memberId').val();
	const movieNo = $('#movieNo').val();
	const cinemaNo = $('#cinemaNo').val();
	const ticketTeen = $('#ticketTeen').val();
	const ticketAdult = $('#ticketAdult').val();
	const ticketSenior = $('#ticketSenior').val();
	
	const insertMap = {
						'leftSeatNum' : leftSeatNum,
						'theaterNo' : theaterNo,
						'cardNo' : cardNo,
						'paymentType' : paymentType,
						'paymentDate' : paymentDate,
						'paymentPrice' : paymentPrice,
						'memberId' : memberId,
						'movieNo' : movieNo,
						'cinemaNo' : cinemaNo,
						'ticketTeen' : ticketTeen,
						'ticketAdult' : ticketAdult,
						'ticketSenior' : ticketSenior			
	};
	
	
	$.ajax({
	        url: "insertTicket",
	        type: "POST",
	        data: JSON.stringify(insertMap),
	        contentType: 'application/json',
	        success: function (data) {
<<<<<<< HEAD
	        	window.open(data.nexturl, 'kakaoPayResult', 'width=800,height=600,scrollbars=yes');
=======
		        
			    window.location.href = '/cinema/ticket/ticketEnd';
			       
>>>>>>> 789661a533ab20125cce215827089cca0f0d6db5
	        },
	        error: function () {
	            console.log("ajax 처리 실패");
	        }
	    });

}