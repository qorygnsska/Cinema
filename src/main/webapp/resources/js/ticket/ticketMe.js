
// left Input
const leftMovieTitle = $('#movieTitle');
const leftCinemaBLG = $('#cinemaBLG');
const leftCinemaScreenDate = $('#cinemaScreenDate');
const leftTheaterNo = $('#theaterNo');

const movieNo = $('#movieNo');



$(function () {

    // 기본 view 세팅
    view();
});



// ########################
// 셋팅
// ########################
function view(event) {

	$('#loadingSpinner').show();
	
	
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
                        	}else{
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
			                        
			                        	
			                        
			                        	
			                      		$('#loadingSpinner').hide();  	
			                        },
			                        error: function () {
			                            console.log("ajax 처리 실패");
			                            $('#loadingSpinner').hide();
			                        }
			                    });
		                    }else{
		                    	$('#loadingSpinner').hide();
		                    }
                        },
                        error: function () {
                            console.log("ajax 처리 실패");
                            $('#loadingSpinner').hide();
                        }
                    });
                },
                error: function () {
                    console.log("ajax 처리 실패");
                    $('#loadingSpinner').hide();
                }
            });
        },
        error: function () {
            console.log("ajax 처리 실패");
            $('#loadingSpinner').hide();
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
            ageLimitText = "19세 이상 이미지";
            ageLimitImage = "Image_Age_19.png";
        } if (movie.movieAgeLimit == "15") {
            ageLimitText = "15세 이상 이미지";
            ageLimitImage = "Image_Age_15.png";
        } if (movie.movieAgeLimit == "12") {
            ageLimitText = "12세 이상 이미지";
            ageLimitImage = "Image_Age_12.png";
        } if (movie.movieAgeLimit == "ALL") {
            ageLimitText = "전체 연령가 이미지";
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

	// 지역 수
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
    



    let locate = [
        { 'RLG': '서울', 	'BLG': ['강남', '강변', '건대입구', '구로'], 	'BLGCount': souleBLGCnt },
        { 'RLG': '경기', 	'BLG': ['경기광주', '구리', '하남'], 			'BLGCount': gyeonggiBLGCnt },
        { 'RLG': '인천', 	'BLG': ['계양', '부양', '인천'], 			'BLGCount': inchonBLGCnt },
        { 'RLG': '강원', 	'BLG': ['강릉', '기린', '춘천'], 			'BLGCount': gangwonBLGCnt },
        { 'RLG': '부산', 	'BLG': ['부산명지', '서면', '센텀시티'], 		'BLGCount': busanBLGCnt }
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
        cinemaInput += `<span class='count'>(${city.BLGCount})</span>`;
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
}


// 영화관 재 셋팅
function cinemaListRe(cinemas) {

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
	console.log(cinemaDate);

	const list = $('.date--item');
    const items = list.children('li');

    items.removeClass('active');

        items.filter(function () {
        	const date = String($(this).attr('Date'));
        	console.log('date',date);
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
})








function getMenuInfo() {
    const menuList = [];

    menuList.push({ 'movieNo': movieNo.attr('value') });
    menuList.push({ 'cinemaBLG': leftCinemaBLG.attr('value') });
    menuList.push({ 'cinemaScreenDate': leftCinemaScreenDate.attr('value') });
    menuList.push({ 'theaterNo': leftTheaterNo.attr('value') });


    return menuList;
}


