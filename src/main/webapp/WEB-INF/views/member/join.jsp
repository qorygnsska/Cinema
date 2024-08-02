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
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
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
		<div class="join--container">
			<div class="join--Wrap">

				<form>
					<div class="input-group mb-3">
						<span class="input-group-text" id="basic-addon1">@</span> <input
							type="text" class="form-control" placeholder="Username"
							aria-label="Username" aria-describedby="basic-addon1">
					</div>

					<div class="input-group mb-3">
						<input type="text" class="form-control"
							placeholder="Recipient's username"
							aria-label="Recipient's username" aria-describedby="basic-addon2">
						<span class="input-group-text" id="basic-addon2">@example.com</span>
					</div>

					<div class="mb-3">
						<label for="basic-url" class="form-label">Your vanity URL</label>
						<div class="input-group">
							<span class="input-group-text" id="basic-addon3">https://example.com/users/</span>
							<input type="text" class="form-control" id="basic-url"
								aria-describedby="basic-addon3 basic-addon4">
						</div>
						<div class="form-text" id="basic-addon4">Example help text
							goes outside the input group.</div>
					</div>

					<div class="input-group mb-3">
						<span class="input-group-text">$</span> <input type="text"
							class="form-control" aria-label="Amount (to the nearest dollar)">
						<span class="input-group-text">.00</span>
					</div>

					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Username"
							aria-label="Username"> <span class="input-group-text">@</span>
						<input type="text" class="form-control" placeholder="Server"
							aria-label="Server">
					</div>

					<div class="input-group">
						<span class="input-group-text">With textarea</span>
						<textarea class="form-control" aria-label="With textarea"></textarea>
					</div>



				</form>


			</div>



		</div>



	</section>

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>