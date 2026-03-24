package com.gguek.app.test.contries;

import com.gguek.app.countries.CountriesDAO;

public class CountriesTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		CountriesDAO countriesDAO = new CountriesDAO();
		try {
			countriesDAO.detail("AR");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
