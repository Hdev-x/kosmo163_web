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
				<!------------------------------------------------------------------------>

				<div
					class="container d-flex justify-content-center align-items-center min-vh-50">
					<div class="col-md-8 col-lg-5">

						<h3 class="text-center mb-4 fw-bold">상세 정보</h3>

						<div class="card border-0 shadow">
							<table class="table table-striped m-0">
								<colgroup>
									<col style="width: 40%;">
									<col style="width: 60%;">
								</colgroup>
								<tbody>
									<tr>
										<th class="ps-4 py-3 text-secondary">부서 번호</th>
										<td class="py-3">${dto.departmentId}</td>
									</tr>
									<tr>
										<th class="ps-4 py-3 text-secondary">부서 이름</th>
										<td class="py-3 fw-bold">${dto.departmentName}</td>
									</tr>
									<tr>
										<th class="ps-4 py-3 text-secondary">매니저 ID</th>
										<td class="py-3">${dto.managerId}</td>
									</tr>
									<tr>
										<th class="ps-4 py-3 text-secondary">위치 ID</th>
										<td class="py-3">${dto.locationId}</td>
									</tr>
								</tbody>
							</table>
						</div>

						<div class="d-flex justify-content-center gap-3 mt-4">
							<a href="update?departmentId=${dto.departmentId}"
								class="btn btn-dark px-4 shadow-sm"> 수정 </a>

							<form action="delete" method="get" class="m-0">
								<input type="hidden" name="departmentId"
									value="${dto.departmentId}">
								<button type="submit"
									class="btn btn-outline-dark px-4 shadow-sm"
									onclick="return confirm('정말 삭제하시겠습니까?');">삭제</button>
							</form>
						</div>

					</div>
				</div>

			</div>
		</section>
		<!------------------------------------------------------------------------>
	</main>
	<!-- Footer-->
	<!-- Bootstrap core JS-->
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>

</html>



