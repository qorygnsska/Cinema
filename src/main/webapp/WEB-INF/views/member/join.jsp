<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JERRY - Join</title>
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
</head>
<body>
	<!-- header -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<section>

		<!-- 
    MEMBER_ID VARCHAR2(255) PRIMARY KEY,						-- 회원 ID(PK)
    MEMBER_NAME VARCHAR2(255) NOT NULL,						-- 회원 이름
    MEMBER_PASSWORD VARCHAR2(255) NOT NULL,					-- 비번
    MEMBER_GENDER CHAR(1) NOT NULL,						-- 성별
    MEMBER_SOCIAL_SECURITY_NUM VARCHAR2(13) UNIQUE NOT NULL,			-- 주민번호
    MEMBER_PHONE VARCHAR2(13) NOT NULL,						-- 전화번호
    MEMBER_EMAIL VARCHAR2(255) UNIQUE NOT NULL,					-- 이메일
 -->
		<h2 class="join--title">회원가입</h2>
		<br>
		<div class="join--container">
			<div class="join--Wrap">

				<form class="join--form">
					<table>
						<tr>
							<td class="join--kind"><label for="memberId">아이디</label></td>
							<td colspan="2"><input type="text" class="form-control"
								id="memberId" name="id" /></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="password">비밀번호</label></td>
							<td colspan="2"><input type="password" class="form-control"
								id="password" name="password"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="passwordConfirm">비밀번호
									확인</label></td>
							<td colspan="2"><input type="password" class="form-control"
								id="passwordConfirm" name="passwordConfirm"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="email">이메일</label></td>
							<td colspan="2"><input type="email" class="form-control"
								name="email" id="email"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="name">이름</label></td>
							<td colspan="2"><input type="text" class="form-control"
								name="name" id="name"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="gender">성별</label></td>
							<td><input class="form-check-input" type="radio"
								name="gender" id="genderMale" value="male"> <label
								class="form-check-label" for="genderMale">남성</label></td>
							<td><input class="form-check-input" type="radio"
								name="gender" id="genderFemale" value="female"> <label
								class="form-check-label" for="genderFemale">여성</label></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="ssn1">주민등록번호</label></td>
							<td colspan="2"><input type="text" class="form-control"
								id="ssn1" maxlength="14" aria-describedby="ssnHelp"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td class="join--kind"><label for="phone">전화번호</label></td>
							<td colspan="2"><input type="text"
								class="form-control phone-input" id="phone" name="phone"
								maxlength="13"></td>
						</tr>
						<tr>
							<td><br> <br></td>
						</tr>
						<tr>
							<td colspan="3">
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