const prices = {'teenSeat' : 8000, 
					'adultSeat' : 10000, 
					'seniorSeat' : 7000,
					'event' : 5000};

const jerryDay = 24;

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
										<span class="coupon--name">영화 관람권</span>
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
		$('#useCouponCnt').val(couponCnt);
		
		useCoupon(couponCnt);

	}else{
		const couponMax = parseInt($('#couponMax').attr('value'));
		
		if(couponCnt < couponMax){

		    $(this).toggleClass('selected');
		    $(this).find('.check').toggleClass('show');
			$(this).find('.uncheck').toggleClass('show');
				
			couponCnt += 1;
			
			$('.useCouponCnt').text(couponCnt);
			$('#useCouponCnt').val(couponCnt);
			
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

	discountPrice = discountPrice > ticketPrice ? ticketPrice : discountPrice;
	
	const totalPrice = ticketPrice - discountPrice;
	
	$('.left--discount--price').text(discountPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('.left--total--price').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('.pay--discount').text(discountPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('.pay--totalPrice').text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	$('#totalPrice').val(totalPrice.toString());
	$('#paymentPrice').val(totalPrice.toString());
}


// 결제 클릭 시
$(document).on('click', '.pay--btn', function() {

	// 결제 고유 번호 생성
	const today = new Date();
	const makeMerchantUid = 'IMP' + today.getTime();
	$('#paymentDate').val(today.getTime());
	
	// 넘길 데이터
	const name = $('#movieTitle').val();
	const amount = $('#totalPrice').val();
	const buyer_name = $('#memberName').val();
	const buyer_email = $('#memberEmail').val();
	const buyer_tel = $('#memberPhone').val();	
	
	const payInfo = {
						'pg' : 'html5_inicis.INIpayTest',
						'name' : name,
						'amount' : amount,
						'buyer_name' : buyer_name,
						'buyer_email' : buyer_email,
						'buyer_tel' : buyer_tel,
						'makeMerchantUid' : makeMerchantUid
					 };
	
	// 가격 확인
	if(parseInt(amount) > 0){
		iamportAPI(payInfo)
	}else{
		insertTicket("coupon","쿠폰사용");
	}
})


// 아임포트 API
function iamportAPI(payInfo) {

	const IMP = window.IMP;
	
	// 가맹점 식별코드
    IMP.init("imp67745024"); 
    
    IMP.request_pay({
    
        pg: payInfo.pg, // PG사 코드표에서 선택
        pay_method: 'card', // 결제 방식
        merchant_uid: payInfo.makeMerchantUid, // 결제 고유 번호
        name: payInfo.name, // 제품명
        amount: payInfo.amount, // 가격
        buyer_email: payInfo.buyer_email,
        buyer_name: payInfo.buyer_name,
        buyer_tel : payInfo.buyer_tel,
        
    }, function (rsp) {
    	
        if (rsp.success) {
        
        	// 결제 검증
        	$.ajax({
	        	type : "POST",
	        	url : "/cinema/verifyIamport/" + rsp.imp_uid 
	        }).done(function(data) {
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){

		        	insertTicket(rsp.imp_uid, data.response.cardName);
		        	
	        	} else {
	        		alert(`결제에 실패하였습니다.`);
	        		canclePay(rsp.imp_uid);
	        	}
	        });
	    } else {
	      alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
	    }
    });
}


function canclePay(imp_uid){

	$.ajax({
	        url: "/cinema/canclePay/" + imp_uid,
	        type: "POST",   
			success: function (data) {
				
	        },
	        error: function () {
	           console.log("ajax 처리 실패");
	        }
	    });
}


// 데이터 저장
function insertTicket(imp_uid, card_name){

	const leftSeatNum = $('#leftSeatNum').val();
	const theaterNo = $('#theaterNo').val();
	const paymentType = card_name;
	const paymentDate = $('#paymentDate').val();
	const paymentPrice = $('#paymentPrice').val();
	const memberId = $('#memberId').val();
	const movieNo = $('#movieNo').val();
	const cinemaNo = $('#cinemaNo').val();
	const ticketTeen = $('#ticketTeen').val();
	const ticketAdult = $('#ticketAdult').val();
	const ticketSenior = $('#ticketSenior').val();
	const cinemaLocation = $('#cinemaLocation').val();
	const cinemaBLG = $('#cinemaBLG').val();
	const useCouponCnt = $('#useCouponCnt').val();
	
	
	
	const insertMap = {
						'leftSeatNum' : leftSeatNum,
						'theaterNo' : theaterNo,
						'paymentType' : paymentType,
						'paymentDate' : paymentDate,
						'paymentPrice' : paymentPrice,
						'memberId' : memberId,
						'movieNo' : movieNo,
						'cinemaNo' : cinemaNo,
						'ticketTeen' : ticketTeen,
						'ticketAdult' : ticketAdult,
						'ticketSenior' : ticketSenior,
						'useCouponCnt' : useCouponCnt,	
						'imp_uid' : imp_uid
	};
	
	
	const seatCnt = checkSeat(insertMap);
	

	if(seatCnt > 0){
	
		canclePay(imp_uid);
		
		const movieTitle = $('#movieTitle').val();
		const movieMainImage = $('#movieMainImage').val();
		const movieAgeLimit = $('#movieAgeLimit').val();
		const cinemaBLG = $('#cinemaBLG').val();
		const cinemaLocation = $('#cinemaLocation').val();
		const screenDate = $('#screenDate').val();
		const theaterTime = $('#theaterTime').val();
		
		// 좌석 선택화면으로 가기
		$('.pay--inform--blush').addClass('show');
		$('.pay--inform--container').addClass('show');
		$('.pay--inform--content--box').html("이미 예약된 좌석입니다.<br>좌석 선택화면으로 돌아갑니다");
	}else{
		$.ajax({
		        url: "insertTicket",
		        type: "POST",
		        data: JSON.stringify(insertMap),
		        async: false,
		        contentType: 'application/json',
		        success: function (data) {
					// 결제완료 화면으로 가기
			        window.location.href = `/cinema/ticket/ticketEnd`;
		        },
		        error: function () {
		            console.log("ajax 처리 실패");
		        }
		    });
		
	}
}


function checkSeat(insertMap){
	
	let seatCnt = 0;
	
	$.ajax({
	        url: "checkSeat",
	        type: "POST",
	        data: JSON.stringify(insertMap),
	        contentType: 'application/json',
	        async: false,
	        success: function (data) {
				console.log('data', data);
				seatCnt = data;
	        },
	        error: function () {
	            console.log("ajax 처리 실패");
	        }
	    });
	
	console.log('seatCnt',seatCnt);
	return seatCnt;

}


