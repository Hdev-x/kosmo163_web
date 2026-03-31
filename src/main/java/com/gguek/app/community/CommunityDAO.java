package com.gguek.app.community;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.gguek.app.util.DBConnection;

// [CommunityDAO 클래스]
// 	- 게시판(Community) 관련 데이터베이스 접근(CRUD)을 전담하는 클래스입니다.

public class CommunityDAO {

	private DBConnection connection;

	// DB 연결 도구를 보관할 주머니(멤버 변수)입니다.
	// 클래스 전체에서 사용할 수 있도록 위쪽에 선언합니다.

//	------------------------------------------------------------------

	public CommunityDAO() {
		this.connection = new DBConnection();
	}
	// [기본 생성자]
	// - 외부에서 'new CommunityDAO()'라고 부르는 순간, DB 연결 도구가 자동으로 준비됩니다.

//	------------------------------------------------------------------

	/*
	 * * [데이터 처리 6단계 프로세스] - 모든 DB 작업(insert, list 등)은 아래 순서를 철저히 따릅니다.
	 */

	// 1. DB 연결 (Open) : db.getConnection()으로 '고속도로(Connection)'를 뚫습니다.
	// 2. 쿼리문 작성 (SQL) : 수행할 명령어(INSERT, SELECT 등)를 문자열로 만듭니다.
	// 3. 쿼리 준비 (Prepare) : SQL문을 전송할 '트럭(PreparedStatement)'에 싣습니다.
	// 4. 데이터 세팅 (Bind) : SQL문의 물음표(?) 자리에 실제 데이터를 채워 넣습니다.
	// 5. 실행 및 결과 (Run) : 트럭을 출발시켜 DB에 명령을 내리고 결과를 받아옵니다.
	// 6. 자원 해제 (Close) : 사용한 트럭과 고속도로를 안전하게 닫아줍니다. (중요!)

//	 ------------------------------------------------------------------
	
	

	public void detail() throws Exception {
			
			// 1. DB 연결
			Connection con = connection.getConnection();
			
			// 2. 쿼리문 작성
			String sql = """
						SELECT * FROM COMMUNITY;
					""";
			
			// 3. 쿼리문 미리 전송
			PreparedStatement st = con.prepareStatement(sql);
			
			// 4.데이터(?)값 세팅
			// 세팅할 데이터가 없음
			
			// 5. 최종전송 및 결과처리
			ResultSet rs = st.executeQuery();
			CommunityDTO communityDTO = new CommunityDTO();
	}	
			
		
					
// ------------------------------------------------------------------
			
			

	// 호출할 때 현재 페이지(page)와 한 페이지당 개수(size=10)를 전달받습니다.
	public List<CommunityDTO> list(int page, int size) throws Exception {
	    List<CommunityDTO> list = new ArrayList<>();
	    
	    // 시작 위치 계산 (예: 1페이지면 0번부터, 2페이지면 10번부터)
	    int offset = (page - 1) * size;

	    Connection con = connection.getConnection();

	    // [중요] 최신 오라클(12c+) 페이징 쿼리
	    String sql = """
	                SELECT * FROM COMMUNITY 
	                ORDER BY COMM_NO DESC 
	                OFFSET ? ROWS FETCH NEXT ? ROWS ONLY
	                """;

	    PreparedStatement st = con.prepareStatement(sql);
	    st.setInt(1, offset); // 건너뛸 개수
	    st.setInt(2, size);   // 가져올 개수

	    ResultSet rs = st.executeQuery();

	    while (rs.next()) {
	        CommunityDTO dto = new CommunityDTO();
	        dto.setCommNo(rs.getInt("COMM_NO"));
	        dto.setCommStar(rs.getInt("COMM_STAR"));
	        dto.setCommTitle(rs.getString("COMM_TITLE"));
	        dto.setCommName(rs.getString("COMM_NAME"));
	        dto.setCommTime(rs.getDate("COMM_TIME"));
	        list.add(dto);
	    }

	    rs.close();
	    st.close();
	    con.close();

	    return list;
	}
		

//-------------------------------------------------------------------		

	
	public int getTotalCount() throws Exception {
	    int total = 0;
	    Connection con = connection.getConnection();
	    String sql = "SELECT COUNT(*) FROM COMMUNITY"; // 전체 행 개수 구하기
	    
	    PreparedStatement st = con.prepareStatement(sql);
	    ResultSet rs = st.executeQuery();
	    
	    if(rs.next()) {
	        total = rs.getInt(1); // 첫 번째 컬럼(count)의 값을 가져옴
	    }
	    
	    rs.close();
	    st.close();
	    con.close();
	    
	    return total;
	}
	
//	-------------------------------------------------------------------	

}
