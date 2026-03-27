<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>부서 정보 수정</h4>

<form action="./update" method="post">
        <input type="hidden" name="departmentId" value="${dto.departmentId}">
		<div>
			<label for="ch2">부서명</label>
			<!-- DTO의 setter의 이름과 동일하게 -->
			<input type="text" value="${dto.departmentName}" name="departmentName">
		</div>
		<div>
			<label>관리자코드</label>
			<input type="text" value="${dto.managerId}" name="managerId">
		</div>
		<div>
			<label>지역코드</label>
			<input type="text" value="${dto.locationId}" name="locationId">
		</div>
		
		<button type="submit">button</button>
		<input type="submit" value="create">
		<input type="button" value="등록">
		<input type="reset" value="reset">
	
	</form>
</body>
</html>