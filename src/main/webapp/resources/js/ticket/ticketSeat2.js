const prices = {'teenSeat' : 8000, 
					'adultSeat' : 10000, 
					'seniorSeat' : 6000};


const leftSeatNum = $('#leftSeatNum');
const leftPerson = $('#leftPerson');

$(function(){

	$('.left--section').removeClass('selected');
	
	$('.left--menu--info').removeClass('selected');
	$('.left--menu--info').addClass('success');
	$('.left--section--menu').addClass('success');
	
	$('.left--section--seat').addClass('selected');
	$('.left--seat--info').addClass('selected');
	
	$('.left--menu--info > ul > li > div > i').addClass('show');


	// 예약된 좌석 데이터 가져오기
	let theater = {'theaterNo' : $('#theaterNo').attr('value')};
	$.ajax({
        url: "seatList",
        type: "POST",
        data: JSON.stringify(theater),
        contentType: 'application/json',
        success: function (data) {
        
        	seatView(data);
        },
        error: function () {
        	console.log(theaterNo2);
            console.log("ajax 처리 실패");
        }
    });
	
	personCntView();
	
	
});


// 인원선택 View(){
function personCntView(){
	const personTypeKo = ['청소년', '일반', '경로'];
	const personTypeEn = ['teen', 'adult', 'senior'];

	const ageLimit = $('#movieAgeLimit').attr('value');
	
	let value = 0;
	
	if(ageLimit == 19){
		value++;
	}
	
	for(value; value < personTypeKo.length; value++){

		let className = "person--count ";
		className += personTypeEn[value];

		
		let personCntInput = "<div class='" + className + "'>";
		personCntInput += "<span>" + personTypeKo[value] + "</span>";
		personCntInput += "<ul>";
		
		for(let j = 0; j <= 8; j++){
			let selectClass="";
			if(j == 0){
				selectClass = " selected";
			}
			personCntInput += "<li class='" + selectClass + "' type='" + personTypeEn[value] + "' Cnt='" + j + "'>";
			personCntInput += "<button class='person--btn'>" + j + "</button>";
			personCntInput += "</li>";
		}
		
		personCntInput += "</ul>";
		personCntInput += "</div>";	
		
		$('.screen--info--person').append(personCntInput);
	}
}



// 좌석 view
function seatView(seatList){

	const seat = $('div.seat');
	
	let startRow = 'A';
	let input = "";
	
	const rows = 10;
	const cols = 15;
	
	const seatMap = Array.from({ length: rows }, () => Array(cols).fill('Y'));
	
	for (const seat of seatList){
		seatMap[seat.seatRow][seat.seatCol] = 'N';
	}
	

	for(let row = 0; row < rows; row++){
		let rowNum = String.fromCharCode(startRow.charCodeAt(0) + row);
	
		input += "<div class='seat--row' style='top:" + (25*row) + "px;'>";
		input += "<div class='seat--row--name'>";
		input += "<span>"+ rowNum + "</span>";
		input += "</div>";
		input += "<div class='seat--group'>";
		
		let seatCol = 0;
		for(let col = 0; col < cols; col++){
			
			seatCol += 22;
			
			if((col == 3) || (col == 12)){
				seatCol = seatCol + 30;
			}else if (col != 0){
				seatCol = seatCol + 8;
			}
			
			
			
			let className = "seat--btn ";
			let disabled = "";
			if(seatMap[row][col] == 'Y'){
				className += "active";
			}else{
				className += "inactive";
				disabled = "disabled";
			}
			
			
			input += "<button style='left:" + seatCol + "px;' class='" + className 
					+ "' seat='" + rowNum + (col +1) + "' " + disabled + ">";
					
			
			input += (col +1);
			input += "</button>";
						
			
		} 
		input += "</div>";
		input += "</div>";	
	}
	
	seat.append(input);
}



// 청소년 인원수 클릭 시
$(document).on('click', '.teen > ul > li', function (){


	if (!$(this).hasClass('selected')){
		$('.teen > ul > li').removeClass('selected');
		$(this).addClass('selected');
		
		const teenNum = $('.teen > ul > li.selected').attr('cnt');
		
		if(teenNum == 0){
			$('#ticketTeen').attr('value','');
		}else{
			$('#ticketTeen').attr('value',teenNum);
		}
		
		
		
		leftPersonCtnRe();
		personLimit("teen");
		resetSeat();
	}
	
});


// 일반 인원수 클릭 시
$(document).on('click', '.adult > ul > li', function (){
	
	if (!$(this).hasClass('selected')){
		$('.adult > ul > li').removeClass('selected');
		$(this).addClass('selected');
		
		const adultNum = $('.adult > ul > li.selected').attr('cnt');
		
		if(adultNum == 0){
			$('#ticketAdult').attr('value','');
		}else{
			$('#ticketAdult').attr('value',adultNum);
		}
		
		
		leftPersonCtnRe();
		personLimit("adult");
		resetSeat();
	}
});


// 경로 인원수 클릭 시
$(document).on('click', '.senior > ul > li', function (){

	if (!$(this).hasClass('selected')){
		$('.senior > ul > li').removeClass('selected');
		$(this).addClass('selected');
		
		const seniorNum = $('.senior > ul > li.selected').attr('cnt');
		
		if(seniorNum == 0){
			$('#ticketSenior').attr('value','');
		}else{
			$('#ticketSenior').attr('value',seniorNum);
		}
		
		
		leftPersonCtnRe();
		personLimit("senior");
		resetSeat();
	}
});



// 좌석 클릭 시
$(document).on('click', '.seat--group > button', function() {

	const ageLimit = $('#movieAgeLimit').attr('value');
	
	let totalSeats = 0;
	if(ageLimit == '19'){
		totalSeats = parseInt($('.adult > ul > li.selected').attr('cnt'))
					+ parseInt($('.senior > ul > li.selected').attr('cnt'));
	
	}else{
		totalSeats = parseInt($('.teen > ul > li.selected').attr('cnt'))
					+ parseInt($('.adult > ul > li.selected').attr('cnt'))
					+ parseInt($('.senior > ul > li.selected').attr('cnt'));
	}

	
	let selectedSeats = $('.seat--btn.selected').length;
	
	
	if ($(this).hasClass('selected')) {
		$(this).removeClass('selected');
		leftSeatNumDel($(this).attr('seat'));
	} else {
		if(totalSeats == 0){
			$('.inform--blush').addClass('show');
			$('.inform--container').addClass('show');
			$('.inform--content--box').text("인원을 선택해 주세요.");
		}
		else if (selectedSeats < totalSeats) {
			$(this).addClass('selected');
			leftSeatNumRe($(this).attr('seat'));
		} else {
			$('.inform--blush').addClass('show');
			$('.inform--container').addClass('show');
			$('.inform--content--box').text("선택가능한 좌석 수를 초과했습니다.");
		}
	}
	
	updateTotalPrice();
});



// 인원수 제한
function personLimit(person){
	
	let remainPerson = 8;
	
	
	const teenVal = parseInt($('#ticketTeen').attr('value'));
	const adultVal = parseInt($('#ticketAdult').attr('value'));
	const seniorVal = parseInt($('#ticketSenior').attr('value'));

	console.log('타니');
	if(teenVal){
		remainPerson -= teenVal;
	}

	if(adultVal){
		remainPerson -= adultVal;
	}	

	if(seniorVal){
		remainPerson -= adultVal;
	}
	
	cosole.log(remainPerson);
	if(person == "teen"){
	
		const teenSet = remainPerson + teenVal;
		
		let list = $('.teen > ul');
    	let items = list.children('li');
    
    	items.filter(function () {
            return $(this).attr('cnt') > teenSet.toString();
        }).addClass('disabled')
        
        
        list = $('.adult > ul');
    	items = list.children('li');
    
    	
	}else if(person == "adult"){
	
		const adultSet = remainPerson + adult;
		
		const list = $('.adult > ul');
    	const items = list.children('li');
    
    	items.filter(function () {
            return $(this).attr('cnt') > adultSet.toString();
        }).addClass('disabled')
	
	}else if(person == "senior"){
	
		const seniorSet = remainPerson + senior;
		
		const list = $('.senior > ul');
    	const items = list.children('li');
    
    	items.filter(function () {
            return $(this).attr('cnt') > seniorSet.toString();
        }).addClass('disabled')
	
	}


}


// left 인원수 수정
function leftPersonCtnRe(){

	const personCnt = [];
	
	const teenVal = $('#ticketTeen').attr('value');
	const adultVal = $('#ticketAdult').attr('value');
	const seniorVal = $('#ticketSenior').attr('value');
	
	if(teenVal){
		personCnt.push('청소년 '+ teenVal);
	}

	if(adultVal){
		personCnt.push('일반 '+ adultVal);
	}	

	if(seniorVal){
		personCnt.push('경로 '+ seniorVal);
	}
	
	$('.person--cnt').text(personCnt.join(", "));
	leftPerson.attr('value',personCnt.join(", "));
	
	$('.person--cnt--Icon').addClass('show');
}


// left 좌석 재 설정
function leftSeatNumRe(seat){

	const seatSpan = $('.seat-num');
    const seats = seatSpan.text();
        

    let seatNum = []; 
    
    if(seats.includes(',')){
    	seatNum = seats.split(',').map(item => item.trim());
    }else if(seats){
    	seatNum.push(seats);
    }
    
    seatNum.push(seat);
    seatNum.sort(function(a, b) {
    
	    // 문자열을 알파벳 부분과 숫자 부분으로 분리
	    const aLetter = a.charAt(0);
	    const aNumber = parseInt(a.slice(1));
	    const bLetter = b.charAt(0);
	    const bNumber = parseInt(b.slice(1));
	
	    // 먼저 알파벳 부분을 비교
	    if (aLetter < bLetter) return -1;
	   	if (aLetter > bLetter) return 1;
	
	    // 알파벳 부분이 같으면 숫자 부분을 비교
	    return aNumber - bNumber;
	});

    seatSpan.text(seatNum.join(", "));
    leftSeatNum.attr('value',seatNum.join(", "));
    
    $('.seat--num--Icon').addClass('show');
}


// left 좌석 삭제
function leftSeatNumDel(seat){

	const seatSpan = $('.seat-num');
    const seats = seatSpan.text();

    let seatNum = []; 
    
    if(seats.includes(',')){
    	seatNum = seats.split(',').map(item => item.trim());
    }else if(seats){
    	seatNum.push(seats);
    }

	let seatNumDel = seatNum.filter((data) => data != seat);
    
    seatSpan.text(seatNumDel.join(", "));
    leftSeatNum.attr('value',seatNumDel.join(", "));
}


// 가격 수정
function updateTotalPrice(){

	let setTotalPrice = $('.total--price');
	
	const ageLimit = $('#movieAgeLimit').attr('value');
	
	// 선택된 인원수
	const teens = parseInt($('.teen > ul > li.selected').attr('cnt'));
	const adults = parseInt($('.adult > ul > li.selected').attr('cnt'));
	const seniors = parseInt($('.senior > ul > li.selected').attr('cnt'));
	

	// 선택된 좌석 수					
	let remainSeats = $('.seat--btn.selected').length
	
	
	// 총 합계
	let totalPrice = 0;
	
	// 청소년 요금
	if(ageLimit != '19'){
		const teenSeats = Math.min(remainSeats, teens);
		
		totalPrice += prices.teenSeat * teenSeats;
	
		if(remainSeats <= teenSeats){
			
			setTotalPrice.text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
		
			return;	
		}
	
		remainSeats -= teenSeats;
	}
	
	
	// 어른 요금
	const adultSeats = Math.min(remainSeats, adults);
	totalPrice += prices.adultSeat * adultSeats;
	
	if(remainSeats <= adults){
		
		setTotalPrice.text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
	
		return;	
	}
	
	remainSeats -= adultSeats;
	
	
	
	// 노인 요금
	const seniorSeats = Math.min(remainSeats, seniors);
	totalPrice += prices.seniorSeat * seniorSeats;

	setTotalPrice.text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
}


// 좌석 초기화
function resetSeat(){

	$('.seat--btn').removeClass('selected');
	$('.total--price').text("0");
	$('.seat-num').text("");
	leftSeatNum.attr('value',"");
}


// inform 확인 클릭 시
$(document).on('click', '.inform--btn', function() {

	$('.inform--blush').removeClass('show');
	$('.inform--container').removeClass('show');
	$('.inform--content--box').text("");
});



// 결제하기 버튼 예외처리
$(document).on('submit', '#payForm', function() {
    console.log('타니');
    const ageLimit = $('#movieAgeLimit').attr('value');
    
    let totalSeats = 0;
    
	if(ageLimit == '19'){
		totalSeats = parseInt($('.adult > ul > li.selected').attr('cnt'))
					+ parseInt($('.senior > ul > li.selected').attr('cnt'));
	
	}else{
		totalSeats = parseInt($('.teen > ul > li.selected').attr('cnt'))
					+ parseInt($('.adult > ul > li.selected').attr('cnt'))
					+ parseInt($('.senior > ul > li.selected').attr('cnt'));
	}

	
	let selectedSeats = $('.seat--btn.selected').length;
    
    if(totalSeats !== selectedSeats){
    	
    	$('.inform--blush').addClass('show');
		$('.inform--container').addClass('show');
		$('.inform--content--box').text("좌석을 다시 선택해 주십시오.");
		
    	return false;
    }


	return true;
});
