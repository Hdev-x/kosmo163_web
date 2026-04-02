<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 목록 - H 시스템</title>
<c:import url="/WEB-INF/views/temp/head.jsp"></c:import>
</head>

<body class="d-flex flex-column h-100">
    <main class="flex-shrink-0">
        <c:import url="/WEB-INF/views/temp/nav.jsp"></c:import>

        <section class="py-5">
            <div class="container px-5 mb-5">
                
                <div class="text-center mb-5">
                    <h1 class="display-5 fw-bolder mb-0">
                        <span class="text-gradient d-inline">Departments</span>
                    </h1>
                </div>

                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-11 col-xl-9">
                        
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h2 class="fw-bolder mb-0">부서 현황</h2>
                            <a class="btn btn-primary px-3 py-2" href="./create">
                                <div class="d-inline-block bi bi-plus-lg me-2"></div>
                                신규 부서 등록
                            </a>
                        </div>

                        <div class="card shadow border-0 rounded-4 mb-5">
                            <div class="card-body p-5">
                                <div class="table-responsive">
                                    <table class="table table-hover align-middle">
                                        <thead class="table-light">
                                            <tr class="text-uppercase fw-bold small">
                                                <th class="py-3 px-4" style="width: 30%">부서번호</th>
                                                <th class="py-3 px-4">부서명</th>
                                                <th class="py-3 px-5 text-end">상세보기</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${list}" var="d">
                                                <tr>
                                                    <td class="py-3 px-4">
                                                        <span class="fw-bold text-primary"># ${d.departmentId}</span>
                                                    </td>
                                                    <td class="py-3 px-4">
                                                        <div class="fw-semibold">${d.departmentName}</div>
                                                    </td>
                                                    <td class="py-3 px-3 text-end">
                                                        <a class="btn btn-outline-secondary btn-sm rounded-pill px-3" 
                                                           href="./detail?departmentId=${d.departmentId}">
                                                            View Detail
                                                        </a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            
                                            <c:if test="${empty list}">
                                                <tr>
                                                    <td colspan="3" class="text-center py-5 text-muted">
                                                        등록된 부서 정보가 없습니다.
                                                    </td>
                                                </tr>
                                            </c:if>
                                        </tbody>
                                    </table>
                                </div>
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