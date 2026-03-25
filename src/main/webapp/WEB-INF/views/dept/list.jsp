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
	<h4>부서 리스트</h4>
	
	<div>
		<table>
			<thead>
				<tr>
					<th>부서번호</th><th>부서명</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach items="${list}" var="d">
					<tr>
						<td>${d.departmentId}</td><td>${d.departmentName}</td>				
					</tr>
			<!-- getter의 이름 : getter메서드에서
				 get을 빼고 () 빼고 첫글자를 소문자로 바꾼거
				 변수명과 비슷하지만 다르다.
				 ex) getName() => name
			 -->

			 
						 
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
</body>
</html>