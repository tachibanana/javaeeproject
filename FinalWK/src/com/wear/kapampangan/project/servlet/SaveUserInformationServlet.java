package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.User;

@WebServlet("/user/info")
public class SaveUserInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			String firstName = request.getParameter("firstName");
			String lastName = request.getParameter("lastName");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			manager.updateUserInfo(firstName, lastName, password , email);
			HttpSession session = request.getSession();
			User currentUser = (User) session.getAttribute("currentuser");
			User newUser = new User(currentUser.getId() , email , password , firstName , lastName);
			session.setAttribute("currentuser", newUser);
			
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/account.jsp");
		}catch(Exception e){
			e.printStackTrace();			
		}
	}

}
