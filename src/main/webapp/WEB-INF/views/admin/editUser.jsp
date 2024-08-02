<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>유저 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .form-group {
            margin-bottom: 15px;
            width: 50%;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input, .form-group select {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>유저 수정</h1>
    <form method="post" action="${pageContext.request.contextPath}/admin/editUser">
        <input type="hidden" name="memberId" value="${member.memberId}">
        
        <div class="form-group">
            <label for="memberName">이름:</label>
            <input type="text" id="memberName" name="memberName" value="${member.memberName}" required>
        </div>

        <div class="form-group">
            <label for="memberPassword">비밀번호:</label>
            <input type="password" id="memberPassword" name="memberPassword" value="${member.memberPassword}" required>
        </div>

        <div class="form-group">
            <label for="memberGender">성별:</label>
            <select id="memberGender" name="memberGender" required>
                <option value="M" ${member.memberGender == 'M' ? 'selected' : ''}>남</option>
                <option value="F" ${member.memberGender == 'F' ? 'selected' : ''}>여</option>
            </select>
        </div>

        <div class="form-group">
            <label for="memberSocialSecurityNum">주민등록번호:</label>
            <input type="text" id="memberSocialSecurityNum" name="memberSocialSecurityNum" value="${member.memberSocialSecurityNum}" required>
        </div>

        <div class="form-group">
            <label for="memberPhone">전화번호:</label>
            <input type="text" id="memberPhone" name="memberPhone" value="${member.memberPhone}" required>
        </div>

   

        <div class="form-group">
            <label for="memberEmail">이메일:</label>
            <input type="email" id="memberEmail" name="memberEmail" value="${member.memberEmail}" required>
        </div>

        <div class="form-group">
            <label for="memberCoupon">쿠폰:</label>
            <input type="number" id="memberCoupon" name="memberCoupon" value="${member.memberCoupon}" required>
        </div>

        <div class="form-group">
            <label for="memberAdmin">관리자:</label>
            <select id="memberAdmin" name="memberAdmin" required>
                <option value="true" ${member.memberAdmin ? 'selected' : ''}>Y</option>
                <option value="false" ${!member.memberAdmin ? 'selected' : ''}>N</option>
            </select>
        </div>

        <div class="form-group">
            <label for="memberStamp">스탬프:</label>
            <input type="number" id="memberStamp" name="memberStamp" value="${member.memberStamp}" required>
        </div>

        <button type="submit" class="btn">수정</button>
    </form>
</div>
</body>
</html>
