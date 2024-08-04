
// left Input
const leftMovieTitle = $('#movieTitle');
const leftCinemaBLG = $('#cinemaBLG');
const leftCinemaScreenDate = $('#cinemaScreenDate');
const leftTheaterTime = $('#theaterTime');

const movieNo = $('#movieNo');
const theaterNo = $('#theaterNo');
const cinemaNo = $('#cinemaNo');


$(function () {

    // 기본 view 세팅
    view();
});



// ########################
// 셋팅
// ########################
function view(event) {

	
    const menuList = getMenuInfo();
    
    // 선택한 요소 체크
    let movieNoCheck = menuList.some(function (map) {
        return map.movieNo;
    });

    let blgCheck = menuList.some(function (map) {
        return map.cinemaBLG;
    });

    let screenDateCheck = menuList.some(function (map) {
        return map.cinemaScreenDate;
    });
    
    // 첫 화면 일때만
    if (!(movieNoCheck || blgCheck || screenDateCheck)) {
   		$('#loadingSpinner').show();
    } 


    //영화 데이터 가져오기
    $.ajax({
        url: "ticket/movieList",
        type: "POST",
        data: JSON.stringify(menuList),
        contentType: 'application/json',
        success: function (data) {
            
            const movies = data;

			// 아무것도 선택 안됐으면
            if (!(movieNoCheck || blgCheck || screenDateCheck)) {
                movieList(movies);
            } 
            
            // 영화를 선택 안했을 때
            if(event != 'movieEvent'){
                movieListRe(movies);
            }

			// 시네마 데이터 가져오기
            $.ajax({
                url: "ticket/cinemaList",
                contentType: 'application/json',
                data: JSON.stringify(menuList),
                type: "POST",
                success: function (data) {

					if (!blgCheck) {
                    	cinemaList(data);
                    }
                    
                    // 지역 선택 안했을 때
                    if(event != 'cinemaEvent'){
                    	cinemaListRe(data);
                   	}
                    
                    // 시네마 날짜 데이터 가져오기
                    $.ajax({
                        url: "ticket/cinemaDateList",
                        contentType: 'application/json',
                        data: JSON.stringify(menuList),
                        type: "POST",
                        success: function (data) {
                        
                        	if(!screenDateCheck){
                        		cinemaDateList(data);
                        	}
							if(event != 'dateEvent'){
                        		cinemaDateListRe(data);
                        	}
                        	
                        	
                        	
                        	// 극장 데이터 가져오기
                        	if (movieNoCheck && blgCheck && screenDateCheck){
	                        	$.ajax({
			                        url: "ticket/theaterList",
			                        contentType: 'application/json',
			                        data: JSON.stringify(menuList),
			                        type: "POST",
			                        success: function (data) {
			                        
			                        	theaterList(data);
			                        	
			                        },
			                        error: function () {
			                            console.log("ajax 처리 실패");
			                        }
			                    });
		                    }else{
		                    	if (!(movieNoCheck || blgCheck || screenDateCheck)) {
		                    		$('#loadingSpinner').hide();
		                    	}
		                    }
                        },
                        error: function () {
                            console.log("ajax 처리 실패");
                            
                            if (!(movieNoCheck || blgCheck || screenDateCheck)) {
                            	$('#loadingSpinner').hide();
                            }
                        }
                    });
                },
                error: function () {
                    console.log("ajax 처리 실패");
                    if (!(movieNoCheck || blgCheck || screenDateCheck)) {
                    	$('#loadingSpinner').hide();
                    }
                }
            });
        },
        error: function () {
            console.log("ajax 처리 실패");
            if (!(movieNoCheck || blgCheck || screenDateCheck)) {
            	$('#loadingSpinner').hide();
            }
        }
    });
}

// ########################
// 영화 리스트
// ########################
function movieList(movies) {

    // 폴더 경로
    let hostIndex = location.href.indexOf(location.host) + location.host.length;
    let contextPath = location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));


    $('ul.movie--item *').remove();

    // 영화 데이터 HTML로 보여주기
    let inputMovie = "";
    let ageLimitText = "";
    let ageLimitImage = "";

    for (const movie of movies) {

        inputMovie = "<li class='movie--sub active' movieNo=" + movie.movieNo + " movieTitle='" + movie.movieTitle + "'>";
        inputMovie += "<div class='movie--section'>";

        // 연령, 이미지 경로
        if (movie.movieAgeLimit == "19") {
            ageLimitText = "19";
            ageLimitImage = "Image_Age_19.png";
        } if (movie.movieAgeLimit == "15") {
            ageLimitText = "15";
            ageLimitImage = "Image_Age_15.png";
        } if (movie.movieAgeLimit == "12") {
            ageLimitText = "12";
            ageLimitImage = "Image_Age_12.png";
        } if (movie.movieAgeLimit == "ALL") {
            ageLimitText = "All";
            ageLimitImage = "Image_Age_All.png";
        }


        inputMovie += "<img alt='" + ageLimitText + "' src='" + contextPath + "/resources/img/ticket/" + ageLimitImage + "'>";
        inputMovie += "<span class='movie--title'>" + movie.movieTitle + "</span>";
        inputMovie += "</div>";
        inputMovie += "</li>";

        $('ul.movie--item').append(inputMovie);
    }

    return movies;
}


function movieListRe(movies) {
    const list = $('.movie--item');
    const items = list.children('li');

    items.removeClass('active');

    movies.forEach(function (movie) {
        items.filter(function () {
            return $(this).attr('movieNo') == movie.movieNo;
        }).addClass('active')

    });


    let activeItem = list.children('li.active');
    let nonActiveItem = items.not(activeItem);


    list.empty().append(activeItem).append(nonActiveItem);
}


// 영화 클릭시 이벤트
$('.movie--item').on('click', 'li.active', function () {

	if (!$(this).hasClass('selected')){
		$('.movie--item li.active').removeClass('selected');
	    // 클릭된 요소에 selected 클래스 추가
	    $(this).addClass('selected');
	
	    movieNo.attr('value', $(this).attr('movieNo'));
	    leftMovieTitle.attr('value', $(this).attr('movieTitle'));
	
	    view("movieEvent");
	    
	    $('.movie--Title--Icon').addClass('show');
	}
})




// ########################
// 영화관 리스트
// ########################
function cinemaList(cinemas) {

    $('ul.cinema--item *').remove();


    let locate = [
        { 'RLG': '서울', 	'BLG': ['강남', '강변', '건대입구', '구로']},
        { 'RLG': '경기', 	'BLG': ['경기광주', '구리', '하남']},
        { 'RLG': '인천', 	'BLG': ['계양', '부양', '인천']},
        { 'RLG': '강원', 	'BLG': ['강릉', '기린', '춘천']},
        { 'RLG': '부산', 	'BLG': ['부산명지', '서면', '센텀시티']}
    ];



    for (const [idx, city] of locate.entries()) {
        let cinemaInput = "";
        if (idx == 0) {
            cinemaInput += "<li class='selected'>";
        } else {
            cinemaInput += "<li>";
        }


        cinemaInput += "<a href='#'>";
        cinemaInput += `<span class='name'>${city.RLG}</span>`;
        cinemaInput += `<span class='count'></span>`;
        cinemaInput += "</a>";

        cinemaInput += "<div class='cinema--list--section'>";
        cinemaInput += "<ul class='cinema--list--section--item'>";

        for (const region of city.BLG) {
            cinemaInput += "<li cinemaRLG='" + city.RLG + "' cinemaBLG='" + region + "'>";
            cinemaInput += "<span>";
            cinemaInput += region;
            cinemaInput += "</span>";
            cinemaInput += "</li>";
        }
        cinemaInput += "</ul>";
        cinemaInput += "</div>";
        cinemaInput += "</li>";

        $('ul.cinema--item').append(cinemaInput);
    }
    
    locationCnt(cinemas);
}


// 영화관 재 셋팅
function cinemaListRe(cinemas) {

	locationCnt(cinemas);


	// 지역 재 셋팅
    $('.cinema--list--section--item').each(function (index, ulElement) {
        const list = $(ulElement);
        const items = list.children('li');

        items.removeClass('active');

        cinemas.forEach(function(cinema) {
            items.filter(function() {
            
                return $(this).attr('cinemaBLG') == cinema.cinemaBLG;
                
            }).addClass('active');
        });

        let activeItem = list.children('li.active');
        let nonActiveItem = items.not(activeItem);

        list.empty().append(activeItem).append(nonActiveItem);
    });

}


function locationCnt(cinemas){

// 지역 카운트 재 셋팅
	$('.cinema--item > li').each(function (index, ulElement) {

		const list = $(ulElement);
        const item = list.find('a span.count');

		let souleBLGCnt = 0;
		let gyeonggiBLGCnt = 0;
		let inchonBLGCnt = 0;
		let gangwonBLGCnt = 0;
		let busanBLGCnt = 0;
	
	
	    for (const cinema of cinemas) {
	
	        switch (cinema.cinemaBLG) {
	        
	            case "강남": 	  	case "강변": 
	            case "건대입구":	case "구로": 	
	            
	            	souleBLGCnt++; 	
	            	
	            break;
	            	
	            case "경기광주": 	case "구리": 
	            case "하남": 		
	            
	            	gyeonggiBLGCnt++; 
		
	            break;
	            	
	            case "계양":     case "부양": 
	            case "인천": 		
	            	inchonBLGCnt++; 
	            	
	            break;
	            	
	            case "강릉": 		case "기린": 
	            case "춘천":
	            	gangwonBLGCnt++;
	            	
	            break;
	            	
	            case "부산명지": 	case "서면": 
	            case "센텀시티": 		
	            	busanBLGCnt++;
	            	
	            break;
	            	
	            default: break;
	        }
	    }
	    
	    
	    const BLGCnt = [];
	    BLGCnt.push(souleBLGCnt);
	    BLGCnt.push(gyeonggiBLGCnt);
	    BLGCnt.push(inchonBLGCnt);
	    BLGCnt.push(gangwonBLGCnt);
	    BLGCnt.push(busanBLGCnt);
	    
	    item.text('(' + BLGCnt[index] + ')');

    });
}



// 영화관 클릭시 이벤트
$(document).on('click', '.cinema--item > li', function (e) {
    $('.cinema--item > li').removeClass('selected');

    $(this).addClass('selected');
})


$(document).on('click', '.cinema--list--section > ul > li.active', function (e) {
	
	if(!$(this).hasClass('selected')){
	
		$('.cinema--list--section > ul > li.active').removeClass('selected');

    	$(this).addClass('selected');
    	
    	$('.cinema--BLG--Icon').addClass('show');

    	leftCinemaBLG.attr('value', $(this).attr('cinemaBLG'));

    	view("cinemaEvent");
	}

   
})





// ########################
// 영화관 날짜 리스트
// ########################
function cinemaDateList(cinemaDates) {


    let cinemaDate = [];
    for (const date of cinemaDates) {
        const dbDate = new Date(date.cinemaScreenDate);
        const dbYear = dbDate.getFullYear();
    	const dbMonth = dbDate.getMonth();
    	const dbDay = dbDate.getDate();
        const dbFormatDate = `${dbYear}-${String(dbMonth + 1).padStart(2, '0')}-${String(dbDay).padStart(2, '0')}`;

        cinemaDate.push(dbFormatDate);
        
    }


    $('.date--item *').remove();
    const curDate = new Date();
    const year = curDate.getFullYear();
    const month = curDate.getMonth();
    const day = curDate.getDate();
    const dayLabel = curDate.getDay(); // 요일 출력
    const dayNumber = Number(day);

    let monthCopy = month;

    const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];

    let input = "<li class='year'>" + year + "</li>";
    input += "<li class='month'>" + (Number(month) + 1) + "</li>";

    for (let i = dayNumber; i < dayNumber + 7; i++) {
        let resultDay = new Date(year, month, i);
        let yyyy = resultDay.getFullYear();
        let mm = resultDay.getMonth();
        let dd = resultDay.getDate();
        let d = (Number(resultDay.getDay()));

        const formatDate = `${yyyy}-${String(mm + 1).padStart(2, '0')}-${String(dd).padStart(2, '0')}`;
        const date = formatDate;

        let className = "day";
        let dayweek;

        if (monthCopy !== mm) {
            input += "<li class='year'>" + yyyy + "</li>";
            input += "<li class='month'>" + (Number(mm)) + "</li>";

            monthCopy = mm;
        }


        switch (d) {
            case 0:
                className += " day--sun";
                dayweek = "일";

                break;

            case 1:
                dayweek = "월";

                break;

            case 2:
                dayweek = "화";

                break;

            case 3:
                dayweek = "수";

                break;

            case 4:
                dayweek = "목";

                break;

            case 5:
                dayweek = "금";

                break;

            case 6:
                className += " day--sat";
                dayweek = "토";

                break;

            default:

                break;
        }
		

       	if (cinemaDate.indexOf(formatDate) > -1) {
            className += " active";
        }

        input += "<li class='" + className + "' date='" + date + "'><span class='dayweek'>" + dayweek + "</span><span class='dayd'>" + dd + "</span></li>";


    }


    $('.date--item').append(input);

}

// 영화관 날짜 재 셋팅
function cinemaDateListRe(cinemaDates){

	let cinemaDate = [];
    for (const date of cinemaDates) {
        const dbDate = new Date(date.cinemaScreenDate);
        const dbYear = dbDate.getFullYear();
    	const dbMonth = dbDate.getMonth();
    	const dbDay = dbDate.getDate();
        const dbFormatDate = `${dbYear}-${String(dbMonth + 1).padStart(2, '0')}-${String(dbDay).padStart(2, '0')}`;

        cinemaDate.push(dbFormatDate);
    }
	

	const list = $('.date--item');
    const items = list.children('li');

    items.removeClass('active');

        items.filter(function () {
        	const date = String($(this).attr('Date'));

            return (cinemaDate.indexOf(date) > -1);
        }).addClass('active')



}



// 날짜 클릭 시
$(document).on('click', '.date > ul > li.active', function (e) {

	if(!$(this).hasClass('selected')){
	    $('.date > ul > li.active').removeClass('selected');
	
	    $(this).addClass('selected');
	    
	    $('.cinema--Screen--Date--Icon').addClass('show');
	
	    leftCinemaScreenDate.attr('value', $(this).attr('date'));
	    
	    view("dateEvent");
    }
});




// ########################
// 극장 리스트
// ########################
function theaterList(theaterList){

	$('.theater--time--wrap *').remove();

	let theater_1st = [];
    let theater_2nd = [];
    let theater_3rd = [];
    let theater_4th = [];
    
    let theaterCinemaNo = "";
    
    for (const [idx, temp] of theaterList.entries()) {
		
		if(idx == 0){
			theaterCinemaNo = temp.theaterCinemaNo;
		}    
    	
    
    	let date = new Date(temp.theaterStartTime);
    	let hour = String(date.getHours()).padStart(2, '0');
    	let minute = String(date.getMinutes()).padStart(2, '0');
    	
    	const startTime = `${hour}:${minute}`;
    	
    	date = new Date(temp.theaterEndTime);
    	hour = String(date.getHours()).padStart(2, '0');
    	minute = String(date.getMinutes()).padStart(2, '0');
    	
    	const endTime = `${hour}:${minute}`;   	
    	
    	
        let setTheater = {
				            'no': temp.theaterNo,
				            'startTime': startTime,
				            'endTime': endTime,
				            'count': 150 - temp.revSeatCnt
        				};
        
        switch(temp.theaterName) {
        
            case '1관': 
                theater_1st.push(setTheater); 
                break;
                
            case '2관': 
                theater_2nd.push(setTheater); 
                break;
                
            case '3관': 
                theater_3rd.push(setTheater); 
                break;
                
            case '4관': 
                theater_4th.push(setTheater); 
                break;
                
            default: 
                break;
        }
    }
    
    const theaters = [
        {'theaterName': '1관', 'theaterNum': theater_1st},
        {'theaterName': '2관', 'theaterNum': theater_2nd},
        {'theaterName': '3관', 'theaterNum': theater_3rd},
        {'theaterName': '4관', 'theaterNum': theater_4th},
    ];
    
    for (const theater of theaters) {
     	if (theater.theaterNum.length > 0) {
	        let theaterInput = "<div class='theater--time'>";
			theaterInput += "<span>" + theater.theaterName + "</span>";
			
			theaterInput += "<ul class='theater--time--item'>";

			for(const th of theater.theaterNum){
				theaterInput += "<li theaterNo='" + th.no + "' theaterStartTime='" + th.startTime + "' theaterEndTime='" + th.endTime + "' cinemaNo ='" + theaterCinemaNo + "' theaterCnt='" + th.count + "'>"
				theaterInput += "<button type='button' class='t--btn'>";
				theaterInput += "<span class='time'>" + th.startTime + "</span>";
				theaterInput += "<span class='count'>" + th.count + "석</span>";
				theaterInput += "</button>";
				theaterInput += "</li>";
			}
			
			theaterInput += "</ul>";
			theaterInput += "</div>";
			
			
			$('.theater--time--wrap').append(theaterInput);
		}
    }	 
   
}

// 극장 클릭 이벤트
$(document).on('click', '.theater--time--item > li', function (e) {
	console.log('타니');
    $('.theater--time--item > li').removeClass('selected');

    $(this).addClass('selected');
    
    $('.theaterNo--Icon').addClass('show');
    
    theaterNo.attr('value', $(this).attr('theaterNo'));
    cinemaNo.attr('value', $(this).attr('cinemaNo'));
    
    // 시간 체크
    leftTheaterTime.attr('value', $(this).attr('theaterStartTime') + "~" + $(this).attr('theaterEndTime'));
    
    $('.layer--header > strong').text('');
    $('.layer--header > strong').text(leftTheaterTime.attr('value'));
    
    // 좌석인원
    $('.layer--seat > strong').text($(this).attr('theaterCnt'));
    
    // 나이 체크
    const age = $('.movie--item > li.selected > div > img').attr('alt');
    const ageImg = $('.movie--item > li.selected > div > img').attr('src');
    
    let tltContent = "만" + age + "이상 관람가";
    let strongClass = "";
    
    if(age == "All"){
    	tltContent = "전체관람가";
    	strongClass = "ageLimit--all";
    }else if(age == "12"){
    	strongClass = "ageLimit--12";
    }else if(age == "15"){
    	strongClass = "ageLimit--15";
    }else if(age == "19"){
    	tltContent = "청소년 관람불가"
    	strongClass = "ageLimit--19";
    }
    
    $('.tlt > img').attr('alt', age);
    $('.tlt > img').attr('src', ageImg);
    $('.tlt > span > strong').text(tltContent);
    $('.tlt > span > strong').addClass(strongClass);
    
    $('.txt').text('');
    if(age != "All"){
	    let txtInput = ("만 "+ age +"세 미만의 고객님(영, 유아 포함)은 반드시 부모님 또는 성인 보호자의 동반하에");
	    txtInput += "<br>";
	    txtInput += "관람이 가능합니다. 연령 확인 불가 시 입장이 제한될 수 있습니다.";
	    
	    $('.txt').append(txtInput);
   	}
    

    $('#layerReserve').addClass('show');
	$('#layerReserveStep01').addClass('show');
    
})

// 좌석 선택 팝업창 취소 클릭 시
$(document).on('click', '.layer--btn--cancle', function (e) {
 	$('#layerReserve').removeClass('show');
	$('#layerReserveStep01').removeClass('show');
})



function getMenuInfo() {
    const menuList = [];

    menuList.push({ 'movieNo': movieNo.attr('value') });
    menuList.push({ 'cinemaBLG': leftCinemaBLG.attr('value') });
    menuList.push({ 'cinemaScreenDate': leftCinemaScreenDate.attr('value') });
    menuList.push({ 'theaterNo': theaterNo.attr('value') });

	
    return menuList;
}


