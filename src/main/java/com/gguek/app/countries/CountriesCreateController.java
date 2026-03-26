package com.gguek.app.countries;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class CountriesCreateController
 */
@WebServlet("/country/create")
public class CountriesCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountriesCreateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/country/create.jsp");
		view.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.sendRedirect("/country/list");
		String cId = request.getParameter("countryId");
		String name = request.getParameter("countryName");
		String rId = request.getParameter("regionId");
		
		CountiresDTO countiresDTO = new CountiresDTO();
		countiresDTO.setCountryId(cId);
		countiresDTO.setCountryName(name);
		countiresDTO.setRegionId(Integer.parseInt(rId));
		
		CountriesDAO countriesDAO = new CountriesDAO();
		try {
			int result = countriesDAO.create(countiresDTO);
			if (result > 0) {
				response.sendRedirect("/country/list");
			}else {
				
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
