<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상영시간표 추가</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">상영시간표 추가</h2>
        <form action="${pageContext.request.contextPath}/admin/addSchedule" method="post">
            <div class="form-group">
                <label for="theaterName">상영관 이름:</label>
                <input type="text" class="form-control" id="theaterName" name="theaterName" required>
            </div>
            <div class="form-group">
                <label for="cinemaNo">영화관 번호:</label>
                <input type="number" class="form-control" id="cinemaNo" name="cinemaNo" required>
            </div>
            <div class="form-group">
                <label for="movieNo">영화 번호:</label>
                <input type="number" class="form-control" id="movieNo" name="movieNo" required>
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


