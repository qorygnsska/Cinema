<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 추가</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .form-control:focus {
            border-color: #fdd000;
            box-shadow: 0 0 0 0.2rem rgba(253, 208, 0, 0.25);
        }

        .btn.addMovie-custom {
            background-color: #fdd000;
            color: white;
            border-color: #fdd000
        }

        .btn-outline.addMovie-custom {
            background-color: white;
            color: #fdd000;
            border-color: #fdd000;
        }

        .btn-outline.addMovie-custom:hover {
            background-color: #e6c200;
            color: white;
            border-color: #fdd000;
        }

        .btn-primary.addMovie-custom:hover {
            background-color: #e6c200;
        }

        .btn.addMovie-custom.selected, .btn-outline.addMovie-custom.selected {
            background-color: #fdd000;
            color: white !important;
            border-color: #fdd000;
        }

        .btn.addMovie-custom.selected:hover, .btn-outline.addMovie-custom.selected:hover {
            background-color: #e6c200; /* 호버 시 배경색 */
            color: white; /* 호버 시 글씨 색상 */
            border-color: #fdd000; /* 호버 시 테두리 색상 */
        }

        .btn.addMovie-custom:focus, .btn-outline.addMovie-custom:focus, 
        .btn.addMovie-custom:active, .btn-outline.addMovie-custom:active {
            outline: none; /* 클릭 시 기본 테두리 없애기 */
            box-shadow: none; /* 클릭 시 그림자 효과 없애기 */
            border-color: #fdd000; /* 클릭 시 테두리 색상 고정 */
            background-color: #e6c200; /* 클릭 시 배경색 고정 */
            color: white; /* 클릭 시 글씨 색상 고정 */
        }

        .btn-outline.addMovie-custom {
            background-color: white;
            color: #fdd000;
            border-color: #fdd000;
        }

        /* Selected state */
        .btn.addMovie-custom.selected {
            background-color: #fdd000;
            color: white !important;
            border-color: #fdd000;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex justify-content-between align-items-center">
            <h2>영화 추가</h2>
            <a href="${pageContext.request.contextPath}/admin/adminMain?page=movieList" 
               class="btn btn addMovie-custom">영화 리스트</a>
        </div>

        <form id="addMovieForm" 
              action="${pageContext.request.contextPath}/admin/addMovie" 
              method="post" enctype="multipart/form-data">
              
            <!-- 영화 제목 -->
            <div class="form-group">
                <label for="movieTitle">영화 제목</label>
                <input type="text" class="form-control addMovie-custom" id="movieTitle" 
                       name="movieTitle" placeholder="영화 제목을 입력하세요" required>
            </div>

            <!-- 개봉일 -->
            <div class="form-group">
                <label for="movieStartDate">개봉일</label>
                <input type="date" class="form-control addMovie-custom" id="movieStartDate" 
                       name="movieStartDate" placeholder="개봉일을 입력하세요" required>
            </div>

            <!-- 종료일 -->
            <div class="form-group">
                <label for="movieEndDate">종료일</label>
                <input type="date" class="form-control addMovie-custom" id="movieEndDate" 
                       name="movieEndDate" placeholder="종료일을 입력하세요" required>
            </div>

            <!-- 감독 -->
            <div class="form-group">
                <label for="movieDirector">감독</label>
                <input type="text" class="form-control addMovie-custom" id="movieDirector" 
                       name="movieDirector" placeholder="감독을 입력하세요" required>
            </div>

            <!-- 배우 -->
            <div class="form-group">
                <label for="movieActor">배우</label>
                <input type="text" class="form-control addMovie-custom" id="movieActor" 
                       name="movieActor" placeholder="배우를 입력하세요" required>
            </div>

            <!-- 장르 -->
            <div class="form-group">
                <label for="movieGenre">장르</label>
                <div id="movieGenreButtons">
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '드라마')">드라마 (Drama)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '코미디')">코미디 (Comedy)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '액션')">액션 (Action)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '스릴러')">스릴러 (Thriller)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '공포')">공포 (Horror)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '범죄')">범죄 (Crime)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, 'SF')">SF (Science Fiction)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '판타지')">판타지 (Fantasy)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '로맨스')">로맨스 (Romance)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '모험')">모험 (Adventure)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '뮤지컬')">뮤지컬 (Musical)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '다큐멘터리')">다큐멘터리 (Documentary)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '전쟁')">전쟁 (War)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '가족')">가족 (Family)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '애니메이션')">애니메이션 (Animation)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '역사')">역사 (Historical)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '스포츠')">스포츠 (Sports)</button>
                    <button type="button" class="btn btn-outline addMovie-custom"
                            onclick="toggleAddMovieGenre(this, '미스터리')">미스터리 (Mystery)</button>
                </div>
                <!-- Hidden input to store selected genres -->
                <input type="hidden" id="movieSelectedGenres"
                       name="movieGenre" value="">
            </div>

            <!-- 연령제한 -->
            <div class="form-group">
                <label for="movieAgeLimit">연령제한</label>
                <select class="form-control addMovie-custom" id="movieAgeLimit"
                        name="movieAgeLimit" required>
                    <option value="All">전체 관람가</option>
                    <option value="12">12세 이상</option>
                    <option value="15">15세 이상</option>
                    <option value="19">19세 이상</option>
                </select>
            </div>

            <!-- 상영시간 -->
            <div class="form-group">
                <label for="movieShowtime">상영시간 (분)</label>
                <input type="number" class="form-control addMovie-custom" id="movieShowtime"
                       name="movieShowtime" placeholder="상영시간을 입력하세요" required>
            </div>

            <!-- 국적 -->
            <div class="form-group">
                <label for="movieNationality">국적</label>
                <input type="text" class="form-control addMovie-custom" id="movieNationality"
                       name="movieNationality" placeholder="국적을 입력하세요" required>
            </div>

            <!-- 줄거리 -->
            <div class="form-group">
                <label for="movieSummary">줄거리</label>
                <textarea class="form-control addMovie-custom" id="movieSummary"
                          name="movieSummary" placeholder="줄거리를 입력하세요" rows="3" required></textarea>
            </div>

            <!-- 이미지 파일 -->
            <div class="form-group">
                <label for="movieMainImage">Poster</label>
                <input type="file" class="form-control addMovie-custom" id="movieMainImage"
                       name="movieMainImageFile" required>
                <input type="file" class="form-control addMovie-custom" id="movieSubImage"
                       name="movieSubImageFile">
                <input type="file" class="form-control addMovie-custom" id="movieSsubImage"
                       name="movieSsubImageFile">
            </div>

            <!-- Trailer 파일 -->
            <div class="form-group">
                <label for="movieTrailerFile">Trailer 영상</label>
                <input type="file" class="form-control addMovie-custom" id="movieTrailerFile"
                       name="movieTrailerFile" required>
            </div>

            <!-- Trailer 링크 -->
            <div class="form-group">
                <label for="movieMainTrailer">Trailer's Link</label>
                <input type="text" class="form-control addMovie-custom" id="movieMainTrailer"
                       name="movieMainTrailer" placeholder="링크를 입력하세요" required>
                <input type="text" class="form-control addMovie-custom" id="movieSubTrailer"
                       name="movieSubTrailer" placeholder="링크를 입력하세요">
                <input type="text" class="form-control addMovie-custom" id="movieSsubTrailer"
                       name="movieSsubTrailer" placeholder="링크를 입력하세요">
            </div>

            <!-- 썸네일 파일 -->
            <div class="form-group">
                <label for="movieMainThumbnailFile">Thumbnail</label>
                <input type="file" class="form-control addMovie-custom" id="movieMainThumbnailFile"
                       name="movieMainThumbnailFile" required>
                <input type="file" class="form-control addMovie-custom" id="movieSubThumbnailFile"
                       name="movieSubThumbnailFile">
                <input type="file" class="form-control addMovie-custom" id="movieSsubThumbnailFile"
                       name="movieSsubThumbnailFile">
            </div>

            <!-- 제출 버튼 -->
            <div class="d-flex justify-content-end mt-3">
                <button type="submit" class="btn btn addMovie-custom">영화 추가</button>
            </div>
        </form>
    </div>

    <script>
        function toggleAddMovieGenre(button, genre) {
            const selectedGenres = document.getElementById('movieSelectedGenres');
            const genresArray = selectedGenres.value ? selectedGenres.value.split(',') : [];

            const genreIndex = genresArray.indexOf(genre);
            if (genreIndex === -1) {
                genresArray.push(genre);
                button.classList.remove('btn-outline');
                button.classList.add('selected');
            } else {
                genresArray.splice(genreIndex, 1);
                button.classList.remove('selected');
                button.classList.add('btn-outline');
            }

            selectedGenres.value = genresArray.join(',');
            // 포커스 해제
            button.blur();
        }

        // Form submission validation
        document.getElementById("addMovieForm").onsubmit = function(event) {
            const mainThumbnailFile = document.getElementById('movieMainThumbnailFile');
            const subThumbnailFile = document.getElementById('movieSubThumbnailFile');
            const ssubThumbnailFile = document.getElementById('movieSsubThumbnailFile');
            const mainTrailerFile = document.getElementById('movieMainTrailer');
            const subTrailerFile = document.getElementById('movieSubTrailer');
            const ssubTrailerFile = document.getElementById('movieSsubTrailer');
            const subImageFile = document.getElementById('movieSubImage');
            const ssubImageFile = document.getElementById('movieSsubImage');

            if (!mainThumbnailFile.value) {
                mainThumbnailFile.value = ""; // 기본값 설정
            }
            if (!subThumbnailFile.value) {
                subThumbnailFile.value = ""; // 기본값 설정
            }
            if (!ssubThumbnailFile.value) {
                ssubThumbnailFile.value = ""; // 기본값 설정
            }
            if (!mainTrailerFile.value) {
                mainTrailerFile.value = ""; // 기본값 설정
            }
            if (!subTrailerFile.value) {
                subTrailerFile.value = ""; // 기본값 설정
            }
            if (!ssubTrailerFile.value) {
                ssubTrailerFile.value = ""; // 기본값 설정
            }
            if (!subImageFile.value) {
                subImageFile.value = ""; // 기본값 설정
            }
            if (!ssubImageFile.value) {
                ssubImageFile.value = ""; // 기본값 설정
            }
        };
    </script>
</body>
</html>
