<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>스탬프 / 쿠폰</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 폰트 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

    <!--  내가 가지고 있는 파일 포함하기  -->
    <link rel="stylesheet" href="${path}/resources/css/mypage/myStamp.css" type="text/css">

</head>

<body>
    <div class="container fixed-width">
        <div class="infoBox">
            <div class="memberInfo">
                <div style="display: flex;">
                    <div>
                        <img src="${path}/resources/img/mypageimg/열동그라미.png" alt="" class="profileimg">
                    </div>
                    <div class="memberInfo2">
                        <h2>배교훈님의 마이페이지</h2>
                        <p>qorygnsska</p>
                    </div>
                </div>
                <div style="border: 1px solid rgba(228, 228, 228, 0.664); height: 50%;"></div>
                <div class="stmapcount">
                    <a href="myStmap">
                        <h3 style="color: rgb(129, 129, 129);">스탬프</h3>
                        <h2>5 / 9</h2>
                    </a>
                </div>
                <div style="border: 1px solid rgba(228, 228, 228, 0.664); height: 50%;"></div>
                <div class="couponcount">
                    <a href="myStmap">
                        <h3 style="color: rgb(129, 129, 129);">쿠폰</h3>
                        <h2>5개</h2>
                    </a>
                </div>
            </div>
        </div>
        <div class="main">
            <div class="category">
                <div class="myMovie">
                    <a href="myMovie">
                        <p>영화 예매 내역</p>
                    </a>
                </div>

                <div class="myProduct">
                    <a href="myProduct">
                        <p>상품 구매 내역</p>
                    </a>
                </div>

                <div class="myStamp">
                    <a href="myStamp">
                        <p>스탬프 / 쿠폰</p>
                    </a>
                </div>

                <div class="myEdit">
                    <a href="myEdit">
                        <p>회원정보 수정</p>
                    </a>
                </div>
            </div>

            <div style="border: 1px solid rgb(219, 219, 219); margin-left: 50px; height: 200px;"></div>

            <div class="content">
                <div class="title">
                    <h2>스탬프</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>
                <div class="stampinfo">
                    <table>
                        <tr>
                            <td><img src="${path}/resources/img/mypageimg/제리.png" alt="" class="stampimg"></td>
                            <td><img src="${path}/resources/img/mypageimg/제리.png" alt="" class="stampimg"></td>
                            <td><img src="${path}/resources/img/mypageimg/제리.png" alt="" class="stampimg"></td>
                        </tr>

                        <tr>
                            <td><img src="${path}/resources/img/mypageimg/제리.png" alt="" class="stampimg"></td>
                            <td><img src="${path}/resources/img/mypageimg/제리.png" alt="" class="stampimg"></td>
                            <td>6</td>
                        </tr>

                        <tr>
                            <td>7</td>
                            <td>8</td>
                            <td>9</td>
                        </tr>
                    </table>
                </div>

                <div class="title2">
                    <h2>쿠폰</h2>
                    <div style="border: 1px solid rgba(228, 228, 228, 0.664); margin-bottom: 20px;"></div>
                </div>
                <div class="couponinfo">
                    <div class="row">
                        <div class="col">
                            <div class="coupon">
                                <h3>영화관람권</h3>
                                <p>스탬프 이벤트 완료</p>
                                <button type="button" class="couponbtn">예매하기</button>
                            </div>
                        </div>
                        <div class="col">
                            <div class="coupon">
                                <h3>영화관람권</h3>
                                <p>스탬프 이벤트 완료</p>
                                <button type="button" class="couponbtn">예매하기</button>
                            </div>
                        </div>
                        <div class="col">
                            <div class="coupon">
                                <h3>영화관람권</h3>
                                <p>스탬프 이벤트 완료</p>
                                <button type="button" class="couponbtn">예매하기</button>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="coupon">
                                <h3>영화관람권</h3>
                                <p>스탬프 이벤트 완료</p>
                                <button type="button" class="couponbtn">예매하기</button>
                            </div>
                        </div>
                        <div class="col">
                            <div class="coupon">
                                <h3>영화관람권</h3>
                                <p>스탬프 이벤트 완료</p>
                                <button type="button" class="couponbtn">예매하기</button>
                            </div>
                        </div>
                        <div class="col"></div>
                    </div>
                </div>

            </div>

        </div>
    </div>

</body>

</html>