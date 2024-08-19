<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>유저 수정</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            margin-bottom: 40px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .btn-custom {
            padding: 10px 20px;
            background-color: #fdd000;
            color: white;
            border: none;
            cursor: pointer;
            width: 100%;
        }
        .btn-custom:hover {
            background-color: #e6c200;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <h1>회원 수정</h1>
    <form method="post" action="${pageContext.request.contextPath}/admin/editUser" class="border p-4 rounded shadow-sm">
        <input type="hidden" name="memberId" value="${member.memberId}">
        
        <div class="form-group">
            <label for="memberName">이름:</label>
            <input type="text" id="memberName" name="memberName" value="${member.memberName}" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="memberPassword">비밀번호:</label>
            <input type="text" id="memberPassword" name="memberPassword" value="${member.memberPassword}" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="memberPhone">전화번호:</label>
            <input type="text" id="memberPhone" name="memberPhone" value="${member.memberPhone}" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="memberEmail">이메일:</label>
            <input type="email" id="memberEmail" name="memberEmail" value="${member.memberEmail}" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="memberCoupon">쿠폰:</label>
            <input type="number" id="memberCoupon" name="memberCoupon" value="${member.memberCoupon}" class="form-control" required>
        </div>

        <div class="form-group">
            <label for="memberAdmin">관리자:</label>
            <select id="memberAdmin" name="memberAdmin" class="form-control" required>
                <option value="true" ${member.memberAdmin ? 'selected' : ''}>Y</option>
                <option value="false" ${!member.memberAdmin ? 'selected' : ''}>N</option>
            </select>
        </div>

        <div class="form-group">
            <label for="memberStamp">스탬프:</label>
            <input type="number" id="memberStamp" name="memberStamp" value="${member.memberStamp}" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-custom">수정</button>
    </form>
</div>
</body>
</html>

