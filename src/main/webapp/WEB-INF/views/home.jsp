<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<!-- 폰트어썸 -->
<script src="https://kit.fontawesome.com/31d16c06da.js"
	crossorigin="anonymous"></script>
<link href="${path}/resources/css/main/headerNavbar.css" rel="stylesheet" />
<html>
<head>
<title>SGV</title>
</head>

<!-- css -->
<link href="${path}/resources/css/main/headerNavbar.css"
	rel="stylesheet" />
	<style>
		section{
			margin-top: 170px;
			height: 1000px;
			box-sizing: border-box;
		}
	</style>
<body>

	<jsp:include page="common/header.jsp"></jsp:include>
	<section>
	<jsp:include page="common/main.jsp"></jsp:include>
	</section>
	<jsp:include page="common/footer.jsp"></jsp:include>
	<!-- 부트스트랩 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>
