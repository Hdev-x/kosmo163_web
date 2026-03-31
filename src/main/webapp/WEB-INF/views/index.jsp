<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <style>
        body, html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f1f2f6;
            font-family: 'Pretendard', sans-serif;
        }

        /* 버튼들을 가로로 배치하고 간격을 줍니다 */
        .button-group {
            display: flex;
            gap: 15px; /* 버튼 사이 간격 15px */
        }

        .btn {
            display: inline-block;
            padding: 15px 40px;
            border-radius: 12px;
            text-decoration: none;
            font-weight: 700;
            font-size: 1.2rem;
            transition: all 0.2s ease-in-out;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 14px rgba(0,0,0,0.15);
        }

        /* 로그인 & 회원가입 버튼 공통 (검은색) */
        .btn-dark {
            background-color: #222;
            color: white;
        }
        .btn-dark:hover {
            background-color: #444;
        }

        /* 로그아웃 버튼 (붉은색 유지) */
        .btn-logout {
            background-color: rgb(191, 37, 54);
            color: white;
        }
        .btn-logout:hover {
            background-color: rgb(94, 19, 33);
        }
    </style>
</head>
<body>

    <div class="button-group">
        <c:choose>
            <%-- 로그인 전: 두 버튼 모두 검은색(btn-dark) 적용 --%>
            <c:when test="${empty sessionScope.dto}">
                <a href="${pageContext.request.contextPath}/member/login" class="btn btn-dark">Login</a>
                <a href="${pageContext.request.contextPath}/member/joins" class="btn btn-dark">Join</a>
            </c:when>

            <%-- 로그인 후 --%>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/member/logout" class="btn btn-logout">Logout</a>
            </c:otherwise>
        </c:choose>
    </div>

</body>
</html>