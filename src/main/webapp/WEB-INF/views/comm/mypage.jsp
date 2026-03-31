<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page - GGUEK</title>
<style>
    body {
        background-color: rgb(252, 255, 255);
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .profile-card {
        background: #ffffff;
        width: 400px;
        padding: 40px;
        border-radius: 15px;
        text-align: center;
    }
    .profile-card h2 {
        margin-bottom: 30px;
        color: #333;
        font-weight: 600;
    }
    .info-group {
        text-align: left;
        margin-bottom: 20px;
        border-bottom: 1px solid #eee;
        padding-bottom: 10px;
    }
    .info-label {
        font-size: 12px;
        color: #999;
        text-transform: uppercase;
        margin-bottom: 5px;
        display: block;
    }
    .info-value {
        font-size: 16px;
        color: #333;
        font-weight: 500;
    }
    .btn-group {
        margin-top: 30px;
        display: flex;
        gap: 10px;
    }
    .btn {
        flex: 1;
        padding: 12px;
        text-decoration: none;
        border-radius: 8px;
        font-size: 14px;
        transition: 0.3s;
    }
    .edit-btn {
        background-color: #222;
        color: white;
    }
    .edit-btn:hover {
        background-color: #444;
    }
    .out-btn {
        background-color: #eee;
        color: #666;
    }
    .out-btn:hover {
        background-color: #ddd;
    }
</style>
</head>
<body>

    <div class="profile-card">
        <h2>내 정보 확인</h2>
        
        <div class="info-group">
            <span class="info-label">ID</span>
            <div class="info-value">${myInfo.memberId}</div>
        </div>

        <div class="info-group">
            <span class="info-label">Name</span>
            <div class="info-value">${myInfo.memberName}</div>
        </div>

        <div class="info-group">
            <span class="info-label">Email</span>
            <div class="info-value">${myInfo.memberEmail}</div>
        </div>

        <div class="btn-group">
            <a href="${pageContext.request.contextPath}/comm/info_edit" class="btn edit-btn">정보 수정</a>
            <a href="${pageContext.request.contextPath}/comm/list" class="btn out-btn">나가기</a>
        </div>
    </div>

</body>
</html>