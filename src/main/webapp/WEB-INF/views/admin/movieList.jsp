<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>영화 목록</title>
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

.btn-primary.custom:focus, .btn-outline-primary.custom:focus,
	.btn-primary.custom:active, .btn-outline-primary.custom:active {
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
</style>
</head>
<body>

<div class="container-fluid mt-5">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2>영화 목록</h2>
    </div>

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
        <th scope="col" style="background-color: #fdd000 !important;">메인 이미지</th>
        <th scope="col" style="background-color: #fdd000 !important;">서브 이미지1</th>
        <th scope="col" style="background-color: #fdd000 !important;">서브 이미지2</th>
        <th scope="col" style="background-color: #fdd000 !important;">예고편</th>
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
								<img src="${pageContext.request.contextPath}${movie.movieMainImage}"
									class="movie-thumbnail" alt="메인 이미지">
							</c:if></td>
						<td><c:if test="${not empty movie.movieSubImage}">
								<img
									src="${pageContext.request.contextPath}${movie.movieSubImage}"
									class="movie-thumbnail" alt="서브 이미지1">
							</c:if></td>
						<td><c:if test="${not empty movie.movieSsubImage}">
								<img
									src="${pageContext.request.contextPath}${movie.movieSsubImage}"
									class="movie-thumbnail" alt="서브 이미지2">
							</c:if></td>
						<td><c:if test="${not empty movie.movieTrailer}">
								<img
									src="${pageContext.request.contextPath}/resources/img/movie/icon-play.png"
									class="trailer-thumbnail" alt="트레일러 보기" data-toggle="modal"
									data-target="#trailerModal"
									data-trailer="${pageContext.request.contextPath}${movie.movieTrailer}">
							</c:if></td>
						<td> <a
							href="${pageContext.request.contextPath}/admin/deleteMovie?id=${movie.movieNo}"
							class="btn btn-sm btn-danger"
							onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a></td>
					</tr>
				</c:forEach>
        </tbody>
    </table>
    
    <!-- 페이지네이션 -->
    <div class="pagination">
        <c:if test="${currentPage > 1}">
            <a href="${pageContext.request.contextPath}/admin/adminMain?page=movieList&pageNumber=${currentPage - 1}" class="pagination-btn">이전</a>
        </c:if>
        <c:forEach var="i" begin="1" end="${totalPages}">
            <a href="${pageContext.request.contextPath}/admin/adminMain?page=movieList&pageNumber=${i}" class="pagination-btn ${i == currentPage ? 'active' : ''}">${i}</a>
        </c:forEach>
        <c:if test="${currentPage < totalPages}">
            <a href="${pageContext.request.contextPath}/admin/adminMain?page=movieList&pageNumber=${currentPage + 1}" class="pagination-btn">다음</a>
        </c:if>
    </div>
</div>

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

</body>
</html>