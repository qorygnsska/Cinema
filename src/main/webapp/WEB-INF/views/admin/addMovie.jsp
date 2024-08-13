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

.btn.custom {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000
}
.btn-outline.custom{
	background-color: white;
	color: #fdd000;
	border-color: #fdd000
}
.btn-outline.custom:hover{
background-color: #e6c200;
color:white;
border-color: #fdd000
}

.btn-primary.custom:hover {
	background-color: #e6c200;}
.btn.custom.selected,
.btn-outline.custom.selected {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000;
}
.btn.custom.selected:hover,
.btn-outline.custom.selected:hover {
	background-color: #fdd000;
	color: white;
	border-color: #fdd000;
}
.btn.custom:focus,
.btn-outline.custom:focus,
.btn.custom:active,
.btn-outline.custom:active {
	outline: none; /* 클릭 시 기본 테두리 없애기 */
	box-shadow: none; /* 클릭 시 그림자 효과 없애기 */
	border-color: #fdd000; /* 클릭 시 테두리 색상 고정 */
		border-color: #fdd000; /* 클릭 시 테두리 색상 고정 */
	background-color: #fdd000; /* 클릭 시 어둡게 */
	 transition: none; /* 부드러운 전환 효과 제거 */
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="d-flex justify-content-between align-items-center">
			<h2>영화 추가</h2>
			<a
				href="${pageContext.request.contextPath}/admin/adminMain?page=movieList"
				class="btn btn custom">영화 리스트</a>
		</div>

		<form id="addMovieForm" action="${pageContext.request.contextPath}/admin/addMovie"
			method="post" enctype="multipart/form-data">
			<div class="form-group">
    <label for="movieTitle">영화 제목</label> 
    <input type="text" class="form-control custom" id="movieTitle" name="movieTitle"
           placeholder="영화 제목을 입력하세요" required>
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
    <label for="movieGenre">장르</label>
    <div id="genreButtons">

 <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Drama')">드라마 (Drama)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Comedy')">코미디 (Comedy)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Action')">액션 (Action)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Thriller')">스릴러 (Thriller)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Horror')">공포 (Horror)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Crime')">범죄 (Crime)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Science Fiction')">SF (Science Fiction)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Fantasy')">판타지 (Fantasy)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Romance')">로맨스 (Romance)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Adventure')">모험 (Adventure)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Musical')">뮤지컬 (Musical)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Documentary')">다큐멘터리 (Documentary)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'War')">전쟁 (War)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Family')">가족 (Family)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Animation')">애니메이션 (Animation)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Historical')">역사 (Historical)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Sports')">스포츠 (Sports)</button>
        <button type="button" class="btn btn-outline custom" onclick="toggleGenre(this, 'Mystery')">미스터리 (Mystery)</button>

    </div>
    <!-- Hidden input to store selected genres -->
    <input type="hidden" id="selectedGenres" name="movieGenre" value="">
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
					class="form-control custom" id="movieImage" name="movieMainImageFile"
					required>
					<input type="file"
					class="form-control custom" id="movieSubImage" name="movieSubImageFile"
					required>
					<input type="file"
					class="form-control custom" id="movieSsubImage" name="movieSsubImageFile"
					required>
			</div>
			<div class="form-group">
				<label for="movieTrailer">예고편 영상</label> <input type="file"
					class="form-control custom" id="movieTrailer"
					name="movieTrailerFile">
			<div class="d-flex justify-content-end mt-3">
			<button type="submit" class="btn btn custom" >영화 추가</button>
		</form>
	</div>
	

<script>
    function toggleGenre(button, genre) {
        const selectedGenres = document.getElementById('selectedGenres');
        const genresArray = selectedGenres.value ? selectedGenres.value.split(',') : [];

        const genreIndex = genresArray.indexOf(genre);
        if (genreIndex === -1) {
            // Add genre if not already selected
            genresArray.push(genre);
            button.classList.remove('btn-outline');
            button.classList.add('btn', 'selected');
        } else {
            // Remove genre if already selected
            genresArray.splice(genreIndex, 1);
            button.classList.remove('btn', 'selected');
            button.classList.add('btn-outline');
        }

        // Update hidden input value
        selectedGenres.value = genresArray.join(',');
    }
</script>

</body>
</html>

