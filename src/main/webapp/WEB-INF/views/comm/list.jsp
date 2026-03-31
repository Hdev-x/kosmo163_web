<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>COMM LIST</title>
    <style>
        /* 기본 스타일 초기화 */
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; padding: 20px; color: rgb(27, 27, 27); background-color: #f9f9f9; }
        h1 { color: rgb(27, 27, 27); margin-bottom: 30px; border-bottom: 2px solid #2c3e50; padding-bottom: 10px; }

        /* [핵심 수정] 테이블 스타일 및 비율 */
        table { 
            width: 100%; 
            border-collapse: separate; /* 둥근 모서리를 위해 separate 사용 */
            border-spacing: 0;
            margin-top: 10px; 
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden; /* 둥근 모서리 밖으로 내용 안나가게 */
            box-shadow: 0 4px 6px rgba(0,0,0,0.1); /* 그림자 효과 */
        }
        
        th, td { padding: 15px; text-align: center; border-bottom: 1px solid #eee; }
        
        /* 헤더 스타일 */
        th { background-color: rgb(27, 27, 27); color: rgb(234, 252, 255); font-weight: 600; font-size: 13px; text-transform: uppercase; letter-spacing: 1px; }
        
        /* 마우스 호버 효과 */
        tr:not(.no-data):hover td { background-color: #fbfdff; cursor: pointer; } 
        
        /* 제목 셀 스타일 (왼쪽 정렬 및 강조) */
        .title-cell { text-align: left; padding-left: 25px; }
        .title-cell a { color: #333; text-decoration: none; font-weight: 500; font-size: 15px; transition: color 0.2s; }
        .title-cell a:hover { color: #007bff; text-decoration: underline; }
        
        /* 별 모양 스타일 */
        .star { color: #f39c12; font-size: 1.1em; }
        
        /* 데이터 없을 때 스타일 */
        .no-data td { color: #7f8c8d; padding: 40px; font-style: italic; }

        /* 상단 버튼 컨테이너 */
        .button-container { display: flex; justify-content: flex-end; gap: 8px; margin-bottom: 15px; }

        /* 공통 버튼 스타일 */
        .btn { padding: 9px 18px; text-decoration: none; border-radius: 6px; font-weight: bold; font-size: 13px; transition: all 0.2s; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .btn:hover { transform: translateY(-1px); box-shadow: 0 4px 6px rgba(0,0,0,0.15); }
        .btn:active { transform: translateY(0px); }

        /* 버튼별 색상 */
        .write-btn { background: rgb(41, 41, 41); color: #fff; }
        .write-btn:hover { background: rgb(27, 27, 27); }
        .mypage-btn { background: #ecf0f1; color: #7f8c8d; border: 1px solid #dfe6e9; }
        .mypage-btn:hover { background: #bdc3c7; color: #fff; }
        .logout-btn { background: #e74c3c; color: #fff; }
        .logout-btn:hover { background: #c0392b; }
    </style>
</head>
<body>
    <h1>COMMUNITY</h1>

    <div class="button-container">
        <a href="${pageContext.request.contextPath}/comm/create" class="btn write-btn">글쓰기</a>
        <a href="${pageContext.request.contextPath}/comm/mypage" class="btn mypage-btn">마이페이지</a>
        <a href="${pageContext.request.contextPath}/member/logout" class="btn logout-btn">로그아웃</a>
    </div>

    <table>
        <colgroup>
            <col style="width: 8%;" />  <col style="width: 10%;" /> <col style="width: 52%;" /> <col style="width: 15%;" /> <col style="width: 15%;" /> </colgroup>

        <thead>
            <tr>
                <th>No</th>
                <th>중요도</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성시간</th>
            </tr>
        </thead>
        <tbody>
        <c:choose>
            <c:when test="${not empty commList}">
                <c:forEach var="item" items="${commList}">
                    <tr onclick="location.href='${pageContext.request.contextPath}/comm/detail?no=${item.commNo}'">
                        <td>${item.commNo}</td>
                        <td class="star">${item.commStar == 1 ? '★' : '☆'}</td>
                        <td class="title-cell">
                            <a href="${pageContext.request.contextPath}/comm/detail?no=${item.commNo}">
                                ${item.commTitle}
                            </a>
                        </td>
                        <td>${item.commName}</td>
                        <td><fmt:formatDate value="${item.commTime}" pattern="yyyy-MM-dd" /></td>
                    </tr>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <tr class="no-data">
                    <td colspan="5">등록된 게시글이 없습니다. 첫 번째 글의 주인공이 되어보세요!</td>
                }
                </tr>
            </c:otherwise>
        </c:choose>
        </tbody>
    </table>

<div class="pagination">
        <%-- [처음으로] --%>
        <a href="?page=1" class="page-btn ${pageVo.currentPage == 1 ? 'disabled' : ''}">&laquo; 처음</a>
        
        <%-- [이전 5개] --%>
        <c:if test="${pageVo.prev}">
            <a href="?page=${pageVo.startPage - 1}" class="page-btn">이전</a>
        </c:if>

        <%-- [페이지 번호 1 2 3 4 5] --%>
        <c:forEach var="num" begin="${pageVo.startPage}" end="${pageVo.endPage}">
            <a href="?page=${num}" class="page-btn ${pageVo.currentPage == num ? 'active' : ''}">${num}</a>
        </c:forEach>

        <%-- [다음 5개] --%>
        <c:if test="${pageVo.next}">
            <a href="?page=${pageVo.endPage + 1}" class="page-btn">다음</a>
        </c:if>

        <%-- [마지막으로] --%>
        <c:set var="lastPage" value="${Math.ceil(pageVo.total / 10.0).intValue()}" />
        <a href="?page=${lastPage == 0 ? 1 : lastPage}" class="page-btn ${pageVo.currentPage == lastPage || lastPage == 0 ? 'disabled' : ''}">끝 &raquo;</a>
    </div>

<!----------------------------------------------->

    <style>
        .pagination { 
            display: flex; 
            justify-content: center; 
            margin-top: 30px; 
            gap: 5px; 
        }
        .page-btn { 
            padding: 8px 14px; 
            border: 1px solid #dfe6e9; 
            background: #fff; 
            color: #2d3436; 
            text-decoration: none; 
            border-radius: 4px; 
            font-size: 14px; 
            font-weight: 500;
            transition: all 0.2s;
        }
        /* 현재 내가 보고 있는 페이지 번호 */
        .page-btn.active { 
            background: rgb(27, 27, 27); 
            color: #fff; 
            border-color: rgb(27, 27, 27); 
            box-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }
        /* 버튼 호버 효과 */
        .page-btn:hover:not(.active):not(.disabled) { 
            background: #f1f2f6; 
            border-color: #b2bec3;
        }
        /* 클릭 불가능한 버튼 (처음/끝) */
        .page-btn.disabled { 
            pointer-events: none; 
            color: #dfe6e9; 
            background: #f9f9f9;
        }
    </style>
    
    
<!----------------------------------------------->


</body>
</html>