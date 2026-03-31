package com.gguek.app.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.gguek.app.util.DBConnection;

public class MemberDAO {

	private DBConnection connection;

	public MemberDAO() {

		this.connection = new DBConnection();
	}

//	------------------------------------------------------------------

	// 1. DB 연결 (Open) : db.getConnection()으로 '고속도로(Connection)'를 뚫습니다.
	// 2. 쿼리문 작성 (SQL) : 수행할 명령어(INSERT, SELECT 등)를 문자열로 만듭니다.
	// 3. 쿼리 준비 (Prepare) : SQL문을 전송할 '트럭(PreparedStatement)'에 싣습니다.
	// 4. 데이터 세팅 (Bind) : SQL문의 물음표(?) 자리에 실제 데이터를 채워 넣습니다.
	// 5. 실행 및 결과 (Run) : 트럭을 출발시켜 DB에 명령을 내리고 결과를 받아옵니다.
	// 6. 자원 해제 (Close) : 사용한 트럭과 고속도로를 안전하게 닫아줍니다. (중요!)
	
//	------------------------------------------------------------------
	
	public int infoEdit(MemberDTO dto) throws Exception {
	    Connection con = connection.getConnection();
	    
	    // 1. SQL 작성: 이름과 이메일을 변경 (ID는 고유값이므로 조건절에 사용)
	    String sql = """
	                UPDATE MEMBER 
	                SET MEMBER_NAME = ?, 
	                    MEMBER_EMAIL = ?, 
	                   	MEMBER_PASSWORD = ?
	                WHERE MEMBER_ID = ?
	                """;
	    
	    PreparedStatement st = con.prepareStatement(sql);
	    
	    // 2. ? 채우기
	    st.setString(1, dto.getMemberName());
	    st.setString(2, dto.getMemberEmail());
	    st.setString(3, dto.getMemberPassword());
	    st.setString(4, dto.getMemberId());
	    
	    // 3. 실행 (수정된 행의 개수를 반환: 성공하면 1)
	    int result = st.executeUpdate();
	    
	    st.close();
	    con.close();
	    
	    return result;
	}
	
	
//	------------------------------------------------------------------
	
	public MemberDTO mypage(MemberDTO dto) throws Exception {
		
		Connection con = connection.getConnection();
		
		String sql = """
					SELECT *
					FROM MEMBER
					WHERE MEMBER_ID = ?;
				""";
		
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, dto.getMemberId());
		
		ResultSet rs = st.executeQuery();
		
		if (rs.next()) {
			dto.setMemberId(rs.getString("MEMBER_ID"));
			dto.setMemberPassword(rs.getString("MEMBER_PASSWORD"));
			dto.setMemberName(rs.getString("MEMBER_NAME"));
	        dto.setMemberEmail(rs.getString("MEMBER_EMAIL"));
		}
		
		rs.close();
		st.close();
		con.close();
		
		return dto;
		
	}
	
//	------------------------------------------------------------------

	public int join(MemberDTO dto) throws Exception {
		
		Connection con = connection.getConnection();
		
		String sql = """
					INSERT INTO MEMBER (MEMBER_ID, MEMBER_PASSWORD, MEMBER_NAME, MEMBER_EMAIL)
					VALUES (?,?,?,?)
				""";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, dto.getMemberId());
		st.setString(2, dto.getMemberPassword());
		st.setString(3, dto.getMemberName());
		st.setString(4, dto.getMemberEmail());
		
		int result = st.executeUpdate();
		
		if (result == 1) {
			System.out.println("회원가입 완료");
		}else {
			System.out.println("회원가입 실패");
		}
	
		st.close();
		con.close();
		
		return result;
		

	}

//	------------------------------------------------------------------

	public MemberDTO login(MemberDTO dto) throws Exception {

		Connection con = connection.getConnection();

		String sql = """
					SELECT *
					FROM MEMBER
					WHERE MEMBER_ID = ?
					AND MEMBER_PASSWORD = ?
				""";

		PreparedStatement st = con.prepareStatement(sql);

		st.setString(1, dto.getMemberId());
		st.setString(2, dto.getMemberPassword());

		ResultSet rs = st.executeQuery();

		if (rs.next()) {
			dto.setMemberName(rs.getString("MEMBER_NAME"));
			dto.setMemberEmail(rs.getString("MEMBER_EMAIL"));
			
			rs.close();
			st.close();
			con.close();
			
			return dto;
			
		}
		
		rs.close();
		st.close();
		con.close();
		
		return null;
	}

//	------------------------------------------------------------------

}
