package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String name[] = {};
		if(fullname.split(" ").length > 1)
			name = fullname.split(" ");
		
		DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		
		manager.registerUser(email, password, name[0], name[1]);
		
		response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/account.jsp");
		
	}


}
