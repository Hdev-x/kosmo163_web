<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>국가 등록 페이지</h3>
	
	<form action="/country/create" method="post">
		<div>
			<label for="ch2">국가코드 (영문 대문자 2자)</label>
			<input type="text" name="countryId" id="ch2" 
      				maxlength="2" 
       				pattern="[A-Z]{2}" 
       				title="영문 대문자 2글자만 입력 가능합니다." 
       				required>
		</div>
		<div>
			<label>국가명</label>
			<input type="text" name="countryName">
		</div>
		<div>
   			 <label>지역코드 (10~50, 10단위)</label>
    		<input type="number" name="regionId" min="10" max="50" step="10" value="10">
		</div>
	
		
		<input type="submit" value="create">
		<input type="reset" value="reset">
	
	
	
	
	</form>
	
</body>
</html>