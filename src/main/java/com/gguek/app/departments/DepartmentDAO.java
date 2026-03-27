package com.gguek.app.departments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.gguek.app.util.DBConnection;

public class DepartmentDAO {
	
	private DBConnection connection;

	
//	-----------------------------------------------------------------
	

	public DepartmentDAO() {
		this.connection = new DBConnection();
	}

	
//	------------------------------------------------------------------
	
	
		// 1. DB연결
		// 2. 쿼리문 작성
		// 3. 쿼리문 미리 전송
		// 4. ?값을 세팅
		// 5. 최종전송 및 결과처리
		// 6. 연결 해제
	
		
// ------------------------------------------------------------------
		
		
	public int update (DepartmentDTO departmentDTO) throws Exception {
		Connection con = connection.getConnection();
		
		String sql = """
					UPDATE DEPARTMENTS
					SET DEPARTMENT_NAME = ?, MANAGER_ID = ?, LOCATION_ID = ?
					WHERE DEPARTMENT_ID = ?
				""";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, departmentDTO.getDepartmentName());
		st.setInt(2, departmentDTO.getManagerId());
		st.setInt(3, departmentDTO.getLocationId());
		st.setInt(4, departmentDTO.getDepartmentId());
		
		int result = st.executeUpdate();
		
		st.close();
		con.close();
		
		return result;
	}	
	
	
	
// ------------------------------------------------------------------
	
	
	
	public int delete(DepartmentDTO departmentDTO) throws Exception {
		Connection con = connection.getConnection();
		String sql = """
					DELETE DEPARTMENTS WHERE DEPARTMENT_ID=?
				""";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, departmentDTO.getDepartmentId());
		
		int result = st.executeUpdate();
		
		st.close();
		con.close();
		
		return result;
	}
	
	
	
	
// ------------------------------------------------------------------
	
	
	
	public int create(DepartmentDTO departmentDTO) throws Exception {
		Connection con = connection.getConnection();
		String sql = """
						INSERT INTO DEPARTMENTS
						VALUES (DEPARTMENTS_SEQ.NEXTVAL, ?, ?, ?)
					""";
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, departmentDTO.getDepartmentName());
		st.setInt(2, departmentDTO.getManagerId());
		st.setInt(3, departmentDTO.getLocationId());
		
		int result = st.executeUpdate();
		
//		System.out.println(result);
		
		st.close();
		con.close();
		
		return result;
				
	}
	
	
	
//	-----------------------------------------------------------------
	
	
	
	public DepartmentDTO detail(int departmentId) throws Exception {
		
		// 1. DB연결
		Connection con = connection.getConnection();
		
		// 2. 쿼리문 작성
		String sql = """
				SELECT * FROM DEPARTMENTS WHERE DEPARTMENT_ID = ?
				""";
		
		// 3. 쿼리문 미리 전송
		PreparedStatement st = con.prepareStatement(sql);

		// 4. ?값을 세팅
		st.setInt(1, departmentId);
		
		// 5. 최종전송 및 결과처리
		ResultSet rs = st.executeQuery();
		DepartmentDTO dto = null;

		if (rs.next()) {
			dto = new DepartmentDTO();
			dto.setDepartmentId(rs.getInt("DEPARTMENT_ID"));
			dto.setDepartmentName(rs.getString("DEPARTMENT_NAME"));
			dto.setManagerId(rs.getInt("MANAGER_ID"));
			dto.setLocationId(rs.getInt("LOCATION_ID"));
			
		} 
		
		// 6. 연결 해제
		rs.close();
		st.close();
		con.close();
		
		return dto;

	}
	
	
	
	//--------------------------------------------------------------
	
	

	public ArrayList<DepartmentDTO> list() throws Exception {

		// 1. DB연결
		Connection con = connection.getConnection();

		// 2. 쿼리문 작성
		String sql = """
				SELECT * FROM DEPARTMENTS
				ORDER BY DEPARTMENT_ID DESC
				""";

		// 3. 쿼리문 미리 전송
		PreparedStatement preS = con.prepareStatement(sql);

		// 4. ?값을 세팅

		// 5. 최종전송 및 결과처리
		ResultSet rs = preS.executeQuery();
		ArrayList<DepartmentDTO> ar = new ArrayList<>();
		
		while (rs.next()) {
			
			DepartmentDTO dto = new DepartmentDTO();

			String name = rs.getString("DEPARTMENT_NAME");
			int id = rs.getInt("DEPARTMENT_ID");
			int mid = rs.getInt("MANAGER_ID");
			int lid = rs.getInt("LOCATION_ID");

			dto.setDepartmentName(name);
			dto.setDepartmentId(id);
			dto.setLocationId(lid);
			dto.setManagerId(mid);

			ar.add(dto);
			
		}

		// 6. 연결 해제
		rs.close();
		preS.close();
		con.close();
		
		return ar;

	}
	
	
//	---------------------------------------------------------------
	

}
