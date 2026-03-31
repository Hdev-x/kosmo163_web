<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 수정 - GGUEK</title>
<style>
    body {
        background-color: #f4f7f6;
        font-family: 'Segoe UI', sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .edit-container {
        background: #fff;
        width: 450px;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.08);
    }
    .edit-container h2 {
        text-align: center;
        margin-bottom: 30px;
        color: #333;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        font-size: 13px;
        color: #666;
        margin-bottom: 8px;
        font-weight: 600;
    }
    .form-group input {
        width: 100%;
        padding: 12px;
        border: 1px solid #ddd;
        border-radius: 6px;
        box-sizing: border-box; /* 패딩이 너비에 포함되도록 함 */
        font-size: 15px;
    }
    .form-group input[readonly] {
        background-color: #f9f9f9;
        color: #999;
        cursor: not-allowed;
    }
    .btn-group {
        display: flex;
        gap: 10px;
        margin-top: 30px;
    }
    .btn {
        flex: 1;
        padding: 14px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 15px;
        font-weight: 600;
        text-align: center;
        text-decoration: none;
        transition: 0.2s;
    }
    .submit-btn {
        background-color: #222;
        color: white;
    }
    .submit-btn:hover {
        background-color: #444;
    }
    .cancel-btn {
        background-color: #eee;
        color: #666;
    }
    .cancel-btn:hover {
        background-color: #ddd;
    }
</style>
</head>
<body>

    <div class="edit-container">
        <h2>회원정보 수정</h2>
        
        <form action="${pageContext.request.contextPath}/comm/info_edit" method="post">
            
            <div class="form-group">
                <label>아이디</label>
                <input type="text" name="memberId" value="${myInfo.memberId}" readonly>
            </div>

            <div class="form-group">
                <label>이름</label>
                <input type="text" name="memberName" value="${myInfo.memberName}" required>
            </div>

            <div class="form-group">
                <label>이메일</label>
                <input type="email" name="memberEmail" value="${myInfo.memberEmail}" required>
            </div>

            <div class="form-group">
                <label>새 비밀번호 (변경 시 입력)</label>
                <input type="password" name="memberPassword" placeholder="비밀번호를 입력하세요">
            </div>

            <div class="btn-group">
                <button type="submit" class="btn submit-btn">변경 내용 저장</button>
                <a href="${pageContext.request.contextPath}/comm/mypage" class="btn cancel-btn">취소</a>
            </div>
            
        </form>
    </div>

</body>
</html>