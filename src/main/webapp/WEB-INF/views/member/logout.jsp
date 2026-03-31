<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃 완료</title>
<style>
    /* H님의 테스트 페이지에 어울리는 간단한 스타일 */
    .container {
        text-align: center;
        margin-top: 100px;
        font-family: Arial, sans-serif;
    }
    .home-btn {
        padding: 10px 20px;
        background-color: #222; /* 초록색 버튼 */
        color: white;
        text-decoration: none;
        border-radius: 5px;
        display: inline-block;
        margin-top: 20px;
    }
    .home-btn:hover {
        background-color: #333;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>로그아웃 되었습니다.</h1>
        <p>이용해 주셔서 감사합니다.</p>
        
        <a href="${pageContext.request.contextPath}/Home" class="home-btn">홈으로 가기</a>
    </div>
</body>
</html>