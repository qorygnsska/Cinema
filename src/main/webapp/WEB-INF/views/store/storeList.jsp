<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>

    <div id="storeList--container">
        <div id="storeList--contents">
            <div class="storeList--wrap-product-chart">
                
                <!-- 팝콘 시작 -->
                <strong class="storeList--product--title">팝콘</strong>
                <hr class="storeList--hr" />
                <div class="storeList--sect-product-chart">
                    <ul class="storeList--sect-product-chart-ui">
                        <c:forEach var="product" items="${storeList}">
                            <c:if test="${product.productCode eq 'P1'}">
                                <li class="storeList--sect-product-chart-ui-li">
                                    <a href="storeDetail?productNo=${product.productNo}"> <!-- 상세정보 페이지로 이동 --> 
                                        <span class="storeList--thumb-image"> 
                                            <img class="storeList--product--image" src="resources/img/store/${product.productImage}" alt="">
                                        </span>
                                        <div class="storeList--box-contents">
                                            <span class="storeList--contents--title">${product.productName}</span>
                                            <span class="storeList--contents--price"><fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원</span>
                                        </div>
                                    </a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                <!-- 팝콘 끝 -->
                
                <!-- 음료 시작 -->
                <strong class="storeList--product--title">음료</strong>
                <hr class="storeList--hr" />
                <div class="storeList--sect-product-chart">
                    <ul class="storeList--sect-product-chart-ui">
                        <c:forEach var="product" items="${storeList}">
                            <c:if test="${product.productCode eq 'P2'}">
                                <li class="storeList--sect-product-chart-ui-li">
                                    <a href="storeDetail?productNo=${product.productNo}"> <!-- 상세정보 페이지로 이동 --> 
                                        <span class="storeList--thumb-image"> 
                                            <img class="storeList--product--image" src="resources/img/store/${product.productImage}" alt="">
                                        </span>
                                        <div class="storeList--box-contents">
                                            <span class="storeList--contents--title">${product.productName}</span>
                                            <span class="storeList--contents--price"><fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원</span>
                                        </div>
                                    </a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                <!-- 음료 끝 -->
                
                <!-- 스낵 시작 -->
                <strong class="storeList--product--title">스낵</strong>
                <hr class="storeList--hr" />
                <div class="storeList--sect-product-chart">
                    <ul class="storeList--sect-product-chart-ui">
                        <c:forEach var="product" items="${storeList}">
                            <c:if test="${product.productCode eq 'P3'}">
                                <li class="storeList--sect-product-chart-ui-li">
                                    <a href="storeDetail?productNo=${product.productNo}"> <!-- 상세정보 페이지로 이동 --> 
                                        <span class="storeList--thumb-image"> 
                                            <img class="storeList--product--image" src="resources/img/store/${product.productImage}" alt="">
                                        </span>
                                        <div class="storeList--box-contents">
                                            <span class="storeList--contents--title">${product.productName}</span>
                                            <span class="storeList--contents--price"><fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원</span>
                                        </div>
                                    </a>
                                </li>
                            </c:if>
                        </c:forEach>
                    </ul>
                </div>
                <!-- 스낵 끝 -->

            </div>
        </div>
    </div>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
