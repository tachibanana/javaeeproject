package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.User;

@WebServlet("/email/verification")
public class EmailVerificationServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String email = (request.getParameter("email") != null ? request.getParameter("email") : "");
		
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			
			User user = (User) manager.getTempUserRegisterByEmail(email);
			
			manager.registerUser(user.getEmail(), user.getPassword(), user.getFirstName(), user.getLastName());
	
			
			manager.createUserAuthByIdOrEmail( manager.getUserIdByEmail(email) , email);
			
			manager.deleteTempUserRegisterByEmail(user.getEmail());
			
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/welcome.jsp?email=" + email + "&password=" + user.getPassword());
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	

}
