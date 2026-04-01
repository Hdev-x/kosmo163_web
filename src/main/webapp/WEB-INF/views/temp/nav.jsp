<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>


<nav class="navbar navbar-expand-lg navbar-light bg-white py-3 shadow-sm">
    <div class="container px-5">
        <a class="navbar-brand" href="/Home">
            <span class="fw-bolder text-primary ">Start Bootstrap</span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navContent">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 small fw-bold">
                <li class="nav-item"><a class="nav-link" href="/Home">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/dept/list">부서관리</a></li>
                <li class="nav-item"><a class="nav-link" href="/country/list">국가관리</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
            </ul>

            <!-- <div class="d-none d-lg-block vr mx-3 opacity-25"></div> -->

            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder align-items-center">
                <c:choose>
                    <%-- 로그인 안 했을 때: 버튼 형태로 강조 --%>
                    <c:when test="${empty sessionScope.dto}">
                        <li class="nav-item">
                            <a class="nav-link px-3" href="/emp/login">Log in</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-primary btn-sm px-3 rounded-pill" href="/signup">Sign Up</a>
                        </li>
                    </c:when>

                    <%-- 로그인 했을 때: 유저 정보 강조 --%>
                    <c:otherwise>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="bi bi-person-circle fs-5 me-2 text-primary"></i>
                                <span class="text-dark">${sessionScope.dto.employeeId}님</span>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end shadow border-0" aria-labelledby="userDropdown">
                                <li><a class="dropdown-item" href="/emp/mypage">내 프로필</a></li>
                                <!-- <li><a class="dropdown-item" href="/settings">환경설정</a></li> -->
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="/emp/logout">로그아웃</a></li>
                            </ul>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</nav>


