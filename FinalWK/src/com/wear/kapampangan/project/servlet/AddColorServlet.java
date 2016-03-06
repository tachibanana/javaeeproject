package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;

/**
 * Servlet implementation class AddColorServlet
 */
@WebServlet("/color/add")
public class AddColorServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String color = request.getParameter("color");
			String hex = request.getParameter("hex");
			System.out.println(hex);
			
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			manager.addColor(color, "#" + hex);
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/color-list.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}


}
