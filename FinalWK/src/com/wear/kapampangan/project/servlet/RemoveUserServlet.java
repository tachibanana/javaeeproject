package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;

@WebServlet("/remove/user")
public class RemoveUserServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int id = Integer.parseInt(request.getParameter("userId"));
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			manager.removeUserByIdOrEmail(id, "");
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/user-list.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}



}
