<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>JERRY - Join</title>
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<style>
.join--warning {
	color: red;
	display: none; /* 초기에는 숨김 */
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<section>
		<h2 class="join--title">회원가입</h2>
		<br>
		<div class="join--container">
			<div class="join--Wrap">
				<form class="join--form">
					<table>
						<tr>
							<td class="join--kind"><label for="memberId">아이디</label></td>
							<td colspan="4"><input type="text" class="form-control"
								id="memberId" name="id" /> <span id="join--idWarning"
								class="join--warning"> <strong>아이디는 4~12자 사이의
										영어, 숫자만 사용 가능합니다.</strong>
							</span> <span id="join--dup--idWarning" class="join--warning"> <strong>중복된
										아이디입니다.</strong>
							</span></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="password">비밀번호</label></td>
							<td colspan="4"><input type="password" class="form-control"
								id="join--password" name="password"> <span
								id="join--passwordWarning" class="join--warning"><strong>
										비밀번호는 8 ~ 16자 사이의 영어, 숫자, 특수문자만 사용 가능합니다.</strong> </span></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="passwordConfirm">비밀번호
									확인</label></td>
							<td colspan="4"><input type="password" class="form-control"
								id="join--passwordConfirm" name="passwordConfirm"></td>
						</tr>
						<tr>
							<td><br></td>
							<td colspan="4" style="color: red;"><strong
								id="join--confirmWarning" class="join--warning">비밀번호가
									일치하지 않습니다.</strong></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="email">이메일</label></td>
							<td style="padding-right: 15px;"><input type="text"
								class="form-control" id="memberEmail" name="email" /></td>
							<td><a>@</a></td>
							<td><input type="text"
								id="customDomainInput" class="form-control" disabled="disabled">
							</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn btn-warning dropdown-toggle"
										data-bs-toggle="dropdown" aria-expanded="false"
										id="join--email--dropdown">도메인 선택</button>
									<ul class="dropdown-menu" id="emailDropdown">
										<li><a class="dropdown-item" 
											data-domain="naver.com">naver.com</a></li>
										<li><a class="dropdown-item" 
											data-domain="google.com">google.com</a></li>
										<li><a class="dropdown-item"
											data-domain="daum.net">daum.net</a></li>
										<li><a class="dropdown-item"
											data-domain="nate.com">nate.com</a></li>
										<li><a class="dropdown-item" id="customEmail">직접
												입력</a></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<td><br></td>
							<td colspan="4"><strong id="join--email--warning" class="join--warning">사용 불가능한
									이메일입니다.</strong></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="name">이름</label></td>
							<td colspan="4"><input type="text" class="form-control"
								name="name" id="name"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="gender">성별</label></td>
							<td colspan="4"><input class="form-check-input" type="radio"
								name="gender" id="genderMale" value="male"> <label
								class="form-check-label" for="genderMale"
								style="margin-right: 100px;">남성</label> <input
								class="form-check-input" type="radio" name="gender"
								id="genderFemale" value="female"> <label
								class="form-check-label" for="genderFemale">여성</label></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="ssn1">주민등록번호</label></td>
							<td style="padding-right: 15px;"><input type="text"
								class="form-control" id="join--ssn1" maxlength="14"
								aria-describedby="ssnHelp"></td>
							<td>-</td>
							<td style="padding-left: 15px;"><input type="password"
								class="form-control" id="join--ssn2" maxlength="14"
								aria-describedby="ssnHelp"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="phone">전화번호</label></td>
							<td colspan="4"><input type="text"
								class="form-control phone-input" id="join--phone" name="phone"
								maxlength="13"></td>
						</tr>
						<tr>
							<td><br> <br></td>
						</tr>
						<tr>
							<td colspan="5">
								<button type="submit" style="border-radius: 25px;"
									class="btn btn-outline-dark">회원가입</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
