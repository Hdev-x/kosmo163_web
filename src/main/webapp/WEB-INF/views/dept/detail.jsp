<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>DEPT Detail Page</h1>
	
	<h4>${dto.departmentId}</h4>
	<h4>${dto.departmentName}</h4>
	<h4>${dto.managerId}</h4>
	<h4>${dto.locationId}</h4>
	
	<a href="update?departmentId=${dto.departmentId}">수정</a>
	<a href="delete?departmentId=${dto.departmentId}">삭제</a>
	<form action="delete" method="get">
		<input type="text" name="departmentId" value="${dto.departmentId}">
		<button>DELETE</button>
	</form>
	
</body>
</html>