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
					<div class="bg-light rounded-4 py-5 px-4 px-md-5">
						<div class="text-center mb-5">
							<div
								class="feature bg-primary bg-gradient-primary-to-secondary text-white rounded-3 mb-3">
								<i class="bi bi-envelope"></i>
							</div>
							<h1 class="fw-bolder">부서 정보 수정</h1>
							<p class="lead fw-normal text-muted mb-0">수정할 부서의 정보를 입력하세요.</p>
						</div>
						<div class="row gx-5 justify-content-center">
							<div class="col-lg-8 col-xl-6">
								<!-- * * * * * * * * * * * * * * *-->
								<!-- * * SB Forms Contact Form * *-->
								<!-- * * * * * * * * * * * * * * *-->
								<!-- This form is pre-integrated with SB Forms.-->
								<!-- To make this form functional, sign up at-->
								<!-- https://startbootstrap.com/solution/contact-forms-->
								<!-- to get an API token!-->
								<form id="contactForm" action="./update" method="post">
								<input type="hidden" name="departmentId" value="${dto.departmentId}">
									<!-- Name input-->
									<div class="form-floating mb-3">
										<input class="form-control" id="name" type="text" value="${dto.departmentName}" name="departmentName"
											placeholder="Enter your name..."
											data-sb-validations="required" /> <label for="name">부서명</label>
										<div class="invalid-feedback" data-sb-feedback="name:required">A
											name is required.</div>
									</div>
									<!-- Name input-->
									<div class="form-floating mb-3">
										<input class="form-control" id="name2" type="text" value="${dto.managerId}" name="managerId"
											placeholder="Enter your name..."
											data-sb-validations="required" /> <label for="name2">관리자코드</label>
										<div class="invalid-feedback"
											data-sb-feedback="name2:required">A name is required.</div>
									</div>
									<!-- Name input-->
									<div class="form-floating mb-3">
										<input class="form-control" id="name3" type="text" value="${dto.locationId}" name="locationId"
											placeholder="Enter your name..."
											data-sb-validations="required" /> <label for="name3">지역코드</label>
										<div class="invalid-feedback"
											data-sb-feedback="name3:required">A name is required.</div>
									</div>
									<!-- Message input-->

									<!-- Submit success message-->
									<!---->
									<!-- This is what your users will see when the form-->
									<!-- has successfully submitted-->
									<div class="d-none" id="submitSuccessMessage">
										<div class="text-center mb-3">
											<div class="fw-bolder">Form submission successful!</div>
											To activate this form, sign up at <br /> <a
												href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
										</div>
									</div>
									<!-- Submit error message-->
									<!---->
									<!-- This is what your users will see when there is-->
									<!-- an error submitting the form-->
									<div class="d-none" id="submitErrorMessage">
										<div class="text-center text-danger mb-3">Error sending
											message!</div>
									</div>
									<!-- Submit Button-->
									<div class="d-grid">
										<button class="btn btn-primary btn-lg" id="submitButton"
											type="submit">Submit</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>

	</main>
	<c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>

</html>