package com.gguek.app.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public Connection getConnection() throws Exception {
		String user="hr";
		String password="hr";
		String url="jdbc:oracle:thin:@localhost:1521:FREE";
		String driver="oracle.jdbc.driver.OracleDriver";
		
		Class.forName(driver);
		
		Connection con = DriverManager.getConnection(url, user, password);
		
		return con;
		
	}

}
