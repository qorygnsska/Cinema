<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	display: none;
}

.join--ok {
	color: blue;
	display: none;
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
				<form class="join--form" id="join--form" action="${path}/join"
					method="post">
					<table>
						<tr>
							<td colspan="2" class="join--kind"><label for="memberId"><i
									class="fa-solid fa-asterisk" style="color: #ff0000;"></i>&nbsp;아이디</label></td>
							<td colspan="2"><input type="text"
								class="form-control join--form--control" id="memberId" name="id" />
								<span id="join--idWarning" class="join--warning"> <strong>아이디는
										4~12자 사이의 영어, 숫자, 특수문자만 사용 가능합니다.</strong>
							</span> <span id="join--dup--idWarning" class="join--warning"> <strong>중복된
										아이디입니다.</strong>
							</span></td>
						</tr>
						<tr>
							<td style="padding: 7px"><br></td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label for="password"><i
									class="fa-solid fa-asterisk" style="color: #ff0000;"></i>&nbsp;비밀번호</label></td>
							<td colspan="2"><input type="password"
								class="form-control join--form--control" id="join--password"
								name="password"> <span id="join--passwordWarning"
								class="join--warning"><strong> 비밀번호는 8 ~ 16자 사이의
										영어, 숫자, 특수문자만 사용 가능합니다.</strong> </span></td>
						</tr>
						<tr>
							<td style="padding: 7px"><br></td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label
								for="passwordConfirm"><i class="fa-solid fa-asterisk"
									style="color: #ff0000;"></i>&nbsp;비밀번호 확인</label></td>
							<td colspan="2"><input type="password"
								class="form-control join--form--control"
								id="join--passwordConfirm" name="passwordConfirm"></td>
						</tr>
						<tr>
							<td colspan="2" style="padding: 7px"><br></td>
							<td colspan="2" style="color: red;"><strong
								id="join--confirmWarning" class="join--warning">비밀번호가
									일치하지 않습니다.</strong></td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label for="email"><i
									class="fa-solid fa-asterisk" style="color: #ff0000;"></i>&nbsp;이메일</label></td>
							<td style="display: flex; align-items: center;"><input
								type="text" class="form-control join--form--control"
								id="memberEmail" name="email" /> <a> <i
									class="fa-solid fa-at" style="margin: 0px 5px; color: #5a6b77;"></i>
							</a> <input type="text" id="customDomainInput"
								class="form-control join--form--control" name="emailDomain"
								disabled="disabled"></td>
							<td style="padding-left: 0;">
								<div class="btn-group">
									<button type="button" class="btn btn-warning dropdown-toggle"
										data-bs-toggle="dropdown" aria-expanded="false"
										id="join--email--dropdown" name="emailDomain">도메인 선택</button>
									<ul class="dropdown-menu join--dropdown--menu"
										id="emailDropdown">
										<li><a class="dropdown-item join--dropdown--item"
											data-domain="naver.com">naver.com</a></li>
										<li><a class="dropdown-item join--dropdown--item"
											data-domain="gmail.com">gmail.com</a></li>
										<li><a class="dropdown-item join--dropdown--item"
											data-domain="daum.net">daum.net</a></li>
										<li><a class="dropdown-item join--dropdown--item"
											data-domain="nate.com">nate.com</a></li>
										<li><a class="dropdown-item join--dropdown--item"
											id="customEmail">직접 입력</a></li>
									</ul>
								</div>
							</td>
						</tr>
						<tr>
							<td style="padding: 7px"><br></td>
							<td colspan="2"><strong id="join--email--warning"
								class="join--warning">사용 불가능한 이메일입니다.</strong> <strong
								id="join--emailAuth--ok" class="join--ok">이메일 인증완료</strong></td>
							<td
								style="display: flex; justify-content: flex-end; padding: 7px 10px;">
								<button id="join--emailAuth" type="button"
									onclick="emailAuth(500, 300);">이메일 인증</button>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label for="name"><i
									class="fa-solid fa-asterisk" style="color: #ff0000;"></i>&nbsp;이름</label></td>
							<td colspan="2"><input type="text"
								class="form-control join--form--control" name="name" id="name"></td>
						</tr>
						<tr>
							<td style="padding: 7px"><br></td>
						</tr>
						<tr>
							<td colspan="2" class="join--kind"><label for="phone"><i
									class="fa-solid fa-asterisk" style="color: #ff0000;"></i>&nbsp;전화번호</label></td>
							<td colspan="2"><input type="text"
								class="form-control join--form--control phone-input"
								id="join--phone" name="phone" maxlength="13"></td>
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

	<script>
		const minLength = 8;
		const maxLength = 16;
		const idMinLength = 4;
		const idMaxLength = 12;
		const passwordInput = $('#join--password');
		const passwordWarning = $('#join--passwordWarning');
		const passwordConfirm = $('#join--passwordConfirm');
		const confirmWarning = $('#join--confirmWarning');
		const memberIdInput = $('#memberId');
		const idWarning = $('#join--idWarning');
		const idDupWarning = $('#join--dup--idWarning');
		const phoneInput = $('#join--phone');
		emailInput = $('#memberEmail');
		const emailDropdown = $('#emailDropdown');
		customDomainInput = $('#customDomainInput');
		const dropdownButton = $('#join--email--dropdown');
		const emailWarning = $('#join--email--warning');
		selectedDomain = '';
		let emailForAuth = '';
		let phoneFocused = false;
		const path = '${path}';

		// id 중복체크 ajax
		memberIdInput.on('input', function() {
			const idValue = memberIdInput.val();
			const idLength = idValue.length;
			if (idLength >= 4 && idLength <= 12) {
				$.ajax({
					type : 'post',
					url : path + '/idCheck',
					data : {
						id : memberIdInput.val()
					},
					dataType : 'json',
					success : function(data) {
						if (data === 0) {
							idDupWarning.hide();
						} else {
							idDupWarning.show();
						}
					}
				})
			} else {
				idDupWarning.hide();
			}
		});

		// email 중복체크 ajax
		customDomainInput.on('input', function() {
			let totalEmail = emailInput.val() + '@' + customDomainInput.val();
			emailForAuth = totalEmail;
			$.ajax({
				type : 'post',
				url : path + '/emailCheck',
				data : {
					email : totalEmail
				},
				dataType : 'json',
				success : function(data) {
					if (data === 0) {
						emailWarning.hide();
					} else {
						emailWarning.show();
					}
				}
			})

		});

		// email 중복체크2 ajax
		emailDropdown.on('click', function() {
			let totalEmail = emailInput.val() + '@' + selectedDomain;
			emailForAuth = totalEmail;
			$.ajax({
				type : 'post',
				url : path + '/emailCheck',
				data : {
					email : totalEmail
				},
				dataType : 'json',
				success : function(data) {
					if (data === 0) {
						emailWarning.hide();
					} else {
						emailWarning.show();
					}
				}
			})
		});

		// email 중복체크(아이디부분 작성 시) ajax
		emailInput.on('input', function() {
			let totalEmail = emailInput.val() + '@' + customDomainInput.val();
			emailForAuth = totalEmail;
			$.ajax({
				type : 'post',
				url : path + '/emailCheck',
				data : {
					email : totalEmail
				},
				dataType : 'json',
				success : function(data) {
					if (data === 0) {
						emailWarning.hide();
					} else {
						emailWarning.show();
					}
				}
			})

		});

		// email 중복체크(아이디부분 작성 시)2 ajax
		emailInput.on('input', function() {
			let totalEmail = emailInput.val() + '@' + selectedDomain;
			emailForAuth = totalEmail;
			$.ajax({
				type : 'post',
				url : path + '/emailCheck',
				data : {
					email : totalEmail
				},
				dataType : 'json',
				success : function(data) {
					if (data === 0) {
						emailWarning.hide();
					} else {
						emailWarning.show();
					}
				}
			})

		});
	</script>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
