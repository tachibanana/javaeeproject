package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;

@WebServlet("/change/account/type")
public class ChangeAccountTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
		 int userId = (request.getParameter("user_id") != null ? Integer.parseInt(request.getParameter("user_id")) : 0);
		 String accountType = (request.getParameter("accountType") != null ? request.getParameter("accountType")  : "");
		 
		 DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		 manager.updateAccountTypeByUserId(userId, accountType);
		 
		 response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/user-list.jsp");
		 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
		

}
