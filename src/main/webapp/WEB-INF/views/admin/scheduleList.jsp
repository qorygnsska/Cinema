<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상영시간표 추가</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

            // Clear existing options
            cinemaBLG.innerHTML = "";

            // Add new options
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
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">상영시간표 추가</h2>
        <form action="${pageContext.request.contextPath}/admin/addSchedule" method="post">
                    <div class="form-group">
                <label for="movieNo">영화 번호:</label>
                <input type="number" class="form-control" id="movieNo" name="movieNo" required>
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
                <input type="text" class="form-control" id="theaterName" name="theaterName" required>
            </div>
           
          
            <div class="form-group">
                <label for="cinemaScreenDate">상영 날짜:</label>
                <input type="date" class="form-control" id="cinemaScreenDate" name="cinemaScreenDate" required>
            </div>
            <div class="form-group">
                <label for="startTime">시작 시간:</label>
                <input type="datetime-local" class="form-control" id="startTime" name="startTime" required>
            </div>
            <div class="form-group">
                <label for="endTime">종료 시간:</label>
                <input type="datetime-local" class="form-control" id="endTime" name="endTime" required>
            </div>
            <button type="submit" class="btn btn-primary">추가</button>
        </form>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

