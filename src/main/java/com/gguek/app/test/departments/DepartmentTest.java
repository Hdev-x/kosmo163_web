package com.gguek.app.test.departments;

import com.gguek.app.departments.DepartmentDAO;
import com.gguek.app.departments.DepartmentDTO;

public class DepartmentTest {

	public static void main(String[] args) {

		DepartmentDAO dao = new DepartmentDAO();
		try {
			DepartmentDTO departmentDTO = new DepartmentDTO();
			departmentDTO.setDepartmentName("class3");
			departmentDTO.setManagerId(null);
			departmentDTO.setLocationId(null);
			dao.create(departmentDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
