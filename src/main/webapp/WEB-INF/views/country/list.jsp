<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>국가 리스트</h4>
	<div>
		<table>
			<thead>
				<tr>
					<th>국가번호</th><th>국가명</th>
				</tr>		
			</thead>
			<tbody>
				<c:forEach items="${list}" var="d">
				 	<tr>
				 		<td>${d.countryId}</td>
				 		<td><a href="/country/detail?countryId=${d.countryId}">${d.countryName}</td>
				 	</tr>
				</c:forEach>
			</tbody>		
		
		</table>
	</div>
</body>
</html>