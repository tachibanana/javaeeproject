package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;

@WebServlet("/color/remove")
public class RemoveColorServlet extends HttpServlet {
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String color = (request.getParameter("color") != null ? request.getParameter("color") : "");
		try{
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			manager.removeColor(color);
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/color-list.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
