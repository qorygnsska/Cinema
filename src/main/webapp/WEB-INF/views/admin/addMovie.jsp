<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 추가</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="d-flex justify-content-between align-items-center">
			<h2>영화 추가</h2>
			<a
				href="${pageContext.request.contextPath}/admin/adminMain?page=movieList"
				class="btn btn-primary custom">영화 리스트</a>
		</div>

		<form id="addMovieForm" action="${pageContext.request.contextPath}/admin/addMovie"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
    <label for="movieTitle">영화 제목</label> 
    <input type="text" class="form-control custom" id="movieTitle" name="movieTitle"
           placeholder="영화 제목을 입력하세요" required>
        <c:if test="${not empty errorMessage}">
            alert('${errorMessage}');
        </c:if>
</div>
			<div class="form-group">
				<label for="movieStartDate">개봉일</label> <input type="date"
					class="form-control custom" id="movieStartDate"
					name="movieStartDate" placeholder="개봉일을 입력하세요" required>
			</div>
			<div class="form-group">
				<label for="movieEndDate">종료일</label> <input type="date"
					class="form-control custom" id="movieEndDate" name="movieEndDate"
					placeholder="종료일을 입력하세요" required>
			</div>
			<div class="form-group">
				<label for="movieDirector">감독</label> <input type="text"
					class="form-control custom" id="movieDirector" name="movieDirector"
					placeholder="감독을 입력하세요" required>
			</div>
			<div class="form-group">
				<label for="movieActor">배우</label> <input type="text"
					class="form-control custom" id="movieActor" name="movieActor"
					placeholder="배우를 입력하세요" required>
			</div>
			<div class="form-group">
				<label for="movieGenre">장르</label> <input type="text"
					class="form-control custom" id="movieGenre" name="movieGenre"
					placeholder="장르를 입력하세요" required>
			</div>
			<div class="form-group">
				<label for="movieAgeLimit">연령제한</label> <select
					class="form-control custom" id="movieAgeLimit" name="movieAgeLimit"
					required>
					<option value="All">전체 관람가</option>
					<option value="12">12세 이상</option>
					<option value="15">15세 이상</option>
					<option value="19">19세 이상</option>
				</select>
			</div>
			<div class="form-group">
				<label for="movieShowtime">상영시간 (분)</label> <input type="number"
					class="form-control custom" id="movieShowtime" name="movieShowtime"
					placeholder="상영시간을 입력하세요" required>
			</div>
			<div class="form-group">
				<label for="movieNationality">국적</label> <input type="text"
					class="form-control custom" id="movieNationality"
					name="movieNationality" placeholder="국적을 입력하세요" required>
			</div>
			<div class="form-group">
				<label for="movieSummary">줄거리</label>
				<textarea class="form-control custom" id="movieSummary"
					name="movieSummary" placeholder="줄거리를 입력하세요" rows="3" required></textarea>
			</div>
			<div class="form-group">
				<label for="movieImage">이미지 파일</label> <input type="file"
					class="form-control custom" id="movieImage" name="movieImageFile"
					required>
			</div>
			<div class="form-group">
				<label for="movieTrailer">예고편 파일</label> <input type="file"
					class="form-control custom" id="movieTrailer"
					name="movieTrailerFile">
			</div>
			<button type="submit" class="btn btn-primary custom">영화 추가</button>
		</form>
	</div>
	


<!-- 영화 제목 중복 시, 제출 막고, 확인.  -->
	 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#addMovieForm').on('submit', function(e) {
                e.preventDefault(); // 폼 제출을 막음

                // 영화 제목 가져오기
                var movieTitle = $('#movieTitle').val();

                // AJAX 요청으로 제목 중복 확인
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/checkMovieTitle',
                    type: 'GET',
                    data: { movieTitle: movieTitle },
                    success: function(response) {
                        if (response) {
                            alert('이미 등록된 영화입니다.');
                        } else {
                            // 중복이 아니면 폼 제출
                            $('#addMovieForm').off('submit').submit();
                        }
                    }
                });
            });
        });
    </script>
</body>
</html>

