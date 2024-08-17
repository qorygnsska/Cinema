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
<!-- jQuery -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>
<!-- 폰트어썸 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script src="https://kit.fontawesome.com/31d16c06da.js"
	crossorigin="anonymous"></script>
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

<title>JERRY MOVIE - 개인정보 처리 방침</title>
<style>
.termsOfUse {
	width: 1200px;
	margin: auto;
}

.terms-section {
	margin-bottom: 20px;
}

.terms-section ul {
	margin: 10px 0 20px 20px;
}

.terms-section li {
	margin-bottom: 10px;
}

#join--form {
	display: block;
	text-align: left;
}
</style>
</head>
<body>

	<section>
		<!-- header -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		<div class="termsOfUse">
			<h2 class="join--title">JERRY 개인정보 처리 방침</h2>
			<br>
			<div class="join--container">
				<div class="join--Wrap">
					<form class="join--form jointos--form" id="join--form">
						<div class="terms-section">
							<h2>제 1 조 (목적)</h2>
							<p>본 개인정보 처리 방침은 JERRY 주식회사(이하 ‘JERRY’)가 회원의 개인정보를 수집, 이용, 보호하는 방법에 대해 설명합니다. JERRY는 개인정보를 보호하고 관련 법령에 따라 적절히 관리하기 위해 본 방침을 수립하였습니다.</p>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 2 조 (수집하는 개인정보 항목)</h2>
							<ul>
								<li><strong>회원가입 시</strong>: 이름, 이메일 주소, 전화번호, 비밀번호</li>
								<li><strong>서비스 이용 중</strong>: 서비스 이용 기록, 결제 정보</li>
								<li><strong>고객 지원</strong>: 고객 문의 내용, 상담 기록</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 3 조 (개인정보의 수집 및 이용 목적)</h2>
							<ul>
								<li>JERRY는 수집한 개인정보를 다음과 같은 목적으로 이용합니다:
									<ul>
										<li>회원 관리: 회원 가입 및 관리, 본인 인증</li>
										<li>서비스 제공: 서비스 제공 및 운영, 결제 처리</li>
										<li>고객 지원: 고객 문의 응대 및 서비스 개선</li>
										<li>마케팅: 신규 서비스 및 프로모션 정보 제공</li>
									</ul>
								</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 4 조 (개인정보의 보유 및 이용 기간)</h2>
							<ul>
								<li>JERRY는 개인정보를 수집한 목적을 달성한 후, 관련 법령에 따라 일정 기간 동안 보유하며, 이후 안전하게 삭제합니다.</li>
								<li>회원 탈퇴 시, 관련 정보는 즉시 삭제되며, 법령에 따라 보존이 필요한 정보는 일정 기간 동안 보관 후 삭제합니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 5 조 (개인정보의 제3자 제공)</h2>
							<ul>
								<li>JERRY는 회원의 동의 없이 개인정보를 제3자에게 제공하지 않습니다. 다만, 법령에 의한 요구나 법적 절차를 따르는 경우에는 예외로 합니다.</li>
								<li>제3자에게 개인정보를 제공하는 경우, 제공 대상자와 제공 목적 등을 사전에 공지하며, 회원의 동의를 받습니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 6 조 (개인정보의 안전성 확보 조치)</h2>
							<ul>
								<li>JERRY는 개인정보의 안전성을 확보하기 위해 다음과 같은 조치를 취합니다:
									<ul>
										<li>개인정보 접근 권한 관리</li>
										<li>정보 암호화</li>
										<li>정기적인 보안 점검</li>
									</ul>
								</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 7 조 (개인정보 열람, 수정, 삭제)</h2>
							<ul>
								<li>회원은 자신의 개인정보를 열람하고, 수정하거나 삭제할 수 있습니다. 이를 원할 경우, JERRY의 고객 지원을 통해 요청할 수 있습니다.</li>
								<li>개인정보의 수정 또는 삭제 요청 시, 관련 법령에 따라 처리되며, 처리 결과는 회원에게 통지됩니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 8 조 (개인정보 보호 책임자)</h2>
							<ul>
								<li>JERRY는 개인정보 보호를 위한 책임자를 지정하고, 회원의 개인정보 관련 문의를 처리합니다.</li>
								<li>개인정보 보호 책임자의 연락처는 다음과 같습니다:
									<ul>
										<li>이름: [담당자 이름]</li>
										<li>연락처: [담당자 연락처]</li>
										<li>이메일: [담당자 이메일]</li>
									</ul>
								</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 9 조 (개인정보 처리 방침의 변경)</h2>
							<ul>
								<li>본 개인정보 처리 방침은 관련 법령의 변경, 서비스의 변경 등으로 인해 수정될 수 있으며, 변경 시에는 웹사이트에 공지됩니다.</li>
								<li>변경된 방침은 공지 후 즉시 효력을 발생하며, 회원은 변경 사항을 주기적으로 확인하여야 합니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>부칙</h2>
							<ul>
								<li>본 개인정보 처리 방침은 2024년 7월 24일부터 시행됩니다.</li>
							</ul>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
</body>
<!-- footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</html>
