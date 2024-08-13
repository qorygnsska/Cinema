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
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
	.basketMain-step-progress li.active::before {
    background-image: url('${path}/resources/img/basket/basket128px.png');
}

.basketMain-step-progress li:nth-child(2)::before {
    background-image: url('${path}/resources/img/basket/wallet128.png');
}

.basketMain-step-progress li:nth-child(3)::before {
    background-image: url('${path}/resources/img/basket/member128.png');
}
</head>
<body>

</body>
</html>