
// left Input
const leftMovieTitle = $('#movieTitle');
const leftCinemaBLG = $('#cinemaBLG');
const leftCinemaScreenDate = $('#cinemaScreenDate');
const leftTheaterNo = $('#theaterNo');

const movieNo = $('#movieNo');



$(function () {

    // 기본 View 세팅
    initView();
});



// 영화 리스트 html
function initView() {
	const menuList = getMenuInfo();

    //영화 데이터 가져오기
    $.ajax({
        url: "ticket/movieList",
        type: "POST",
        data: JSON.stringify(menuList),
        contentType: 'application/json',
        success: function (data) {
            const movies = data;

            if (menuList === undefined || !leftMovieTitle.attr('value')) {
                movieList(movies);
            }


            $.ajax({
                url: "ticket/cinemaList",
                contentType: 'application/json',
                data: JSON.stringify(movies),
                type: "POST",
                success: function (data) {
                    cinemaList(data);
                    
		            $.ajax({
		                url: "ticket/cinemaDateList",
		                contentType: 'application/json',
		                data: JSON.stringify(movies),
		                type: "POST",
		                success: function (data) {
							cinemaDateList(data);
		                    
		                },
		                error: function () {
		                    console.log("ajax 처리 실패");
		                }
		            });
                },
                error: function () {
                    console.log("ajax 처리 실패");
                }
            });


        },
        error: function () {
            console.log("ajax 처리 실패");
        }
    });
}


// 영화 리스트
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
        console.log(movie);

        inputMovie = "<li class='movie--sub' movieNo=" + movie.movieNo + " movieTitle=" + movie.movieTitle + ">";
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


// 영화 클릭시 이벤트
$('.movie--item').on('click', 'li', function () {
    $('.movie--item li').removeClass('selected');
    // 클릭된 요소에 selected 클래스 추가
    $(this).addClass('selected');
    
    movieNo.attr('value', $(this).attr('movieNo'));
    leftMovieTitle.attr('value', $(this).attr('movieTitle'));

    initView();
})


// 영화관 클릭시 이벤트
$(document).on('click', '.cinema--item > li', function (e) {
    $('.cinema--item > li').removeClass('selected');
    // 클릭된 요소에 selected 클래스 추가
    $(this).addClass('selected');
})

$(document).on('click', '.cinema--list--section > ul > li', function (e) {
    $('.cinema--list--section > ul >li').removeClass('selected');
    // 클릭된 요소에 selected 클래스 추가
    $(this).addClass('selected');

    // 클릭시 영화랑 날짜 바뀜


})





// 영화관 리스트 html
function cinemaList(cinemas) {

	$('ul.cinema--item *').remove(); 

    // 맵 설정
    const BLGMap = new Map([['서울', 0], ['경기', '0'], ['인천', '0'], ['강원', '0'], ['부산', '0']]);

    for (const cinema of cinemas) {

        switch (cinema.cinemaRLG) {
            case "서울특별시": BLGMap.set('서울', cinema.cinemaBLGCount); break;
            case "경기": BLGMap.set('경기', cinema.cinemaBLGCount); break;
            case "인천": BLGMap.set('인천', cinema.cinemaBLGCount); break;
            case "강원": BLGMap.set('강원', cinema.cinemaBLGCount); break;
            case "부산": BLGMap.set('부산', cinema.cinemaBLGCount); break;
            default: break;
        }
    }

    let locate = [
        { 'RLG': '서울', 'BLG': ['강남', '강변', '건대입구', '구로'], 'BLGCount': BLGMap.get('서울') },
        { 'RLG': '경기', 'BLG': ['경기광주', '구리', '하남'], 'BLGCount': BLGMap.get('경기') },
        { 'RLG': '인천', 'BLG': ['계양', '부양', '인천'], 'BLGCount': BLGMap.get('인천') },
        { 'RLG': '강원', 'BLG': ['강릉', '기린', '춘천'], 'BLGCount': BLGMap.get('강원') },
        { 'RLG': '부산', 'BLG': ['부산명지', '서면', '센텀시티'], 'BLGCount': BLGMap.get('부산') }
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
        cinemaInput += "<ul>";

        for (const region of city.BLG) {
            cinemaInput += "<li>";
            cinemaInput += "<a href='#'>";
            cinemaInput += region;
            cinemaInput += "</a>";
            cinemaInput += "</li>";
        }
        cinemaInput += "</ul>";
        cinemaInput += "</div>";
        cinemaInput += "</li>";

        $('ul.cinema--item').append(cinemaInput);
    }
}

// 극장 날짜 리스트
function cinemaDateList(cinemaDates){
	console.log(cinemaDates);


	$('div.date *').remove();
    const curDate = new Date();
    const year = curDate.getFullYear();
    const month = curDate.getMonth();
    const day = curDate.getDate();
    const dayLabel = curDate.getDay(); // 요일 출력
    const dayNumber = Number(day);

    let monthCopy = month;

    console.log("year= ", year);
    console.log("month= ", month);
    console.log("day= ", day);
    console.log("dayLabel= ", dayLabel);
    console.log("dayNumber= ", dayNumber);

    const weekOfDay = ["일", "월", "화", "수", "목", "금", "토"];

    let input = "<ul>"
    input += "<li class='year'>" + year + "</li>";
    input += "<li class='month'>" + (Number(month) + 1) + "</li>";

    for (let i = dayNumber; i < dayNumber + 7; i++) {
        let resultDay = new Date(year, month, i);
        let yyyy = resultDay.getFullYear();
        let mm = resultDay.getMonth();
        let dd = resultDay.getDate();
        let d = (Number(resultDay.getDay()));

        if (monthCopy !== mm) {
            input += "<li class='year'>" + yyyy + "</li>";
            input += "<li class='month'>" + (Number(mm) + 1) + "</li>";

            monthCopy = mm;
        }
        console.log(d);


        let className = "day";
        let dayweek;
        let date;
        
        for(const cinema of cinemaDates){
        	console.log(cinema);
        	const dbDate = new Date(cinema.cinemaScreenDate);
   			const dbYear = dbDate.getFullYear();
    		const dbMonth = String(dbDate.getMonth() + 1);
    		const dbDay = String(dbDate.getDate());
    		
    		if((dbMonth == mm) && (dbDay == dd)){
    			const dbFormatDate = `${dbYear}-${dbMonth.padStart(2,'0')}-${dbDay.padStart(2,'0')}`;
    			console.log(dbFormatDate);
    			className += (' ' + dbFormatDate);	
    		}
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
        
        

        input += "<li class='" + className + " date = " + date +" '><span class='dayweek'>" + dayweek + "</span><span class='dayd'>" + dd + "</span></li>";
    }

    input += "</ul>";

    $('div.date').append(input);

}



function getMenuInfo() {
    const menuList =[];

    menuList.push({'movieNo' : movieNo.attr('value')});
    menuList.push({'cinemaBLG': leftCinemaBLG.attr('value')});
    menuList.push({'cinemaScreenDate': leftCinemaScreenDate.attr('value')});
    menuList.push({'theaterNo': leftTheaterNo.attr('value')});
    
    
    return menuList;
}


