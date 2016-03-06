package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.User;


@WebServlet("/user/info/3/update")
public class UpdateUserInfo3Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;      

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String add1 = request.getParameter("address1");
			String add2 = request.getParameter("address2");
			String city = request.getParameter("city");
			String zip = request.getParameter("zip");
			String addInfo = request.getParameter("additionalInfo");
			String mobileNo = request.getParameter("mobileNo");
			User user = (User) request.getSession().getAttribute("currentuser");
			
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			manager.updateUserInfo3ByUserId(user.getId(), add1, add2, city, zip, addInfo, mobileNo);
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/account.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	

}
