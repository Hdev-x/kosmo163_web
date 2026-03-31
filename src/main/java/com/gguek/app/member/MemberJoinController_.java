package com.gguek.app.member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class MemberJoinController_
 */
@WebServlet("/member/joins")
public class MemberJoinController_ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinController_() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/joins.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String name = request.getParameter("memberName");
		String id = request.getParameter("memberID");
		String pw = request.getParameter("memberPassword");
		String email = request.getParameter("memberEmail");
		
		MemberDTO dto = new MemberDTO();
		dto.setMemberId(id);
		dto.setMemberPassword(pw);
		dto.setMemberName(name);
		dto.setMemberEmail(email);
		
		MemberDAO memberDAO = new MemberDAO();
		try {
			int result = memberDAO.join(dto);
			if (result > 0) {
				response.sendRedirect("/Home");
			}else {
				RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/joins.jsp");
				view.forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
