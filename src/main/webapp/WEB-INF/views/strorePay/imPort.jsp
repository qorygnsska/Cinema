<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--자바스크립트를 이용해서 결제api쉽게 구현 할 수 있도록 사용하는 라이브러디! 포함.  -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>
<body>
<h1>아임포트 결제</h1>
</body>
</html>


<div id="contents" class="gift_store">
        
            
            <!-- Contents Start -->
			

<!-- S 카테고리 메뉴 & 받은선물/장바구니 -->
    
    <!--
<script type="text/javascript" src="./../../../html/CDN/R2014/js/giftstore/giftstore.js"></script>
<script type="text/javascript" src="./../../../html/CDN/R2014/js/giftstore/commonstore.js"></script>
<link rel="stylesheet" media="all" type="text/css" href="./../../../html/CDN/R2014/css/giftstore/giftstore.css" />-->
<script language="javascript" type="text/javascript">

    var cname = "";

    history.navigationMode = 'compatible';
    $(document).ready(function () {
        $.giftstore_fixObj(this, $('.category_contents_wrap'), $('.category_content'), $('.giftstore_logo'));

        //영역 문제로 gift_store 클래스 추가
        // start 2023.03.27 홈페이지 스토어 영역 內 배너 영역 미노출의 件 
        //  $("#contents").addClass("gift_store");

        if (cname != "") {
            $(".sect-linemap .sect-bcrumb .last").html("");
        }

    });

    function fnCategoryData(cno) {
        location.href="/culture-event/popcorn-store/store-category.aspx?CategoryIdx=" + cno;
    }

</script>


<div class="category_wrap" style="left: 0px;">
 <div class="category_contents_wrap">
     <ul class="category_content">
<li id="cm1" name="categorymenu" class=""><a href="#" onclick="javascript:fnCategoryData('1');">패키지</a></li><li id="cm2" name="categorymenu" class=""><a href="#" onclick="javascript:fnCategoryData('2');">영화관람권</a></li><li id="cm3" name="categorymenu" class=""><a href="#" onclick="javascript:fnCategoryData('3');">기프트카드</a></li><li id="cm4" name="categorymenu" class=""><a href="#" onclick="javascript:fnCategoryData('4');">콤보</a></li><li id="cm5" name="categorymenu" class=""><a href="#" onclick="javascript:fnCategoryData('5');">팝콘</a></li><li id="cm6" name="categorymenu" class=""><a href="#" onclick="javascript:fnCategoryData('6');">음료</a></li><li id="cm7" name="categorymenu" class=""><a href="#" onclick="javascript:fnCategoryData('7');">스낵</a></li><li id="cm10" name="categorymenu" class=""><a href="#" onclick="javascript:fnCategoryData('10');">플레이존</a></li><li><a href="#" onclick="javascript:location.href='/culture-event/popcorn-store/introduce-gift-card.aspx?CategoryIdx=0';">상품권소개</a></li>     </ul>
     <ul class="cart_content">
         <li><a href="#" onclick="javascript:location.href='/user/mycgv/popcorn-store/';">내 기프트콘</a><span id="giftconcnt">0</span></li>         <li><a href="#" onclick="javascript:location.href='/culture-event/popcorn-store/user-cart.aspx';">장바구니</a><span id="cartviewcnt">1</span></li>     </ul>
 </div>
</div>

<!-- E 카테고리 메뉴 & 받은선물/장바구니 -->

	<div class="cart_step_wrap">
		<ul class="cart_step step_unit4">
			<li class="step0 active"><span>STEP 01</span><strong>장바구니</strong></li>
			<li class="step1"><span>STEP 02</span><strong>선물정보 입력</strong></li>
			<li class="step2 "><span>STEP 03</span><strong>결제하기</strong></li>
			<li class="step3"><span>STEP 04</span><strong>결제완료</strong></li>
		</ul>
	</div>

	<div class="com_cart_list_wrap">
		<p class="cart_allchecker_wrap">
			<input type="checkbox" id="checkboxall" class="com_custom_all_checkbox com_custom_checkbox" checked="checked">
			<label for="checkboxall">전체선택</label>
			<strong class="com_custom_checkbox_product_name">상품명</strong>
			<strong class="com_custom_checkbox_sel_price">판매금액</strong>
			<strong class="com_custom_checkbox_cnt">수량</strong>
			<strong class="com_custom_checkbox_price">구매금액</strong>
			<strong class="com_custom_checkbox_product_sel">선택</strong>
		</p>
		
        
        <ul class="com_list_style1"><li class="" id="cart_item_idx_1049824">    <input type="checkbox" id="checkbox1049824" name="checkbox" value="1049824" class="com_custom_checkbox" checked="checked"><label for="checkbox1049824"></label>    <a href="/culture-event/popcorn-store/product-detail.aspx?GG_NO=100439" class="product_info_img">        <img src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/17223927893220.jpg" alt="<10 라이브즈> 얼리버드 관람권">        <strong class="product_info_name">&lt;10 라이브즈&gt; 얼리버드 관람권</strong>        <span class="product_info_origin" id="spanOriginName1049824">&lt;10 라이브즈&gt;(더빙) 전용 관람권 2매       </span>    </a>    <div class="product_info_wrap not_sale">        <span class="product_info_one_price" id="product_info_one_price1049824">14,000</span>    </div>    <input type="hidden" id="hid_PKAG_CNT" value="1">    <input type="hidden" id="hid_OrderCnt1049824" class="goodscnt" value="1">    <div class="product_info_cnt_wrap">        <span class="com_form_count com_form_count1049824" id="com_form_count1049824">1</span>        <a href="#none" onclick="javascript:$.fn.comFormNumberCnt('com_form_count1049824', null, null, 1, 1, 4)" class="com_btn_plus">+</a>        <a href="#none" onclick="javascript:$.fn.comFormNumberCnt('com_form_count1049824', null, null, -1, 1, 4)" class="com_btn_minus">-</a>        <a href="#none" onclick="javascript:fn_OrderAmountUpdate(1049824);" class="btn_change">변경</a>    </div>    <span class="product_info_price" id="totalgoodsprice1049824">14,000</span>    <div class="product_info_btn_wrap">      <a href="#none" onclick="javascript:fn_Buy(this, 'purchase', '1049824');">바로구매</a>      <a href="#none" onclick="javascript:fn_Buy(this, 'gift', '1049824');">선물하기</a>    </div>    <a href="javascript:fn_Del('1049824')" class="btn_product_delect">삭제</a>   </li></ul><a href="#none" class="btn_del_selected" onclick="javascript:fn_SelProductDelete();">선택상품 삭제<span id="spanSelCnt" style="display: inline;">1</span></a><span id="notimsg">장바구니에 담긴 상품은 최대 30일까지 보관됩니다.</span>

        
        <table class="com_cart_total_price_wrap" summary="총 상품 금액, 할인금액을 합산한 총 결제예정 금액 표기">
    <caption>총 결제 예정금액 표</caption>
    <colgroup>
        <col style="width:30%">
        <col style="width:36%">
        <col style="width:34%">
    </colgroup>
    <thead>
        <tr>
            <th>총 상품 금액</th>
            <th>할인금액</th>
            <th>총 결제 예정금액</th>
        </tr>
    </thead>
   <tbody>
        <tr>
            <td><strong><span id="sTot_Sales_Price">14,000</span></strong></td>
            <td class="com_cart_calculator_marker"><strong><span id="s_Tot_Promotion">0</span></strong></td>
            <td><strong class="cart_total_price"><span id="sTot_Promotion_Price">14,000</span></strong></td>
        </tr>
    </tbody>
</table>


		<div class="com_btn_wrap pT60">
            <a href="#none" class="btn_style0 " onclick="javascript:fn_Buy(this, 'gift', '');">선물하기</a><a href="#none" class="btn_style0 " onclick="javascript:fn_Buy(this, 'purchase', '');">구매하기</a>
		</div>
	</div>


            
            <!--/ Contents End -->
		 </div>