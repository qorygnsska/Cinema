<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 목록</title>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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

.movie-thumbnail {
	width: 50px;
	height: auto;
}

.trailer-thumbnail {
	width: 50px;
	height: auto;
	cursor: pointer;
}
.form-control:focus, .form-control:active,
.btn-primary.custom:focus, .btn-outline-primary.custom:focus,
	.btn-primary.custom:active, .btn-outline-primary.custom:active {
	outline: none !important; /* 클릭 시 기본 테두리 없애기 */
	box-shadow: none !important; /* 클릭 시 그림자 효과 없애기 */
	border-color: #fdd000 !important; /* 클릭 시 테두리 색상 고정 */
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

/* 테이블에 가로 스크롤바 추가 */
.table-responsive {
	overflow-x: auto;
	white-space: nowrap;
}

.table thead th {
	white-space: nowrap;
}
.table tbody td {
	white-space: nowrap;
}
 .btn-danger {
        margin-top: 10px; /* 버튼을 위에서 10px 아래로 이동 */
        display: block; /* 버튼을 블록 레벨로 처리하여 중앙 정렬 */
        width: 100%; /* 버튼이 부모 컨테이너의 100% 너비를 차지하도록 설정 */
    }
</style>

</head>
<body>

<div class="container-fluid mt-5">
    <div class="d-flex justify-content-between align-items-center mb-7">
        <h2>영화 목록</h2>
          <!-- 검색 입력 필드 추가 -->
        <input type="text" id="searchInput" class="form-control" placeholder="영화 제목 검색" style="width: 300px;">
    </div>

    <div class="table-responsive">
        <table class="table table-bordered table-hover">
            <thead style="background-color: #fdd000 !important; font-size: 0.8rem;">
				<tr >
                <th scope="col" style="background-color: #fdd000 !important;">#</th>
                <th scope="col" style="background-color: #fdd000 !important;">제목</th>
                <th scope="col" style="background-color: #fdd000 !important;">개봉일</th>
                <th scope="col" style="background-color: #fdd000 !important;">종료일</th>
                <th scope="col" style="background-color: #fdd000 !important;">감독</th>
                <th scope="col" style="background-color: #fdd000 !important;">배우</th>
                <th scope="col" style="background-color: #fdd000 !important;">장르</th>
                <th scope="col" style="background-color: #fdd000 !important;">연령 제한</th>
                <th scope="col" style="background-color: #fdd000 !important;">상영 시간</th>
                <th scope="col" style="background-color: #fdd000 !important;">국적</th>
                <th scope="col" style="background-color: #fdd000 !important;">Main Poster</th>
                <th scope="col" style="background-color: #fdd000 !important;">Sub Poster1</th>
                <th scope="col" style="background-color: #fdd000 !important;">Sub Poster2</th>            
                 <th scope="col" style="background-color: #fdd000 !important;">Main Thumbnail</th>
                  <th scope="col" style="background-color: #fdd000 !important;">Sub Thumbnail1</th>
                   <th scope="col" style="background-color: #fdd000 !important;">Sub Thumbnail2</th>
                   <th scope="col" style="background-color: #fdd000 !important;">Teaser</th>
                <th scope="col" style="background-color: #fdd000 !important;">액션</th>
				</tr>
			</thead>
            <tbody>
                <c:forEach var="movie" items="${movies}">
					<tr>
						<th scope="row">${movie.movieNo}</th>
						<td>${movie.movieTitle}</td>
						<td><fmt:formatDate value="${movie.movieStartDate}" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${movie.movieEndDate}" pattern="yyyy-MM-dd" /></td>
						<td>${movie.movieDirector}</td>
						<td>${movie.movieActor}</td>
						<td>${movie.movieGenre}</td>
						<td>${movie.movieAgeLimit}</td>
						<td>${movie.movieShowtime}분</td>
						<td>${movie.movieNationality}</td>
						<td><c:if test="${not empty movie.movieMainImage}">
								<img src="${path}/resources/img/movie/poster/${movie.movieMainImage}"
									class="movie-thumbnail" alt="메인 이미지">
							</c:if></td>
						<td><c:if test="${not empty movie.movieSubImage}">
								<img
									src="${path}/resources/img/movie/poster/${movie.movieSubImage}"
									class="movie-thumbnail" alt="서브 이미지1">
							</c:if></td>
						<td><c:if test="${not empty movie.movieSsubImage}">
								<img
									src="${path}/resources/img/movie/poster/${movie.movieSsubImage}"
									class="movie-thumbnail" alt="서브 이미지2">
							</c:if></td>
							
							<td><c:if test="${not empty movie.movieMainThumbnail}">
								<img
									src="${path}/resources/img/movie/Thumbnail/${movie.movieMainThumbnail}"
									class="movie-thumbnail" alt="Main Thumbnail">
							</c:if></td>
							<td><c:if test="${not empty movie.movieSubThumbnail}">
								<img
									src="${path}/resources/img/movie/Thumbnail/${movie.movieSubThumbnail}"
									class="movie-thumbnail" alt="Sub Thumbnail1">
							</c:if></td>
							<td><c:if test="${not empty movie.movieSsubThumbnail}">
								<img
									src="${path}/resources/img/movie/Thumbnail/${movie.movieSsubThumbnail}"
									class="movie-thumbnail" alt="Sub Thumbnail2">
							</c:if></td>
							
														
						<td><c:if test="${not empty movie.movieTrailer}">
								<img
									src="${pageContext.request.contextPath}/resources/img/movie/icon-play.png"
									class="trailer-thumbnail" alt="트레일러 보기" data-toggle="modal"
									data-target="#trailerModal"
									data-trailer="${path}/resources/img/movie/teaser/${movie.movieTrailer}">
							</c:if></td>
         <td>   <form action="${pageContext.request.contextPath}/admin/deleteMovie" method="post" onsubmit="return confirm('정말 삭제하시겠습니까?');">
                <input type="hidden" name="movieNo" value="${movie.movieNo}">
                <button type="submit" class="btn btn-sm btn-danger">삭제</button>
            </form></td>
					</tr>
				</c:forEach>
            </tbody>
        </table>
    </div>
        <!-- 페이지네이션 -->
    <div class="pagination">
        <!-- 페이지네이션 링크가 JavaScript로 동적으로 추가됩니다 -->
    </div>
    
    

</div>
<!-- Modald 이미지 크게 보기  -->
<div class="modal fade" id="imageModal" tabindex="-1" role="dialog" aria-labelledby="imageModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="imageModalLabel">Image Preview</h5>
      </div>
      <div class="modal-body">
        <img id="modalImage" src="" class="img-fluid" alt="Image Preview">
      </div>
    </div>
  </div>
</div>
<style>
  /* 이미지 크기를 조정 */
  #modalImage {
      max-width: 100%; /* 이미지가 모달의 너비를 넘지 않도록 제한 */
      height: auto; /* 비율을 유지하며 높이를 자동 조정 */
  }

  /* 이미지가 원래 크기보다 커지도록 */
  .modal-body {
      text-align: center; /* 이미지가 모달의 중앙에 오도록 정렬 */
  }
</style>

<!-- 트레일러 모달 -->
<div class="modal fade" id="trailerModal" tabindex="-1" aria-labelledby="trailerModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="trailerModalLabel">트레일러</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <video id="trailerVideo" controls style="width: 100%;">
          <source src="" type="video/mp4">
          브라우저가 video 태그를 지원하지 않습니다.
        </video>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
    $('#trailerModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); 
        var trailerSrc = button.data('trailer'); 
        var modal = $(this);
        var video = modal.find('#trailerVideo');
        video.find('source').attr('src', trailerSrc);
        video[0].load();
    });

    $('#trailerModal').on('hide.bs.modal', function (event) {
        var modal = $(this);
        var video = modal.find('#trailerVideo');
        video[0].pause();
    });
</script>
<script>
function deleteMovie(movieNo) {
    $.ajax({
        url: '/deleteMovie',
        type: 'POST',
        data: { movieNo: movieNo },
        success: function(response) {
            alert('Movie deleted successfully.');
            // Perform additional actions if needed
        },
        error: function(error) {
            alert('Error deleting movie: ' + error.responseText);
        }
    });
}
</script>
<script> // 이미지 크게보기 
    document.addEventListener("DOMContentLoaded", function() {
        const thumbnails = document.querySelectorAll('.movie-thumbnail');
        
        thumbnails.forEach(function(thumbnail) {
            thumbnail.addEventListener('click', function() {
                const imgSrc = thumbnail.getAttribute('src');
                const modalImage = document.getElementById('modalImage');
                modalImage.setAttribute('src', imgSrc);

                $('#imageModal').modal('show');
            });
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        const searchInput = document.getElementById('searchInput');
        const tableRows = document.querySelectorAll('tbody tr');

        searchInput.addEventListener('keyup', function() {
            const filter = searchInput.value.toLowerCase();
            tableRows.forEach(function(row) {
                const movieTitle = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
                if (movieTitle.includes(filter)) {
                    row.style.display = ''; // 제목이 포함된 경우 행을 표시
                } else {
                    row.style.display = 'none'; // 제목이 포함되지 않은 경우 행을 숨김
                }
            });
        });
    });
</script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    const searchInput = document.getElementById('searchInput');
    const tableBody = document.querySelector('tbody');
    let movies = [...tableBody.rows]; // 초기 데이터 저장

    const renderTable = (filteredMovies) => {
        tableBody.innerHTML = ''; // 테이블 초기화
        filteredMovies.forEach(movie => {
            tableBody.appendChild(movie);
        });
    };

    const paginate = (movies, pageNumber, pageSize) => {
        const start = (pageNumber - 1) * pageSize;
        const end = start + pageSize;
        return movies.slice(start, end);
    };

    searchInput.addEventListener('keyup', function() {
        const filter = searchInput.value.toLowerCase();
        const filteredMovies = movies.filter(row => {
            const movieTitle = row.querySelector('td:nth-child(2)').textContent.toLowerCase();
            return movieTitle.includes(filter);
        });
        renderTable(paginate(filteredMovies, 1, 7)); // 검색 시 첫 페이지로 이동
        updatePagination(filteredMovies.length, 1, 7);
    });

    const updatePagination = (totalItems, currentPage, pageSize) => {
        const pagination = document.querySelector('.pagination');
        const totalPages = Math.ceil(totalItems / pageSize);
        pagination.innerHTML = '';

        for (let i = 1; i <= totalPages; i++) {
            const pageLink = document.createElement('a');
            pageLink.href = "#";
            pageLink.textContent = i;
            pageLink.className = i === currentPage ? 'active' : '';
            pageLink.addEventListener('click', (e) => {
                e.preventDefault();
                renderTable(paginate(movies, i, pageSize));
                updatePagination(totalItems, i, pageSize);
            });
            pagination.appendChild(pageLink);
        }
    };

    // 초기 페이지네이션 설정
    updatePagination(movies.length, 1, 7);
    renderTable(paginate(movies, 1, 7));
});


</script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>