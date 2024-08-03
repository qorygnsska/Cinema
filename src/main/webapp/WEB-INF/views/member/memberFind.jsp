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
<title>아이디/비밀번호 찾기</title>
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
<link href="${path}/resources/css/member/find.css" rel="stylesheet" />

</head>
<body>
	<div>
		<div>
			<div>
				<form>
					<table>
						<tr>
							<td colspan="2">
								<h3>아이디 찾기</h3>
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" placeholder="이름 입력" /></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="phone" placeholder="전화번호 입력" /></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email" placeholder="이메일 입력" /></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit">아이디 검색</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>

		<div>
			<div>
				<form>
					<table>
						<tr>
							<td colspan="2">
								<h3>비밀번호 찾기</h3>
							</td>
						</tr>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" placeholder="이름 입력" /></td>
						</tr>
						<tr>
							<td>전화번호</td>
							<td><input type="text" name="phone" placeholder="전화번호 입력" /></td>
						</tr>
						<tr>
							<td>이메일</td>
							<td><input type="email" name="email" placeholder="이메일 입력" /></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit">비밀번호 재설정</button>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>