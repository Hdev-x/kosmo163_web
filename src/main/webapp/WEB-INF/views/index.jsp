<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<body>
		<h1>Index Page H</h1>
		<a href="/dept/list">부서관리</a> <br>
		<a href="/country/list">국가관리</a> <br>
		
		<c:if test="${empty dto}">
		<a href = "/emp/login">Login</a>
		</c:if>
		
		<c:if test="${not empty dto}">
		<a href = "/emp/logout">Logout</a>
		</c:if>
	</body>
</html>