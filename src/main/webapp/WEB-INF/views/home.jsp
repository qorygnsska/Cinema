<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="common/header.jsp"></jsp:include>
<section>
	<c:if test="${empty main}">
		<jsp:include page="common/main.jsp"></jsp:include>
	</c:if>
	<c:if test="${!empty main}">
		<jsp:include page="${main}.jsp"></jsp:include>
	</c:if>
</section>
<jsp:include page="common/footer.jsp"></jsp:include>