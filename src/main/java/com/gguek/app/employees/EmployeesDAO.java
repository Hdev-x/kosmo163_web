package com.gguek.app.employees;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.gguek.app.util.DBConnection;

public class EmployeesDAO {
	
	private DBConnection connection;
	
	public EmployeesDAO() {
		this.connection = new DBConnection();
	}
	
//	--------------------------------------------------------------------------	
	
	//로그인 검증
	public EmployeeDTO login(EmployeeDTO dto) throws Exception {
	
		Connection con = connection.getConnection();
		
		String sql = """
					SELECT *
					FROM EMPLOYEES
					WHERE EMPLOYEE_ID = ?
					AND PASSWORD = ?
				""";
		
		PreparedStatement st = con.prepareStatement(sql);
		
		st.setInt(1, dto.getEmployeeId());
		st.setString(2, dto.getPassword());
		
		ResultSet rs = st.executeQuery();
		
		if (rs.next()) {
			dto.setFirstName(rs.getString("FIRST_NAME"));
			dto.setLastName(rs.getString("LAST_NAME"));
			dto.setHireDate(rs.getDate("HIRE_DATE"));
			dto.setSalary(rs.getDouble("SALARY"));
			dto.setDepartmentId(rs.getInt("DEPARTMENT_ID"));
			return dto;
		}
		
		return null;
	}
	
	
	
	
	
	
//	--------------------------------------------------------------------------	
	
	public void detail(int employeeId) throws Exception {
	    // 1. DB연결
	    Connection con = connection.getConnection();
	    
	    // 2. 쿼리문 작성 (특정 ID만 조회하도록 WHERE 절 추가)
	    String sql = "SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = ?";
	            
	    // 3. 쿼리문 미리 전송
	    PreparedStatement st = con.prepareStatement(sql);
	    
	    // 4. ? 값 세팅 (매개변수로 받은 employeeId를 넣습니다)
	    st.setInt(1, employeeId);
	    
	    // 5. 최종전송 및 결과처리
	    ResultSet rs = st.executeQuery();
	    
	    // 데이터가 딱 한 개만 나오거나 없을 것이므로 if를 씁니다.
	    if (rs.next()) {
	        // 데이터 꺼내기 (아까 list에서 했던 것과 동일)
	        String fName = rs.getString("FIRST_NAME");
	        String lName = rs.getString("LAST_NAME");
	        String email = rs.getString("EMAIL");
	        int salary = rs.getInt("SALARY");
	        
	        // 아까 배운 printf로 예쁘게 출력!
	        System.out.println("\n=== 사원 상세 정보 ===");
	        System.out.printf("ID   : %d\n", employeeId);
	        System.out.printf("NAME : %s %s\n", fName, lName);
	        System.out.printf("EMAIL: %s\n", email);
	        System.out.printf("SAL  : %,d\n", salary);
	        System.out.println("====================\n");
	    } else {
	        // 해당 ID의 사원이 없을 경우
	        System.out.println(employeeId + "번 사원은 존재하지 않습니다.");
	    }
	    
	    // 6. 연결 해제
	    rs.close();
	    st.close();
	    con.close();
	}
	
	
//	--------------------------------------------------------------------------
	
	
	public void list() throws Exception {
	    // 1. DB연결
	    Connection con = connection.getConnection();
	    
	    // 2. 쿼리문 작성 (가독성을 위해 정렬 추가)
	    String sql = "SELECT * FROM EMPLOYEES ORDER BY EMPLOYEE_ID ASC";
	            
	    // 3. 쿼리문 미리 전송
	    PreparedStatement st = con.prepareStatement(sql);
	    
	    // 5. 최종전송 및 결과처리
	    ResultSet rs = st.executeQuery();
	    
	    // [추가] 제목 줄 출력 - 데이터가 나오기 전에 딱 한 번만!
	 // 1. 제목 줄 출력 (데이터와 간격을 똑같이 맞춤)
	 // ID(5칸), NAME(25칸), EMAIL(15칸), DATE(12칸), SALARY(10칸), DEP(5칸)
	 System.out.printf("%-5s\t%-20s\t%-15s\t%-12s\t%8s\t%5s\n", 
	                   "ID", "FULL_NAME", "EMAIL", "HIRE_DATE", "SALARY", "DEP");
	 System.out.println("-".repeat(90)); // 구분선을 예쁘게 90칸 긋기

	 while (rs.next()) {
	     // 데이터 가져오기
	     int idE = rs.getInt("EMPLOYEE_ID");
	     String nameF = rs.getString("FIRST_NAME");
	     String nameL = rs.getString("LAST_NAME");
	     String email = rs.getString("EMAIL");
	     java.sql.Date hireDate = rs.getDate("HIRE_DATE");
	     int salary = rs.getInt("SALARY");
	     int depID = rs.getInt("DEPARTMENT_ID");

	     // 이름 합치기
	     String fullName = nameF + " " + nameL;

	     // 2. 데이터 출력 (제목의 숫자와 동일하게 매칭)
	     // %,10d : 10칸 확보하고 세 자릿수마다 콤마(,) 추가
	     System.out.printf("%-5d\t%-20s\t%-15s\t%s\t%,8d\t%5d\n", 
	                       idE, fullName, email, hireDate, salary, depID);
	    }
	    
	    // 6. 연결 해제
	    rs.close();
	    st.close();
	    con.close();
	}

//	--------------------------------------------------------------------------	
	
	
}
