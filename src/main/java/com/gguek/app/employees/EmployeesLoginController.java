package com.gguek.app.employees;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class EmployeesLoginController
 */
@WebServlet("/emp/login")
public class EmployeesLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeesLoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/emp/login.jsp");
		view.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String id = request.getParameter("employeeId");
		String pw = request.getParameter("password");
		int i = Integer.parseInt(id);
		EmployeeDTO dto = new EmployeeDTO();
		dto.setEmployeeId(i);
		dto.setPassword(pw);

		EmployeesDAO employeesDAO = new EmployeesDAO();
		try {
			dto = employeesDAO.login(dto);

			if (dto != null) {
				System.out.println("OK");
			} else {
				System.out.println("FAIL");
			}

			HttpSession session = request.getSession();

			session.setAttribute("dto", dto);
			
			response.sendRedirect("/Home");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
