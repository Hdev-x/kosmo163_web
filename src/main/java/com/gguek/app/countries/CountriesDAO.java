package com.gguek.app.countries;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.gguek.app.util.DBConnection;

public class CountriesDAO {
	
	public void detail(String countryId) throws Exception {
		DBConnection connection = new DBConnection();
		Connection con = connection.getConnection();
		
		String sql = """
				SELECT * FROM COUNTRIES
				WHERE COUNTRY_ID = ?
				""";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setString(1, countryId);
		
		ResultSet rs = st.executeQuery();
		
		if (rs.next()) {
			String name = rs.getString("COUNTRY_NAME");
			System.out.println(name);
		}else {
			System.out.println("없다");
		}
		
		rs.close();
		st.close();
		con.close();
	}
	
	
	public void list() throws Exception {
		
		//1. DB연결
		DBConnection DBC = new DBConnection();
		Connection con = DBC.getConnection();		
				
		//2. 쿼리문 작성
		String sql = "SELECT * FROM COUNTRIES";
		
		//3. 쿼리문 미리 전송
		PreparedStatement pres = con.prepareStatement(sql);
		
		//4. ?값을 세팅
				
				
		//5. 최종전송 및 결과처리
		ResultSet rs = pres.executeQuery();
		
		while (rs.next()) {
			String name = rs.getString("COUNTRY_NAME");
			String id = rs.getString("COUNTRY_ID");
			String idr = rs.getString("REGION_ID");
			System.out.println(name+" ; "+id+" : "+idr);
		}
				
				
		//6. 연결 해제
		rs.close();
		pres.close();
		con.close();
		
		
	}

}
