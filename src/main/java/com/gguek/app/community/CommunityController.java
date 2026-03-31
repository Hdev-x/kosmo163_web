package com.gguek.app.community;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.gguek.app.util.PageVo;


/**
 * Servlet implementation class CommunityController
 */
@WebServlet("/comm/list")
public class CommunityController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	try {
            // [1] 현재 페이지 번호 가져오기 (처음 접속 시에는 null이므로 1로 초기화)
            String pageParam = request.getParameter("page");
            int currentPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam);

            CommunityDAO dao = new CommunityDAO();

            // [2] DB에서 전체 게시글 개수 조회 (페이징 계산의 기초)
            int totalCount = dao.getTotalCount();

            // [3] 페이징 계산기(PageVo) 생성 
            // 전체 개수와 현재 페이지 번호를 넣으면 시작/끝 페이지를 알아서 계산합니다.
            PageVo pageVo = new PageVo(totalCount, currentPage);

            // [4] 현재 페이지에 해당하는 10개의 데이터만 조회
            // DAO의 list 메소드에 현재 페이지와 한 페이지당 보여줄 개수(10)를 전달합니다.
            List<CommunityDTO> commList = dao.list(currentPage, pageVo.getSize());

            // [5] JSP에서 사용할 수 있도록 request에 담기
            request.setAttribute("commList", commList); // 게시글 목록
            request.setAttribute("pageVo", pageVo);     // 페이징 정보 (번호 출력용)

        } catch (Exception e) {
            e.printStackTrace();
        }

        // [6] JSP 화면으로 포워딩
        request.getRequestDispatcher("/WEB-INF/views/comm/list.jsp").forward(request, response);
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
