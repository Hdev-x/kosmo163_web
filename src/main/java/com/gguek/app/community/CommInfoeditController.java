package com.gguek.app.community;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.gguek.app.member.MemberDAO;
import com.gguek.app.member.MemberDTO;

/**
 * Servlet implementation class CommInfoeditController
 */
@WebServlet("/comm/info_edit")
public class CommInfoeditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommInfoeditController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 세션에서 로그인한 정보 가져오기 (ID를 알기 위해)
        HttpSession session = request.getSession();
        MemberDTO dto = (MemberDTO) session.getAttribute("dto");

        if (dto != null) {
            try {
                // 2. DB에서 최신 정보를 다시 조회 (기존에 만든 mypage 메서드 재활용)
                MemberDAO dao = new MemberDAO();
                MemberDTO myInfo = dao.mypage(dto);
                
                // 3. JSP로 기존 정보 전달
                request.setAttribute("myInfo", myInfo);
                
                RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/comm/info_edit.jsp");
                view.forward(request, response);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
        	response.sendRedirect(request.getContextPath() + "/member/login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 사용자가 수정한 데이터 파라미터로 받기
        String id = request.getParameter("memberId");
        String name = request.getParameter("memberName");
        String email = request.getParameter("memberEmail");
        String pw = request.getParameter("memberPassword");

        // 2. DTO에 담기
        MemberDTO dto = new MemberDTO();
        dto.setMemberPassword(pw);
        dto.setMemberId(id);
        dto.setMemberName(name);
        dto.setMemberEmail(email);

        try {
            // 3. DAO의 infoEdit 메서드 호출
            MemberDAO dao = new MemberDAO();
            int result = dao.infoEdit(dto);

            if (result > 0) {
                // 4. 수정 성공 시 세션 정보 최신화
                HttpSession session = request.getSession();
                session.invalidate();
                
                // 5. 성공 페이지로 이동
                response.sendRedirect(request.getContextPath() + "/comm/editSuccess");
            } else {
                // 수정 실패 시 다시 수정 페이지로
                response.sendRedirect(request.getContextPath() + "/comm/info_edit");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
