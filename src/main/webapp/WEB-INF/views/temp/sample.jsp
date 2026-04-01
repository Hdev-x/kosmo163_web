<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="/WEB-INF/views/temp/head.jsp"></c:import>
</head>

<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<c:import url="/WEB-INF/views/temp/nav.jsp"></c:import>
		
		<section class="py-5">
			<div class="container px-5 mb-5">

				<div class="text-center mb-5">
					<h1 class="display-5 fw-bolder mb-0">
						<span class="text-gradient d-inline">Projects</span>
					</h1>
				</div>
				
				<div class="row gx-5 justify-content-center"> 
					페이지 내용
				</div>
				
			</div>
		</section>

	</main>
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>

</html>


<!------------------------------------------------------------------------>



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
