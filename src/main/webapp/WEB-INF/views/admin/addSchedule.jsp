<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상영시간표 추가</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script>
        var movieShowtimes = ${movieShowtimesJson};

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

        function updateEndTime() {
            var movieNo = document.getElementById("movieNo").value;
            var startTime = document.getElementById("theaterStartTime").value;
            var endTime = document.getElementById("theaterEndTime");

            if (startTime && movieNo) {
                var movieShowtime = movieShowtimes[movieNo];
                if (movieShowtime && startTime) {
                    var startDateTime = new Date("1970-01-01T" + startTime + ":00");
                    startDateTime.setMinutes(startDateTime.getMinutes() + movieShowtime);

                    var endHours = startDateTime.getHours().toString().padStart(2, '0');
                    var endMinutes = startDateTime.getMinutes().toString().padStart(2, '0');
                    endTime.value = endHours + ':' + endMinutes;
                    endTime.style.display = 'block';
                }
            }
        }
    </script>
    <style>
    .form-control:focus {
	border-color: #fdd000;
	box-shadow: 0 0 0 0.2rem rgba(253, 208, 0, 0.25);
}
.btn-primary.custom {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000
}

.btn-primary.custom:hover {
	background-color: #e6c200;
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center">
        <h2>상영시간표 추가</h2>
        <a href="${pageContext.request.contextPath}/admin/adminMain?page=scheduleList" class="btn btn-primary custom">상영 리스트</a>
    </div>
        <form action="${pageContext.request.contextPath}/admin/addSchedule" method="post">
            <div class="form-group">
                <label for="movieNo">영화 제목:</label>
                <select class="form-control" id="movieNo" name="movieNo" onchange="updateEndTime()" required>
                    <option value="">선택하세요</option>
                    <c:forEach var="movie" items="${movies}">
                        <option value="${movie.movieNo}">${movie.movieTitle}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="cinemaRLG">광역자치단체:</label>
                <select class="form-control" id="cinemaRLG" name="cinemaRLG" onchange="updateCinemaBLG()" required>
                    <option value="">선택하세요</option>
                    <option value="서울">서울</option>
                    <option value="경기">경기</option>
                    <option value="인천">인천</option>
                    <option value="강원">강원</option>
                    <option value="부산">부산</option>
                </select>
            </div>
            <div class="form-group">
                <label for="cinemaBLG">기초자치단체:</label>
                <select class="form-control" id="cinemaBLG" name="cinemaBLG" required>
                    <option value="">선택하세요</option>
                </select>
            </div>
            <div class="form-group">
                <label for="theaterName">상영관 이름:</label>
                <select class="form-control" id="theaterName" name="theaterName" required>
                    <option value="">선택하세요</option>
                    <option value="1">1관</option>
                    <option value="2">2관</option>
                    <option value="3">3관</option>
                    <option value="4">4관</option>
                </select>
            </div>
            <div class="form-group">
                <label for="cinemaScreenDate">상영 날짜:</label>
                <input type="date" class="form-control" id="cinemaScreenDate" name="cinemaScreenDate" required>
            </div>
            <div class="form-group">
                <label for="theaterStartTime">시작 시간:</label>
                <input type="time" class="form-control" id="theaterStartTime" name="theaterStartTime" onchange="updateEndTime()" required>
            </div>
            <div class="form-group">
                <label for="theaterEndTime">종료 시간:</label>
                <input type="time" class="form-control" id="theaterEndTime" name="theaterEndTime" required readonly style="display: none;">
            </div>
            <button type="submit" class="btn btn-primary custom">추가</button>
        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>



