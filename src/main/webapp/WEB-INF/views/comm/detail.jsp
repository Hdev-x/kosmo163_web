<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
    <style>
        .detail-container { width: 800px; margin: 50px auto; font-family: 'Malgun Gothic', sans-serif; border: 1px solid #eee; padding: 40px; box-shadow: 0 4px 10px rgba(0,0,0,0.05); }
        
        /* 1. 제목 영역 */
        .post-title { font-size: 28px; font-weight: bold; margin-bottom: 20px; color: #2c3e50; border-bottom: 2px solid #34495e; padding-bottom: 15px; }
        
        /* 2. 작성자 | 시간 | 중요도 라인 */
        .post-info { display: flex; gap: 15px; color: #7f8c8d; font-size: 14px; margin-bottom: 30px; background: #f9f9f9; padding: 10px; border-radius: 5px; }
        .info-item { display: flex; align-items: center; }
        .info-item::after { content: "|"; margin-left: 15px; color: #ddd; }
        .info-item:last-child::after { content: ""; } /* 마지막은 구분선 제거 */
        
        /* 3. 내용 영역 */
        .post-content { min-height: 300px; line-height: 1.8; font-size: 16px; color: #333; white-space: pre-wrap; /* 줄바꿈 유지 */ }
        
        /* 하단 버튼 */
        .btn-area { margin-top: 40px; text-align: center; border-top: 1px solid #eee; padding-top: 20px; }
        .list-btn { padding: 10px 30px; background: #2c3e50; color: white; text-decoration: none; border-radius: 4px; font-weight: bold; }
        .star { color: #f39c12; }
    </style>
</head>
<body>

<div class="detail-container">
    <div class="post-title">
        ${not empty detail ? detail.title : "상세페이지 예시 제목입니다."}
    </div>

    <div class="post-info">
        <div class="info-item"><b>작성자</b> : ${not empty detail ? detail.name : "GGUEK"}</div>
        <div class="info-item"><b>작성시간</b> : ${not empty detail ? detail.createTime : "2026-03-30"}</div>
        <div class="info-item"><b>중요도</b> : <span class="star">${detail.star == 1 ? '★ 중요' : '☆ 일반'}</span></div>
    </div>

    <div class="post-content">
${not empty detail ? detail.content : "여기는 게시글의 상세 내용이 표시되는 구역입니다. 
가짜 데이터로 채워져 있으며, 나중에 DB에서 가져온 실제 내용이 여기에 뿌려지게 됩니다. 
줄바꿈도 잘 유지되도록 설정해두었습니다."}
    </div>

    <div class="btn-area">
        <a href="${pageContext.request.contextPath}/comm/list" class="list-btn">목록으로 돌아가기</a>
    </div>
</div>

</body>
</html>