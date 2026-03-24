package com.gguek.app.test.util;

import java.sql.Connection;

import com.gguek.app.countries.CountriesDAO;
import com.gguek.app.departments.DepartmentDAO;
import com.gguek.app.util.DBConnection;

public class DBConnectionTest {

	public static void main(String[] args) {
		
//		DepartmentDAO dao = new DepartmentDAO();
//		try {
//			dao.list();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		CountriesDAO dao2 = new CountriesDAO();
		try {
			dao2.list();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		

	}

}
