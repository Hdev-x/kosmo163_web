package com.gguek.app.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * [DB 연결 도우미 클래스]
 * 자바 프로그램과 오라클 데이터베이스 사이의 '전화 연결'을 담당합니다.
 */
public class DBConnection {
	
	// DB와 연결된 통로(Connection)를 만들어주는 메서드입니다.
	// 문제가 생기면 호출한 곳으로 에러를 던집니다(throws Exception).
	public Connection getConnection() throws Exception {
		
		/* 1. 접속에 필요한 4가지 핵심 정보 (기본 세팅) */
		
		// DB에 접속할 사용자 아이디
		String user = "hr"; 
		
		// DB에 접속할 비밀번호
		String password = "hr"; 
		
		// 접속할 DB의 주소 (jdbc:오라클:방식:@내컴퓨터:포트번호:DB이름)
		String url = "jdbc:oracle:thin:@localhost:1521:FREE"; 
		
		// 자바와 오라클 사이의 통역사 역할을 할 드라이버 경로
		String driver = "oracle.jdbc.driver.OracleDriver";
		
		
		/* 2. 실제 연결 작업 시작 */
		
		// [Step 1] 통역사(드라이버)를 메모리에 로드합니다. 
		// "자바야, 이제부터 오라클 말을 알아듣는 드라이버를 사용할 거야!"라고 선언하는 단계입니다.
		Class.forName(driver);
		
		// [Step 2] 설정한 정보(주소, 아이디, 비번)를 가지고 실제 연결 통로를 뚫습니다.
		// 성공하면 'con'이라는 통로 객체가 생성됩니다.
		Connection con = DriverManager.getConnection(url, user, password);
		
		
		/* 3. 완성된 연결 통로를 반환 */
		
		// 이제 이 'con'을 가져가는 쪽에서 SQL문을 보내고 데이터를 받을 수 있습니다.
		return con;
		
		
	
	}
	
}