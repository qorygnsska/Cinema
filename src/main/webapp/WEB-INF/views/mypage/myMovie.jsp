<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>


<!--  내가 가지고 있는 파일 포함하기  -->
<script src="${path}/resources/js/jquery-3.7.1.min.js"></script>

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">


<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<section class="myMovie--section">
    <div class="container" id="myMovie--container">
        <div class="myMovie--infoBox">
            <div class="myMovie--memberInfo">
                <div style="display: flex;">
                    <div>
                        <img src="${path}/resources/img/mypageimg/열동그라미.png" alt="" class="myMovie--profileimg">
                    </div>
                    <div class="myMovie--memberInfo2">
                        <h2>배교훈님의 마이페이지</h2>
                        <p>qorygnsska</p>
                    </div>
                </div>
                <div style="border: 1px solid rgba(228, 228, 228, 0.664); height: 50%;"></div>
                <div class="myMovie--stmapcount">
                    <a href="myStamp">
                        <h3 style="color: rgb(129, 129, 129);">스탬프</h3>
                        <h2>5 / 9</h2>
                    </a>
                </div>
                <div style="border: 1px solid rgba(228, 228, 228, 0.664); height: 50%;"></div>
                <div class="myMovie--couponcount">
                    <a href="myStamp">
                        <h3 style="color: rgb(129, 129, 129);">쿠폰</h3>
                        <h2>5개</h2>
                    </a>
                </div>
            </div>
        </div>
        <div class="myMovie--main">
            <div class="myMovie--category">
                <div class="myMovie--myMovie">
                    <a href="myMovie">
                        <p>영화 예매 내역</p>
                    </a>
                </div>

                <div class="myMovie--myProduct">
                    <a href="myProduct">
                        <p>상품 구매 내역</p>
                    </a>
                </div>

                <div class="myMovie--myStamp">
                    <a href="myStamp">
                        <p>스탬프 / 쿠폰</p>
                    </a>
                </div>

                <div class="myMovie--myEdit">
                    <a href="myConfirm">
                        <p>회원정보 수정</p>
                    </a>
                </div>
            </div>

            <div style="border: 1px solid rgb(219, 219, 219); margin-left: 50px; height: 200px;"></div>

            <div class="myMovie--content">
                <div class="myMovie--title">
                    <h2>영화 예매 내역</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>

                <div class="accordion" id="accordionFlushExample">
                    <ul class="myMovie--movieul">
                        <li class="myMovie--movieli">
                            <div class="accordion-item" id="movacoitem">
                                <div images>
                                    <img src="${path}/resources/img/mypageimg/하이재킹.jpg" alt="" class="myMovie--postimg">
                                </div>

                                <div class="myMovie--movieinfo">
                                    <h3><span>하이재킹</span></h3>
                                    <p>
                                        2024.06.22 (토) 13:05 ~ 14:55<br>
                                        CGV의정부 6관 (Laser) / 1명
                                    </p>

                                    <a href="/">리뷰 작성하기</a>
                                </div>

                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse1" aria-expanded="false" aria-controls="flush-collapse1">
                                    펼쳐보기
                                </div>

                            </div>

                            <div id="flush-collapse1" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    영화제목 : 하이재킹<br>
                                    상영날짜 : 2024.06.22 (토) 13:05 ~ 14:55<br>
                                    인원 : 3명(성인2, 청소년1)<br>
                                    결제수단 : 신용카드<br>
                                    결제금액 : 30,000원<br>
                                    
                                </div>
                            </div>
                        </li>

                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>

                        <li class="myMovie--movieli">
                            <div class="accordion-item" id="movacoitem">
                                <div images>
                                    <img src="${path}/resources/img/mypageimg/그녀가죽었다.jpg" alt="" class="myMovie--postimg">
                                </div>

                                <div class="myMovie--movieinfo">
                                    <h3><span>그녀가 죽었다</span></h3>
                                    <p>
                                        2024.06.16 (일) 12:45 ~ 14:38<br>
                                        CGV의정부 6관 (Laser) / 2명
                                    </p>

                                    <a href="/">리뷰 작성하기</a>
                                </div>

                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse2" aria-expanded="false" aria-controls="flush-collapse2">
                                    펼쳐보기
                                </div>
                            </div>

                            <div id="flush-collapse2" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    dd
                                </div>
                            </div>
                        </li>

                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>

                        <li class="myMovie--movieli">
                            <div class="accordion-item" id="movacoitem">
                                <div images>
                                    <img src="${path}/resources/img/mypageimg/범죄도시4.jpg" alt="" class="myMovie--postimg">
                                </div>

                                <div class="myMovie--movieinfo">
                                    <h3><span>범죄도시4</span></h3>
                                    <p>
                                        2024.04.27 (토) 12:20 ~ 14:19<br>
                                        CGV의정부 5관 (Laser) / 2명
                                    </p>

                                    <a href="/">리뷰 작성하기</a>
                                </div>

                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse3" aria-expanded="false" aria-controls="flush-collapse3">
                                    펼쳐보기
                                </div>
                            </div>

                            <div id="flush-collapse3" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㅇㄴㅁㄴㅇㅁㄴㅇ
                                </div>
                            </div>
                        </li>

                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>

                        <li class="myMovie--movieli">
                            <div class="accordion-item" id="movacoitem">
                                <div images>
                                    <img src="${path}/resources/img/mypageimg/파묘.jpg" alt="" class="myMovie--postimg">
                                </div>

                                <div class="myMovie--movieinfo">
                                    <h3><span>파묘(SCREENX 2D)</span></h3>
                                    <p>
                                        2024.03.22 (금) 22:15 ~ 24:39<br>
                                        CGV의정부 7관[SCREENX] (Laser) / 2명
                                    </p>

                                    <a href="/">리뷰 작성하기</a>
                                </div>

                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse4" aria-expanded="false" aria-controls="flush-collapse4">
                                    펼쳐보기
                                </div>
                            </div>

                            <div id="flush-collapse4" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㅇㄴㅁㄴㅇㅁㄴㅇ
                                </div>
                            </div>
                        </li>

                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>

                        <li class="myMovie--movieli">
                            <div class="accordion-item" id="movacoitem">
                                <div images>
                                    <img src="${path}/resources/img/mypageimg/도그데이즈.jpg" alt="" class="myMovie--postimg">
                                </div>

                                <div class="myMovie--movieinfo">
                                    <h3><span>도그데이즈</span></h3>
                                    <p>
                                        2024.02.12 (월) 15:30 ~ 17:40<br>
                                        CGV의정부 1관 (Laser) / 2명
                                    </p>

                                    <a href="/">리뷰 작성하기</a>
                                </div>

                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse5" aria-expanded="false" aria-controls="flush-collapse5">
                                    펼쳐보기
                                </div>
                            </div>

                            <div id="flush-collapse5" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㅇㄴㅁㄴㅇㅁㄴㅇ
                                </div>
                            </div>
                        </li>

                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>

                        <li class="myMovie--movieli">
                            <div class="accordion-item" id="movacoitem">
                                <div images>
                                    <img src="${path}/resources/img/mypageimg/달짝지근해.jpg" alt="" class="myMovie--postimg">
                                </div>

                                <div class="myMovie--movieinfo">
                                    <h3><span>달짝지근해-7510</span></h3>
                                    <p>
                                        2023.08.17 (목) 22:00 ~ 24:09<br>
                                        CGV의정부 4관 (Laser) / 2명
                                    </p>

                                    <a href="/">리뷰 작성하기</a>
                                </div>

                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse6" aria-expanded="false" aria-controls="flush-collapse6">
                                    펼쳐보기
                                </div>
                            </div>

                            <div id="flush-collapse6" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㅇㄴㅁㄴㅇㅁㄴㅇ
                                </div>
                            </div>
                        </li>

                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>

                        <li class="myMovie--movieli">
                            <div class="accordion-item" id="movacoitem">
                                <div images>
                                    <img src="${path}/resources/img/mypageimg/드림.jpg" alt="" class="myMovie--postimg">
                                </div>

                                <div class="myMovie--movieinfo">
                                    <h3><span>드림</span></h3>
                                    <p>
                                        2023.05.01 (월) 17:20 ~ 19:35<br>
                                        CGV의정부 1관 (Laser) / 2명
                                    </p>

                                    <a href="/">리뷰 작성하기</a>
                                </div>

                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse7" aria-expanded="false" aria-controls="flush-collapse7">
                                    펼쳐보기
                                </div>
                            </div>

                            <div id="flush-collapse7" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㅇㄴㅁㄴㅇㅁㄴㅇ
                                </div>
                            </div>
                        </li>

                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>

                        <li class="myMovie--movieli">
                            <div class="accordion-item" id="movacoitem">
                                <div images>
                                    <img src="${path}/resources/img/mypageimg/아바타.jpg" alt="" class="myMovie--postimg">
                                </div>

                                <div class="myMovie--movieinfo">
                                    <h3><span>아바타-물의 길(3D)</span></h3>
                                    <p>
                                        2023.01.24 (화) 17:20 ~ 20:42<br>
                                        CGV건대입구 2관 3층 / 2명
                                    </p>

                                    <a href="/">리뷰 작성하기</a>
                                </div>

                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse8" aria-expanded="false" aria-controls="flush-collapse8">
                                    펼쳐보기
                                </div>
                            </div>

                            <div id="flush-collapse8" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㅇㄴㅁㄴㅇㅁㄴㅇ
                                </div>
                            </div>
                        </li>

                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>

                        <li class="myMovie--movieli">
                            <div class="accordion-item" id="movacoitem">
                                <div images>
                                    <img src="${path}/resources/img/mypageimg/오늘밤.jpg" alt="" class="myMovie--postimg">
                                </div>

                                <div class="myMovie--movieinfo">
                                    <h3><span>오늘 밤, 세계에서 이 사랑이 사라진다 해도</span></h3>
                                    <p>
                                        2022.12.19 (월) 17:20 ~ 19:31<br>
                                        CGV의정부태흥 4관 / 2명
                                    </p>

                                    <a href="/">리뷰 작성하기</a>
                                </div>

                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse9" aria-expanded="false" aria-controls="flush-collapse9">
                                    펼쳐보기
                                </div>
                            </div>

                            <div id="flush-collapse9" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㅇㄴㅁㄴㅇㅁㄴㅇ
                                </div>
                            </div>
                        </li>

                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>

                        <li class="myMovie--movieli">
                            <div class="accordion-item" id="movacoitem">
                                <div images>
                                    <img src="${path}/resources/img/mypageimg/결백.jpg" alt="" class="myMovie--postimg">
                                </div>

                                <div class="myMovie--movieinfo">
                                    <h3><span>결백</span></h3>
                                    <p>
                                        2020.06.14 (일) 18:40 ~ 20:41<br>
                                        CGV안산 5관 B동 / 1명
                                    </p>

                                    <a href="/">리뷰 작성하기</a>
                                </div>

                                <div class="accordion-text" id="movacotext" data-bs-toggle="collapse" data-bs-target="#flush-collapse10" aria-expanded="false" aria-controls="flush-collapse10">
                                    펼쳐보기
                                </div>
                            </div>

                            <div id="flush-collapse10" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">
                                <div class="accordion-body">
                                    ㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㄴㅇㅁㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㄴㅇㅁㅇㅁㅇㅁㅇㅁㅇㄴㅁㄴㅇㅁㄴㅇ
                                </div>
                            </div>
                        </li>

                        <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px; margin-top: 20px;"></div>

                    </ul>
                </div>

                <div class="myMovie--page">
                    <button>1</button>
                    <button>2</button>
                    <button>3</button>
                </div>
            </div>


        </div>
    </div>
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>