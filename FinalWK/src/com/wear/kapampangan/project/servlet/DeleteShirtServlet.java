package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;

/**
 * Servlet implementation class DeleteShirtServlet
 */
@WebServlet("/custom/shirt/delete")
public class DeleteShirtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = (request.getParameter("shirt_id") != null ? Integer.parseInt(request.getParameter("shirt_id")) : 0);
		DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		manager.deleteShirtById(id);
		response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/user-custom-page.jsp");
	}

	
}
