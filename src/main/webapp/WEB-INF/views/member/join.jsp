<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <h1>회원가입</h1>
    <form action="/member/join" method="post">
        이름: <input type="text" name="memberName"><br>
        아이디: <input type="text" name="memberID"><br>
        비밀번호: <input type="password" name="memberPassword"><br>
        이메일: <input type="text" name="memberEmail"><br>
        <button type="submit">가입하기</button>
    </form>
</body>
</html>