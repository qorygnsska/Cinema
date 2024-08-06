<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일명: fileUpload.jsp</title>
</head>
<body>

	<!-- 파일 업로드 진행시 
 스프링은 자동으로 매핑 기능!
 1. c드라이브나 내 컴퓨터 안에 폴더를
   생성해서 업로드 
   
 2. 톰캣 서버 안에 파일을 업로드 하는
   방법 
   서버에 저장을 하게되면 동일한 파일명
   이 들어올 경우 덮어쓰기 해버리는
   경우가 있다. 
   고유한 키 값을 발급해서 파일이 동일할
   경우에 구별을 할 수 있도록 
   UUID
   
 뷰 페이지에서 데이터를 전송하기 위해
 첨부파일 이진파일(바이너리)
 이름,나이,성별 ...등 문자로 전송
 이진파일과 문자를 동시에 전송하고 싶을
 경우에는 form 태그의 속성을
 enctype="multipart/form-data"
 지정    
 
 스프링에서 파일업로드를 쉽게 진행할
 수있는 인터페이스를 제공 
 MultipartFile 
 @ModelAttribute
 
 
 -->

	<h2>File Upload</h2>
	<form method="post" 
  enctype="multipart/form-data" 
  action="${path}/admin/upload_ok">
 <input type="file" name="file" /> <input type="submit" value="Upload" />
 <!--  만약 파일을 여러개 첨부해서 보내고 싶을
 경우에는 type="multiple" 
 List 인터페이스로 타입을 선언하고 
 @RequsetParam 등 으로 받으면 된다.
 -->
 
	</form>




</body>
</html>