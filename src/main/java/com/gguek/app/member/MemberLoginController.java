package com.gguek.app.member;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class memberLoginController
 */
@WebServlet("/member/login")
public class MemberLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/member/login.jsp");
		view.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id = request.getParameter("memberId");
		String pw = request.getParameter("memberPassword");
		//로그인 창에서 입력한 id와 pw가 parameter 값으로 받아지고 그걸 post로 보내고 그걸 스트링 타입의 id와 pw에 담는다.
		
		
		MemberDTO dto = new MemberDTO();
		dto.setMemberId(id);
		dto.setMemberPassword(pw);
		//DB안에 있는 데이터를 가져오기 위해서 dto라는 객체를 새롭게 만들고 dto 안에 parameter로 받은 값을 넣는다.
		
		
		MemberDAO memberDAO = new MemberDAO();
		try {
			dto = memberDAO.login(dto);
			
			if (dto != null) {
				System.out.println("OK");
			}else {
				System.out.println("FAIL");
			}
			
			HttpSession session = request.getSession();
			
			session.setAttribute("dto", dto);
			
			response.sendRedirect("/comm/list");
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
	}

}
