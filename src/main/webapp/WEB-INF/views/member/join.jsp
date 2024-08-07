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
							<td colspan="2" class="join--kind"><label for="memberId">아이디</label></td>
							<td colspan="2"><input type="text" class="form-control"
								id="memberId" name="id" /> <span id="join--idWarning"
								class="join--warning"> <strong>아이디는 4~12자 사이의
										영어, 숫자만 사용 가능합니다.</strong>
							</span> <span id="join--dup--idWarning" class="join--warning"> <strong>중복된
										아이디입니다.</strong>
							</span></td>
						</tr>
						<tr>
							<td style="padding: 7px"><br></td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label for="password">비밀번호</label></td>
							<td colspan="2"><input type="password" class="form-control"
								id="join--password" name="password"> <span
								id="join--passwordWarning" class="join--warning"><strong>
										비밀번호는 8 ~ 16자 사이의 영어, 숫자, 특수문자만 사용 가능합니다.</strong> </span></td>
						</tr>
						<tr>
							<td style="padding: 7px"><br></td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label
								for="passwordConfirm">비밀번호 확인</label></td>
							<td colspan="2"><input type="password" class="form-control"
								id="join--passwordConfirm" name="passwordConfirm"></td>
						</tr>
						<tr>
							<td colspan="2" style="padding: 7px"><br></td>
							<td colspan="2" style="color: red;"><strong
								id="join--confirmWarning" class="join--warning">비밀번호가
									일치하지 않습니다.</strong></td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label for="email">이메일</label></td>
							<td style="display: flex; align-items: center;"><input
								type="text" class="form-control" id="memberEmail" name="email" />
								<a> <i class="fa-solid fa-at"
									style="margin: 0px 5px; color: #5a6b77;"></i>
							</a> <input type="text" id="customDomainInput" class="form-control"
								disabled="disabled"></td>
							<td style="padding-left: 0;">
								<div class="btn-group">
									<button type="button" class="btn btn-warning dropdown-toggle"
										data-bs-toggle="dropdown" aria-expanded="false"
										id="join--email--dropdown">도메인 선택</button>
									<ul class="dropdown-menu" id="emailDropdown">
										<li><a class="dropdown-item" data-domain="naver.com">naver.com</a></li>
										<li><a class="dropdown-item" data-domain="gmail.com">gmail.com</a></li>
										<li><a class="dropdown-item" data-domain="daum.net">daum.net</a></li>
										<li><a class="dropdown-item" data-domain="nate.com">nate.com</a></li>
										<li><a class="dropdown-item" id="customEmail">직접 입력</a></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<td style="padding: 7px"><br></td>
							<td colspan="2"><strong id="join--email--warning"
								class="join--warning">사용 불가능한 이메일입니다.</strong> 
								<strong id="join--emailAuth--ok" class="join--warning" style="color: blue;">이메일 인증완료</strong></td>
							<td
								style="display: flex; justify-content: flex-end; padding: 7px 10px;">
								<button id="join--emailAuth"  type="button"
									onclick="emailAuth();">이메일 인증</button>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label for="name">이름</label></td>
							<td colspan="2"><input type="text" class="form-control"
								name="name" id="name"></td>
						</tr>
						<tr>
							<td style="padding: 7px"><br></td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label for="gender">성별</label></td>
							<td colspan="2"><input class="form-check-input" type="radio"
								name="gender" id="genderMale" value="male"> <label
								class="form-check-label" for="genderMale"
								style="width: 30px; margin-right: 50px;">남성</label> <input
								class="form-check-input" type="radio" name="gender"
								id="genderFemale" value="female"> <label
								style="width: 30px;" class="form-check-label" for="genderFemale">여성</label></td>
						</tr>
						<tr>
							<td style="padding: 7px"><br></td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label for="ssn1">주민등록번호</label></td>
							<td colspan="2" style="display: flex; align-items: center;"><input
								type="text" class="form-control" style="width: 40%;"
								id="join--ssn1" aria-describedby="ssnHelp"> <a><i
									class="fa-solid fa-minus"
									style="margin: 0px 5px; color: #5a6b77;"></i></a> <input
								type="password" class="form-control" style="width: 40%;"
								id="join--ssn2" aria-describedby="ssnHelp"></td>
						</tr>
						<tr>
							<td style="padding: 7px"><br></td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label for="phone">전화번호</label></td>
							<td colspan="2"><input type="text"
								class="form-control phone-input" id="join--phone" name="phone"
								maxlength="13"></td>
						</tr>
						<tr>
							<td style="padding: 7px"><br> <br></td>
						</tr>
						<tr>
							<td colspan="4">
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
