<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<style>
    /* 전체 배경과 기본 폰트 설정 */
    body, html {
        height: 100%;
        margin: 0;
        display: flex;
        justify-content: center; /* 가로 중앙 */
        align-items: center;     /* 세로 중앙 */
        background-color: #f1f2f6; /* 연한 회색 배경 */
        font-family: 'Pretendard', sans-serif;
    }

    /* 회원가입 폼을 감싸는 상자 (카드 스타일) - [수정] 1.5배 확장 */
    .join-container {
        background-color: white;
        padding: 40px 50px;
        border-radius: 16px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.05); /* 은은한 그림자 */
        width: 100%;
        max-width: 800px; /* [NEW] 600px * 1.5 = 900px로 변경 */
        box-sizing: border-box;
    }

    h1 {
        text-align: center;
        font-size: 2rem;
        font-weight: 800;
        margin-top: 0;
        margin-bottom: 30px;
        color: #222;
    }

    /* 각 입력 필드를 감싸는 div */
    .input-group {
        margin-bottom: 20px; /* 입력 필드 사이 간격 */
    }

    /* 라벨 (아이디, 비밀번호 등) */
    label {
        display: block; /* 줄바꿈 */
        font-size: 0.95rem;
        font-weight: 600;
        margin-bottom: 8px; /* 라벨과 입력창 간격 */
        color: #555;
    }

    /* 모든 입력창 (input type="text", "password", "email") */
    /* [자동 적용] 너비가 100%이므로, 부모 컨테이너가 1.5배 넓어지면 자동으로 같이 넓어집니다. */
    input[type="text"],
    input[type="password"],
    input[type="email"] {
        width: 100%; /* 너비 꽉 차게 */
        padding: 15px;
        border: 2px solid #ddd; /* 회색 테두리 */
        border-radius: 10px;
        font-size: 1rem;
        box-sizing: border-box; /* 패딩을 포함한 크기 계산 */
        transition: all 0.2s ease-in-out;
    }

    /* 입력창 마우스 올렸을 때 & 포커스 되었을 때 */
    input[type="text"]:hover,
    input[type="password"]:hover,
    input[type="email"]:hover {
        border-color: #ccc; /* 테두리 살짝 진하게 */
    }

    input[type="text"]:focus,
    input[type="password"]:focus,
    input[type="email"]:focus {
        outline: none; /* 파란색 기본 테두리 제거 */
        border-color: #222; /* 검은색 테두리로 포인트 */
        box-shadow: 0 0 8px rgba(0,0,0,0.1);
    }

    /* [요청] 검정색 버튼 기본 스타일 */
    /* [자동 적용] 너비가 100%이므로, 부모 컨테이너가 1.5배 넓어지면 자동으로 같이 넓어집니다. */
    .btn-submit {
        display: block;
        width: 100%; /* 너비 꽉 차게 */
        padding: 18px;
        background-color: #222; /* [NEW] H님 요청 검정색 유지 */
        color: white;
        border: none;
        border-radius: 12px;
        font-size: 1.2rem;
        font-weight: 700;
        cursor: pointer;
        transition: all 0.2s ease-in-out;
        margin-top: 35px; /* 위쪽 간격 */
        box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    /* 마우스 올렸을 때 효과 */
    .btn-submit:hover {
        transform: translateY(-3px); /* 살짝 위로 이동 */
        box-shadow: 0 7px 14px rgba(0,0,0,0.15);
        background-color: #444; /* 살짝 연한 검정색으로 변함 */
    }

    /* 반응형: 화면이 작아지면 여백을 줄임 */
    /* @media (max-width: 480px) {
        .join-container {
            padding: 30px;
            border-radius: 12px; */
        }
    }
</style>
</head>
<body>

    <div class="join-container">
        <h1>회원가입</h1>
        
        <%-- 현업에서 필수인 Context Path를 추가했습니다. --%>
        <form action="${pageContext.request.contextPath}./joins" method="post">
            
            <div class="input-group">
                <label for="memberID">아이디</label>
                <%-- 가독성을 위해 <br> 대신 CSS로 정렬했습니다. --%>
                <input type="text" id="memberID" name="memberID" placeholder="사용할 아이디를 입력하세요">
            </div>
            
            <div class="input-group">
                <label for="memberPassword">비밀번호</label>
                <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호 (8자 이상 권장)">
            </div>
            
            <div class="input-group">
                <label for="memberName">이름</label>
                <input type="text" id="memberName" name="memberName" placeholder="홍길동">
            </div>
            
            <div class="input-group">
                <label for="memberEmail">이메일</label>
                <input type="email" id="memberEmail" name="memberEmail" placeholder="example@gguek.com">
            </div>
            
            <%-- 버튼은 기존 검은색을 유지하면서 CSS를 입혔습니다. --%>
            <button type="submit" class="btn-submit">가입하기</button>
        
        </form>
    </div>

</body>
</html>