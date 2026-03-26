<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>부서 등록 페이지</h3>
	
	<form action="./create" method="post">
		<div>
			<label for="ch2">부서명</label>
			<!-- DTO의 setter의 이름과 동일하게 -->
			<input type="text" name="departmentName">
		</div>
		<div>
			<label>관리자코드</label>
			<input type="text" name="managerId">
		</div>
		<div>
			<label>지역코드</label>
			<input type="text" name="locationId">
		</div>
		
		<button type="submit">button</button>
		<input type="submit" value="create">
		<input type="button" value="등록">
		<input type="reset" value="reset">
	
	</form>
	
</body>
</html>