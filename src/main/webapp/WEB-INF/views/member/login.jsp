<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
    /* 1. 배경 설정: 화면 중앙 정렬 */
    body {
        font-family: 'Pretendard', sans-serif;
        background-color: white;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    /* 2. 로그인 박스 디자인 */
    .login-container {
        background-color: white;
        padding: 40px;
        width: 320px;
    }

    h1 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
    }

    /* 3. 입력창 디자인 */
    .input-group {
        margin-bottom: 20px;
    }

    label {
        display: block;
        margin-bottom: 8px;
        font-size: 14px;
        color: #666;
    }

    input {
        width: 100%;
        padding: 12px;
        box-sizing: border-box; /* 패딩 포함 크기 계산 */
        border: 1px solid #ddd;
        border-radius: 6px;
        font-size: 16px;
        outline: none;
        transition: border-color 0.3s;
    }

    input:focus {
        border-color: #222; /* 클릭 시 파란색 포인트 */
    }

    /* 4. 버튼 디자인 */
    button {
        width: 100%;
        padding: 14px;
        background-color: #222;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    button:hover {
        background-color: #444; /* 마우스 올렸을 때 더 진하게 */
    }
</style>

</head>
<body>
	<div class="login-container">

		<h1>로그인 페이지</h1>

		<form action="./login" method="post">

			<div class="input-group">
				<label>아이디</label>
				<input type="text" name="memberId" placeholder="아이디를 입력하세요">
			</div>
			
			 <div class="input-group">
				<label>비밀번호</label> 
				<input type="password" name="memberPassword" placeholder="비밀번호를 입력하세요">
			</div>

			<button type="submit">로그인</button>
		</form>
	</div>
</body>
</html>