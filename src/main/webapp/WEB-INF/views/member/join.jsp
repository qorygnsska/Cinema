<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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

#customDomainInput {
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
							<td colspan="3"><input type="text" class="form-control"
								id="memberId" name="id" /> <span id="join--idWarning"
								class="join--warning"> <strong>아이디는 4~12자 사이의
										영어, 숫자만 사용 가능합니다.</strong>
							</span></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="password">비밀번호</label></td>
							<td colspan="3"><input type="password" class="form-control"
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
							<td colspan="3"><input type="password" class="form-control"
								id="join--passwordConfirm" name="passwordConfirm"></td>
						</tr>
						<tr>
							<td><br></td>
							<td colspan="3" style="color: red;"><strong
								id="join--confirmWarning" class="join--warning">비밀번호가
									일치하지 않습니다.</strong></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="email">이메일</label></td>
							<td style="padding-right: 15px;"><input type="text"
								class="form-control" id="memberEmail" name="email" /></td>
							<td><a>@</a></td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn btn-warning dropdown-toggle"
										data-bs-toggle="dropdown" aria-expanded="false"
										id="join--email--dropdown">도메인 선택</button>
									<ul class="dropdown-menu" id="emailDropdown">
										<li><a class="dropdown-item" href="#"
											data-domain="naver.com">naver.com</a></li>
										<li><a class="dropdown-item" href="#"
											data-domain="google.com">google.com</a></li>
										<li><a class="dropdown-item" href="#"
											data-domain="daum.net">daum.net</a></li>
										<li><a class="dropdown-item" href="#"
											data-domain="nate.com">nate.com</a></li>
										<li><a class="dropdown-item" href="#" id="customEmail">직접
												입력</a></li>
									</ul>
								</div> <input type="text" id="customDomainInput" class="form-control"
								placeholder="직접 입력할 도메인">

							</td>
						</tr>
						<tr>
							<td><br></td>
							<td colspan="3" style="color: red;"><strong>사용 불가능한
									이메일입니다.</strong></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="name">이름</label></td>
							<td colspan="3"><input type="text" class="form-control"
								name="name" id="name"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="gender">성별</label></td>
							<td colspan="3"><input class="form-check-input" type="radio"
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
							<td colspan="3"><input type="text"
								class="form-control phone-input" id="join--phone" name="phone"
								maxlength="13"></td>
						</tr>
						<tr>
							<td><br> <br></td>
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
    $(document).ready(function() {
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
        const phoneInput = $('#join--phone');
        const ssn1Input = $('#join--ssn1');
        const ssn2Input = $('#join--ssn2');
        const emailInput = $('#memberEmail');
        const emailDropdown = $('#emailDropdown');
        const customDomainInput = $('#customDomainInput');
        let phoneFocused = false;

        // 비밀번호 입력 필드의 최대 길이 제한 및 유효성 검사
        passwordInput.on('input', function() {
            const passwordLength = passwordInput.val().length;
            if (passwordLength < minLength || passwordLength > maxLength) {
                passwordWarning.show();
            } else {
                passwordWarning.hide();
            }
        });
        
        // 비밀번호 확인과 일치 여부 확인
        passwordConfirm.on('input', function() {
            if (passwordInput.val() !== passwordConfirm.val()) {
                confirmWarning.show();
            } else {
                confirmWarning.hide();
            }
        });
        
        // 아이디 글자수 검사
        memberIdInput.on('input', function() {
            const idValue = memberIdInput.val();
            const lengthValid = idValue.length >= idMinLength && idValue.length <= idMaxLength;
            const validChars = /^[a-zA-Z0-9]+$/.test(idValue);
            if (!lengthValid || !validChars) {
                idWarning.show();
            } else {
                idWarning.hide();
            }
        });
        
        // 전화번호 입력 처리
        phoneInput.on('focus', function() {
            if (!phoneFocused) {
                phoneInput.val('010-');
                phoneFocused = true;
            }
        });

        phoneInput.on('input', function() {
            let phoneValue = phoneInput.val().replace(/[^0-9]/g, ''); // 숫자만 남기기
            if (phoneValue.length > 11) {
                phoneValue = phoneValue.substring(0, 11); // 최대 11자리
            }

            if (phoneValue.length > 3 && phoneValue.length <= 7) {
                phoneValue = phoneValue.replace(/(\d{3})(\d{1,4})/, '$1-$2');
            } else if (phoneValue.length > 7) {
                phoneValue = phoneValue.replace(/(\d{3})(\d{4})(\d{1,4})/, '$1-$2-$3');
            }

            phoneInput.val(phoneValue);
        });
        
        // 주민등록번호 입력 처리
        ssn1Input.on('input', function() {
            let ssn1Value = ssn1Input.val().replace(/[^0-9]/g, ''); // 숫자만 남기기
            if (ssn1Value.length > 6) {
                ssn1Value = ssn1Value.substring(0, 6); // 최대 6자리
            }

            ssn1Input.val(ssn1Value);

            if (ssn1Value.length === 6) {
                ssn2Input.focus(); // 6자리 입력 후 뒷칸으로 포커스 이동
            }
        });
        
        ssn2Input.on('input', function() {
            let ssn2Value = ssn2Input.val().replace(/[^0-9]/g, ''); // 숫자만 남기기
            if (ssn2Value.length > 7) {
                ssn2Value = ssn2Value.substring(0, 7); // 최대 7자리
            }
            ssn2Input.val(ssn2Value);
        });
        
        // 이메일 도메인 선택 및 직접 입력 처리
        emailDropdown.on('click', '.dropdown-item', function(e) {
            e.preventDefault();
            const domain = $(this).data('domain');
            if (domain === 'custom') {
                customDomainInput.show().focus();
            } else {
                emailInput.val(emailInput.val() + '@' + domain);
                customDomainInput.hide();
            }
        });

        // "직접 입력" 선택 처리
        $('#customEmail').on('click', function(e) {
            e.preventDefault();
            customDomainInput.show().focus();
        });

        // 사용자 입력을 이메일 입력 필드에 적용
        customDomainInput.on('blur', function() {
            const customDomain = $(this).val();
            if (customDomain) {
                emailInput.val(emailInput.val() + '@' + customDomain);
            }
            $(this).hide();
        });

        // 직접 입력을 완료한 후 이메일 입력 필드 갱신
        customDomainInput.on('keypress', function(e) {
            if (e.which === 13) { // Enter key
                $(this).blur();
            }
        });
    });
    });
    </script>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>
