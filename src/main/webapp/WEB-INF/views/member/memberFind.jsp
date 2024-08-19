<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JERRY - 아이디/비밀번호 찾기</title>
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- css -->
<link href="${path}/resources/css/member/find.css" rel="stylesheet" />
</head>
<body>

	<c:if test="${!empty msg}">
		<script>
			alert('${msg}');
		</script>
	</c:if>
	<c:if test="${!empty findFailMsg}">
		<script>
			alert('${findFailMsg}');
		</script>
	</c:if>

	<div class="memberFind--bigWrap">
		<div class="memberFind--idWrap">
			<h3 class="memberFind--title">아이디 찾기</h3>
			<div class="memberFind--formWrap">
				<form action="${path}/findId" method="post"
					class="memberFind--find--form" onsubmit="validateForm(event)">
					<table>
						<tr>
							<td class="memberFind--find--kind"><label for="name">이름</label></td>
							<td colspan="2"><input type="text" placeholder="이름 입력"
								class="form-control" name="name" id="name"></td>
						</tr>
						<tr>
							<td class="memberFind--find--kind"><label for="phone">전화번호</label></td>
							<td colspan="2"><input type="text" placeholder="전화번호 입력"
								class="form-control phone-input" id="phone" name="phone"
								maxlength="13"></td>
						</tr>
						<tr>
							<td class="memberFind--find--kind"><label for="email">이메일</label></td>
							<td colspan="2"><input type="email" placeholder="이메일 입력"
								class="form-control" name="email" id="email"></td>
						</tr>
						<tr>
							<td colspan="3">
								<button type="submit" style="border-radius: 25px;"
									class="btn btn-outline-dark">아이디 찾기</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<div class="memberFind--pwWrap">
			<h3 class="memberFind--title">비밀번호 재설정</h3>
			<div class="memberFind--formWrap">
				<form action="${path}/findPw" method="post"
					class="memberFind--find--form">
					<table>
						<tr>
							<td class="memberFind--find--kind"><label for="name">이름</label></td>
							<td colspan="2"><input type="text" placeholder="이름 입력"
								class="form-control" name="name" id="name"></td>
						</tr>
						<tr>
							<td class="memberFind--find--kind"><label for="memberId">아이디</label></td>
							<td colspan="2"><input type="text" placeholder="아이디 입력"
								class="form-control" id="memberFind--memberId" name="id" /></td>
						</tr>
						<tr>
							<td class="memberFind--find--kind"><label for="email">이메일</label></td>
							<td colspan="2"><input type="email" placeholder="이메일 입력"
								class="form-control" name="email" id="email"></td>
						</tr>
						<tr>
							<td colspan="3">
								<button type="submit" style="border-radius: 25px;"
									class="btn btn-outline-dark">이메일 인증</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	
	<script>
	function validatePhoneNumber(phone) {
		var phonePattern = /^010-\d{4}-\d{4}$/;
		return phonePattern.test(phone);
	}

	function validateForm(event) {
		var phoneInput = document.getElementById('phone').value;
		if (!validatePhoneNumber(phoneInput)) {
			event.preventDefault();
			alert('전화번호를 올바르게 입력해주세요.\n ex) 010-xxxx-xxxx');
		}
	}
	
    // 전화번호 입력 처리
    let phoneFocused = false;
    const phoneInput = $('#phone');
    phoneInput.on('focus', function() {
        if (!phoneFocused) {
            phoneInput.val('010-');
            phoneFocused = true;
        }
    });

    phoneInput.on('input', function() {
        let phoneValue = phoneInput.val().replace(/[^0-9]/g, '');
        if (phoneValue.length > 11) {
            phoneValue = phoneValue.substring(0, 11);
        }

        if (phoneValue.length > 3 && phoneValue.length <= 7) {
            phoneValue = phoneValue.replace(/(\d{3})(\d{1,4})/, '$1-$2');
        } else if (phoneValue.length > 7) {
            phoneValue = phoneValue.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
        }

        phoneInput.val(phoneValue);
    });
</script>

	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>