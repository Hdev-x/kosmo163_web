<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.*" %>

<%-- <%
    // [학습용] DB 연동 전, 화면을 10개 데이터로 채워보기 위한 코드
    List<Map<String, Object>> mockList = new ArrayList<>();
    
    // 10번 반복하며 가짜 데이터를 만듭니다.
    for(int i = 10; i >= 1; i--) {
        Map<String, Object> row = new HashMap<>();
        row.put("no", i);                                   // 글번호
        row.put("star", (i % 4 == 0) ? 1 : 0);              // 4의 배수마다 중요 표시(★)
        row.put("title", i + "번째 게시글 예시 제목입니다.");      // 제목
        row.put("name", "작성자" + i);                       // 작성자
        row.put("createTime", "2026-03-29");                // 작성시간
        mockList.add(row);
    }
    
    // 이 데이터를 'commList'라는 이름으로 저장해두면 아래 JSTL이 인식합니다.
    request.setAttribute("commList", mockList);
%> --%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>COMM LIST</title>
    <style>
        /* 기본 테이블 스타일 */
        table { width: 100%; border-collapse: collapse; margin-top: 20px; font-family: sans-serif; }
        th, td { border: 1px solid #ddd; padding: 12px; text-align: center; }
        th { background-color: #333; color: white; }
        tr:hover { background-color: #f5f5f5; } /* 마우스 올리면 색 변함 */
        
        /* 제목은 왼쪽 정렬 */
        .title-cell { text-align: left; padding-left: 20px; }
        .title-cell a { color: #007bff; text-decoration: none; }
        .title-cell a:hover { text-decoration: underline; }
        
        /* 별 모양 강조 */
        .star { color: #f39c12; font-weight: bold; }
        
        /* 버튼 스타일 */
        .write-btn { 
            float: right; padding: 10px 20px; background: #2c3e50; 
            color: #fff; text-decoration: none; border-radius: 4px; font-weight: bold;
        }
    </style>
</head>
<body>
    <h1>COMMUNITY</h1>

    <a href="/comm/create" class="write-btn">글쓰기</a>
    <a href="/comm/mypage" class="mypage-btn">마이페이지</a>

    <table>
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
                <tr>
                    <%-- [1] item.no -> item.commNo --%>
                    <td>${item.commNo}</td>
                    
                    <%-- [2] item.star -> item.commStar --%>
                    <td class="star">${item.commStar == 1 ? '★' : '☆'}</td>
                    
                    <td class="title-cell">
                        <%-- [3] item.no -> item.commNo / item.title -> item.commTitle --%>
                        <a href="${pageContext.request.contextPath}/comm/detail?no=${item.commNo}">
                            ${item.commTitle}
                        </a>
                    </td>
                    
                    <%-- [4] item.name -> item.commName --%>
                    <td>${item.commName}</td>
                    
                    <%-- [5] item.createTime -> item.commTime --%>
                    <td>${item.commTime}</td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="5">등록된 게시글이 없습니다.</td>
            </tr>
        </c:otherwise>
    </c:choose>
</tbody>
</table>

</body>
</html>