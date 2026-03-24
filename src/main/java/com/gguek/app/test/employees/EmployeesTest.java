package com.gguek.app.test.employees;

import com.gguek.app.employees.EmployeesDAO;

public class EmployeesTest {

	public static void main(String[] args) {
	EmployeesDAO employeesDAO = new EmployeesDAO();
//	try {
//		employeesDAO.list();
//	} catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
		
		try {
			employeesDAO.detail(100);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	
	
	}

}
