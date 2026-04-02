<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - H 시스템</title>
<c:import url="/WEB-INF/views/temp/head.jsp"></c:import>
</head>

<body class="d-flex flex-column h-100">
    <main class="flex-shrink-0">
        <c:import url="/WEB-INF/views/temp/nav.jsp"></c:import>

        <section class="py-5">
            <div class="container px-5 mb-5">
                
                <div class="text-center mb-5">
                    <h1 class="display-5 fw-bolder mb-0">
                        <span class="text-gradient d-inline">Login</span>
                    </h1>
                </div>

                <div class="bg-light rounded-4 py-5 px-4 px-md-5">
                    <div class="text-center mb-5">
                        <div class="feature bg-primary bg-gradient-primary-to-secondary text-white rounded-3 mb-3">
                            <i class="bi bi-person"></i>
                        </div>
                        <h1 class="fw-bolder">로그인</h1>
                        <p class="lead fw-normal text-muted mb-0">시스템 이용을 위해 사원 정보를 입력하세요.</p>
                    </div>

                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            
                            <form action="./login" method="post">
                                
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="employeeId" type="text" name="employeeId" 
                                           placeholder="ID" required />
                                    <label for="employeeId">아이디</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input class="form-control" id="password" type="password" name="password" 
                                           placeholder="Password" required />
                                    <label for="password">비밀번호</label>
                                </div>

                                <div class="d-grid mt-4">
                                    <button class="btn btn-primary btn-lg fw-bold" id="loginButton" type="submit">
                                        로그인
                                    </button>
                                </div>
                                
                                <div class="text-center mt-3">
                                    <small class="text-muted">계정 정보가 기억나지 않으시나요? 관리자에게 문의하세요.</small>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </main>

    <c:import url="/WEB-INF/views/temp/footer.jsp"></c:import>
</body>
</html>