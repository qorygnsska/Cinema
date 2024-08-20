<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상영시간표 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.table-hover tbody tr:hover {
	background-color: #fdd000;
}

.btn-custom {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000;
}

.btn-custom:hover {
	background-color: #e6c200;
	border-color: #e6c200;
}
.form-control:focus, .form-control:active,
.btn.custom:focus, .btno-utline.custom:focus, .btn.custom:active,
	.btn-outline.custom:active {
	outline: none; /* 클릭 시 기본 테두리 없애기 */
	box-shadow: none; /* 클릭 시 그림자 효과 없애기 */
	border-color: #fdd000; /* 클릭 시 테두리 색상 고정 */
}

.pagination {
	display: flex;
	justify-content: center;
}

.pagination a {
	display: flex;
	justify-content: center;
	margin: 0 5px;
	padding: 5px 10px;
	border: 1px solid #ddd;
	text-decoration: none;
	color: #333;
}

.pagination a.active {
	background-color: #fdd000;
	color: white;
	border: 1px solid #fdd000;
}

.pagination a:hover {
	background-color: #e6c200;
}
table {
    table-layout: fixed; /* 테이블 레이아웃을 고정합니다 */
    width: 100%; /* 테이블 너비를 100%로 설정하여 전체 페이지 너비를 채우도록 합니다 */
}
thead th, tbody td {
    min-width: 100px; /* 각 칸의 최소 너비를 설정합니다. 필요에 따라 값을 조정하세요 */
    word-wrap: break-word; /* 글씨가 길 경우 자동으로 줄바꿈되도록 설정합니다 */
    white-space: normal; /* 텍스트가 칸 내에서 줄바꿈될 수 있도록 설정 */
}
.d-flex {
    overflow: visible;
}
#movieTitleDropdown {
    max-height: 200px; /* 드롭다운의 최대 높이 설정 */
    overflow-y: auto; /* 드롭다운 내에서 세로 스크롤 가능하게 설정 */
}
</style>
</head>
<body>
<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>상영시간표 목록</h2>
            </div>
   <div class="d-flex justify-content-between mb-4">
        <!-- 영화 제목 드롭다운 -->
        <select id="movieTitleDropdown" class="form-control" style="width: 18%; overflow-y: auto;">
            <option value="">영화 제목 선택</option>
            <!-- JavaScript로 옵션이 추가됩니다 -->
        </select>

        <!-- 광역자치단체 드롭다운 -->
        <select class="form-control" style="width: 18%;" id="cinemaRLG" name="cinemaRLG" onchange="updateCinemaBLG()">
            <option value="">광역자치단체 선택</option>
                               <option value="서울">서울</option>
                    <option value="경기">경기</option>
                    <option value="인천">인천</option>
                    <option value="강원">강원</option>
                    <option value="부산">부산</option>
        </select>

        <!-- 기초자치단체 드롭다운 -->
        <select class="form-control" style="width: 18%;" id="cinemaBLG" name="cinemaBLG">
            <option value="">기초자치단체 선택</option>
            <!-- 옵션 추가 -->
        </select>

        <!-- 상영관 드롭다운 -->
        <select class="form-control" style="width: 18%;" id="theaterName" name="theaterName">
            <option value="">상영관 선택</option>
            <option value="1관">1관</option>
                    <option value="2관">2관</option>
                    <option value="3관">3관</option>
                    <option value="4관">4관</option>
            <!-- 옵션 추가 -->
        </select>

        <!-- 상영 날짜 드롭다운 -->
        <select class="form-control" style="width: 18%;" id="cinemaScreenDate" name="cinemaScreenDate">
            <option value="">상영 날짜 선택</option>
            <!-- 옵션 추가 -->
        </select>

    </div>
    
    <table class="table table-bordered table-hover">
 <thead style="background-color: #fdd000 !important; font-size: 0.8rem;">
    <tr>
          <th scope="col" style="background-color: #fdd000; color: black; min-width: 50px !important;">#</th>
            <th scope="col" style="background-color: #fdd000; color: black; min-width: 250px !important;">영화 제목</th>
            <th scope="col" style="background-color: #fdd000; color: black; min-width: 150px !important;">광역자치단체</th>
            <th scope="col" style="background-color: #fdd000; color: black; min-width: 150px !important;">기초자치단체</th>
            <th scope="col" style="background-color: #fdd000; color: black; min-width: 150px !important;">상영관</th>
            <th scope="col" style="background-color: #fdd000; color: black; min-width: 150px !important;">상영 날짜</th>
            <th scope="col" style="background-color: #fdd000; color: black; min-width: 120px !important;">시작 시간</th>
            <th scope="col" style="background-color: #fdd000; color: black; min-width: 120px !important;">종료 시간</th>
            <th scope="col" style="background-color: #fdd000; color: black; min-width: 100px !important;">삭제</th>
    </tr>
        </thead>
        <tbody>
    <c:forEach var="schedule" items="${schedules}">
      <tr>
        <th scope="row">${schedule.theaterNo}</th>
        <td>${schedule.movie.movieTitle}</td> <!-- movie 객체의 movieTitle 속성 -->
        <td>${schedule.cinema.cinemaRLG}</td> <!-- cinema 객체의 cinemaRLG 속성 -->
        <td>${schedule.cinema.cinemaBLG}</td>
        <td>${schedule.theaterName}</td>
        <td><fmt:formatDate value="${schedule.cinema.cinemaScreenDate}" pattern="yyyy-MM-dd"/></td>
        <td><fmt:formatDate value="${schedule.theaterStartTime}" pattern="HH:mm"/></td>
        <td><fmt:formatDate value="${schedule.theaterEndTime}" pattern="HH:mm"/></td>
           <td>
           <form action="${pageContext.request.contextPath}/admin/deleteSchedule" method="post">
    <input type="hidden" name="theaterNo" value="${schedule.theaterNo}">
    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
</form>
        </td>
    </tr>
    </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<script>
    document.addEventListener("DOMContentLoaded", function() {
        // JSP에서 서버로부터 받은 데이터를 수집
        const movieTitles = [];
        <c:forEach var="schedule" items="${schedules}">
            movieTitles.push("${schedule.movie.movieTitle}");
        </c:forEach>

        // Set을 사용하여 중복 제거
        const uniqueMovieTitles = [...new Set(movieTitles)];

        // 드롭다운에 옵션 추가
        const dropdown = document.getElementById("movieTitleDropdown");
        uniqueMovieTitles.forEach(function(title) {
            const option = document.createElement("option");
            option.value = title;
            option.textContent = title;
            dropdown.appendChild(option);
        });
    });
</script>
<script>
function updateCinemaBLG() {
    var cinemaRLG = document.getElementById("cinemaRLG").value;
    var cinemaBLG = document.getElementById("cinemaBLG");
    var options = {
        "서울": ["강남", "강변", "건대입구", "구로"],
        "경기": ["경기광주", "구리", "하남"],
        "인천": ["계양", "부평", "인천"],
        "강원": ["강릉", "기린", "춘천"],
        "부산": ["부산명지", "서면", "센텀시티"]
    };

    cinemaBLG.innerHTML = "";
    if (cinemaRLG in options) {
        options[cinemaRLG].forEach(function(city) {
            var option = document.createElement("option");
            option.value = city;
            option.text = city;
            cinemaBLG.add(option);
        });
    }
}

</script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    // 드롭다운 요소들을 가져오기
    const movieTitleDropdown = document.getElementById("movieTitleDropdown");
    const cinemaRLGDropdown = document.getElementById("cinemaRLG");
    const cinemaBLGDropdown = document.getElementById("cinemaBLG");
    const theaterNameDropdown = document.getElementById("theaterName");
    const cinemaScreenDateDropdown = document.getElementById("cinemaScreenDate");

    // 테이블의 모든 행을 가져오기
    const tableRows = document.querySelectorAll("tbody tr");

    // 각 드롭다운에 change 이벤트 리스너를 추가하여 사용자가 선택한 값을 기준으로 테이블 필터링
    movieTitleDropdown.addEventListener("change", filterTable);
    cinemaRLGDropdown.addEventListener("change", filterTable);
    cinemaBLGDropdown.addEventListener("change", filterTable);
    theaterNameDropdown.addEventListener("change", filterTable);
    cinemaScreenDateDropdown.addEventListener("change", filterTable);

    // 테이블 필터링 함수
    function filterTable() {
        // 각 드롭다운에서 선택된 값을 가져오기
        const selectedMovieTitle = movieTitleDropdown.value;
        const selectedCinemaRLG = cinemaRLGDropdown.value;
        const selectedCinemaBLG = cinemaBLGDropdown.value;
        const selectedTheaterName = theaterNameDropdown.value;
        const selectedCinemaScreenDate = cinemaScreenDateDropdown.value;

        // 테이블 행을 필터링하여 표시 또는 숨기기
        tableRows.forEach(row => {
            // 각 행의 데이터를 가져오기
            const movieTitle = row.querySelector("td:nth-child(2)").textContent;
            const cinemaRLG = row.querySelector("td:nth-child(3)").textContent;
            const cinemaBLG = row.querySelector("td:nth-child(4)").textContent;
            const theaterName = row.querySelector("td:nth-child(5)").textContent;
            const cinemaScreenDate = row.querySelector("td:nth-child(6)").textContent;

            // 선택된 값과 행의 데이터가 일치하는지 확인
            const matchMovieTitle = selectedMovieTitle === "" || movieTitle === selectedMovieTitle;
            const matchCinemaRLG = selectedCinemaRLG === "" || cinemaRLG === selectedCinemaRLG;
            const matchCinemaBLG = selectedCinemaBLG === "" || cinemaBLG === selectedCinemaBLG;
            const matchTheaterName = selectedTheaterName === "" || theaterName === selectedTheaterName;
            const matchCinemaScreenDate = selectedCinemaScreenDate === "" || cinemaScreenDate === selectedCinemaScreenDate;

            // 모든 조건이 맞으면 행을 표시하고, 그렇지 않으면 숨김
            if (matchMovieTitle && matchCinemaRLG && matchCinemaBLG && matchTheaterName && matchCinemaScreenDate) {
                row.style.display = ""; // 행을 표시
            } else {
                row.style.display = "none"; // 행을 숨김
            }
        });

        // 선택된 조건에 따라 상영 날짜 드롭다운을 업데이트
        updateCinemaScreenDateDropdown();
    }

    // 상영 날짜 드롭다운을 업데이트하는 함수
    function updateCinemaScreenDateDropdown() {
        const selectedMovieTitle = movieTitleDropdown.value;
        const selectedCinemaRLG = cinemaRLGDropdown.value;
        const selectedCinemaBLG = cinemaBLGDropdown.value;
        const selectedTheaterName = theaterNameDropdown.value;

        // 중복 없는 날짜 목록을 만들기 위해 Set을 사용
        const datesSet = new Set();

        // 각 행을 검사하여 조건에 맞는 날짜를 Set에 추가
        tableRows.forEach(row => {
            const movieTitle = row.querySelector("td:nth-child(2)").textContent;
            const cinemaRLG = row.querySelector("td:nth-child(3)").textContent;
            const cinemaBLG = row.querySelector("td:nth-child(4)").textContent;
            const theaterName = row.querySelector("td:nth-child(5)").textContent;
            const cinemaScreenDate = row.querySelector("td:nth-child(6)").textContent;

            // 선택된 조건과 행의 데이터가 일치하면 날짜를 Set에 추가
            const matchMovieTitle = selectedMovieTitle === "" || movieTitle === selectedMovieTitle;
            const matchCinemaRLG = selectedCinemaRLG === "" || cinemaRLG === selectedCinemaRLG;
            const matchCinemaBLG = selectedCinemaBLG === "" || cinemaBLG === selectedCinemaBLG;
            const matchTheaterName = selectedTheaterName === "" || theaterName === selectedTheaterName;

            if (matchMovieTitle && matchCinemaRLG && matchCinemaBLG && matchTheaterName) {
                datesSet.add(cinemaScreenDate); // 날짜를 Set에 추가
            }
        });

        // 기존 날짜 옵션 제거
        cinemaScreenDateDropdown.innerHTML = '<option value="">상영 날짜 선택</option>';

        // 중복 없는 날짜를 기반으로 새로운 옵션을 드롭다운에 추가
        datesSet.forEach(date => {
            const option = document.createElement("option");
            option.value = date;
            option.textContent = date;
            cinemaScreenDateDropdown.appendChild(option);
        });
    }

    // 페이지 로드 시 전체 항목을 표시하도록 초기 필터링 실행
    filterTable();
});

</script>
</body>
</html>