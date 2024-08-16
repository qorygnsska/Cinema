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

<title>JERRY MOVIE - 이용약관</title>
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
			<h2 class="join--title">JERRY 서비스 이용약관</h2>
			<br>
			<div class="join--container">
				<div class="join--Wrap">
					<form class="join--form jointos--form" id="join--form">
						<div class="terms-section">
							<h2>제 1 조 (목적)</h2>
							<p>본 약관은 JERRY 주식회사(이하 ‘JERRY’)가 제공하는 다양한 서비스(이하 ‘서비스’)의 이용과
								관련하여 JERRY와 이를 이용하는 회원(이하 ‘회원’) 또는 비회원(이하 ‘비회원’)과의 관계를 규명하고, 서비스
								이용에 관한 권리 및 의무를 명확히 하여 서비스 이용에 도움을 제공하는 것을 목적으로 합니다.</p>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 2 조 (정의)</h2>
							<ul>
								<li><strong>서비스</strong>: JERRY가 제공하는 모든 온라인 및 오프라인 서비스,
									제품, 기능, 콘텐츠를 포함하며, 웹사이트, 모바일 애플리케이션 및 기타 플랫폼을 통해 제공됩니다.</li>
								<li><strong>회원</strong>: JERRY의 회원가입 절차를 완료하고, ID와 비밀번호를 통해
									서비스를 이용하는 자를 말합니다.</li>
								<li><strong>비회원</strong>: 회원가입 절차를 완료하지 않고 JERRY 서비스를 이용하는
									자를 말합니다.</li>
								<li><strong>서비스 제공자</strong>: JERRY의 서비스 운영 및 관리에 직접 또는
									간접적으로 참여하는 제3자 서비스를 제공하는 업체를 의미합니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 3 조 (약관의 효력 및 변경)</h2>
							<ul>
								<li>본 약관은 서비스 제공 홈페이지에 공지함으로써 효력을 발생합니다. 약관의 변경 시, 변경된 내용은
									즉시 공지되며, 공지 후 일정 기간이 지나면 새로운 약관이 적용됩니다.</li>
								<li>회원은 약관의 변경에 대해 동의하지 않는 경우 서비스 이용을 중단하고 회원 탈퇴를 할 수 있습니다.
									약관 변경에 동의하지 않고 계속해서 서비스를 이용하는 경우, 변경된 약관에 동의한 것으로 간주됩니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 4 조 (서비스의 제공 및 변경)</h2>
							<ul>
								<li>JERRY는 회원에게 다음과 같은 서비스를 제공합니다:
									<ul>
										<li>온라인 커뮤니티 및 포럼</li>
										<li>쇼핑 및 전자상거래 플랫폼</li>
										<li>콘텐츠 스트리밍 및 다운로드 서비스</li>
										<li>고객 지원 및 피드백 시스템</li>
										<li>기타 JERRY가 정하는 서비스</li>
									</ul>
								</li>
								<li>JERRY는 서비스의 개선 및 업데이트를 위해 서비스의 내용을 추가, 변경, 중단할 수 있으며, 이
									경우 회원에게 사전 통지하거나 사후 공지합니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 5 조 (회원 가입 및 관리)</h2>
							<ul>
								<li>회원 가입은 JERRY의 웹사이트 또는 모바일 애플리케이션에서 제공하는 가입 절차에 따라
									진행합니다.</li>
								<li>회원은 가입 시 제공하는 모든 정보가 정확하고 최신의 정보임을 보장해야 하며, 정보 변경 시 즉시
									업데이트하여야 합니다.</li>
								<li>회원은 본인의 계정을 안전하게 관리할 책임이 있으며, 계정에 대한 모든 활동은 본인이 책임집니다.</li>
								<li>JERRY는 회원이 제공한 정보의 정확성을 보증하지 않으며, 회원의 실수 또는 정보의 허위로 인해
									발생하는 문제에 대해 책임지지 않습니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 6 조 (서비스 이용의 제한 및 중지)</h2>
							<ul>
								<li>JERRY는 다음과 같은 경우 서비스 이용을 제한하거나 중지할 수 있습니다:
									<ul>
										<li>회원이 본 약관 또는 관련 법령을 위반한 경우</li>
										<li>서비스의 안전성 또는 보안에 심각한 위험을 초래한 경우</li>
										<li>기술적 문제로 인해 서비스를 제공할 수 없는 경우</li>
										<li>기타 JERRY가 불가피하다고 판단하는 경우</li>
									</ul>
								</li>
								<li>서비스 이용의 제한 및 중지에 대한 사유는 가능한 한 사전에 공지되며, 긴급을 요하는 경우 사후
									공지할 수 있습니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 7 조 (회원의 의무)</h2>
							<ul>
								<li>회원은 다음과 같은 의무를 준수해야 합니다:
									<ul>
										<li>본 약관 및 관련 법령을 준수할 것</li>
										<li>타인의 권리를 침해하지 않을 것</li>
										<li>서비스 이용과 관련하여 제공된 정보나 콘텐츠를 상업적 목적이나 불법적 목적으로 사용하지 않을 것</li>
										<li>자신의 계정 및 비밀번호를 안전하게 관리할 것</li>
									</ul>
								</li>
								<li>회원은 JERRY의 사전 동의 없이 서비스를 상업적 용도로 이용할 수 없으며, 이를 위반할 경우
									법적 책임을 질 수 있습니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 8 조 (저작권 및 지적 재산권)</h2>
							<ul>
								<li>JERRY가 제공하는 모든 서비스, 콘텐츠, 디자인, 로고, 상표는 JERRY 또는 해당 권리자가
									소유하며, 관련 법령에 의해 보호받습니다.</li>
								<li>회원은 JERRY의 사전 서면 동의 없이 서비스의 모든 요소를 복제, 전송, 배포, 게시하거나
									상업적 목적으로 사용할 수 없습니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 9 조 (개인정보 보호)</h2>
							<ul>
								<li>JERRY는 회원의 개인정보 보호를 위해 관련 법령에 따라 개인정보를 처리합니다.</li>
								<li>개인정보 처리 방침에 대한 자세한 사항은 JERRY의 개인정보 처리 방침을 참조해 주시기 바랍니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 10 조 (면책 조항)</h2>
							<ul>
								<li>JERRY는 서비스의 이용과 관련하여 다음과 같은 사항에 대해 책임을 지지 않습니다:
									<ul>
										<li>회원의 실수 또는 과실로 인한 손해</li>
										<li>서비스의 이용 중 발생한 서버 장애, 기술적 문제로 인한 손해</li>
										<li>제3자에 의해 발생한 손해</li>
									</ul>
								</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 11 조 (분쟁 해결)</h2>
							<ul>
								<li>본 약관과 관련하여 발생한 분쟁은 JERRY의 본사 소재지를 관할하는 법원을 제1심 법원으로 하여
									해결합니다.</li>
								<li>JERRY와 회원 간의 분쟁은 우선적으로 상호 협의를 통해 해결하며, 협의가 이루어지지 않을 경우
									법적 절차를 진행합니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>제 12 조 (기타)</h2>
							<ul>
								<li>본 약관에 명시되지 않은 사항은 관련 법령 및 일반 상관습에 따릅니다.</li>
								<li>본 약관의 어떤 조항이 무효이거나 집행 불가능하다고 판단되는 경우, 해당 조항은 무효로 간주되며,
									다른 조항의 유효성에는 영향을 미치지 않습니다.</li>
							</ul>
						</div>
						<br>
						<br>
						<div class="terms-section">
							<h2>부칙</h2>
							<ul>
								<li>본 약관은 2024년 7월 24일부터 시행됩니다.</li>
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
