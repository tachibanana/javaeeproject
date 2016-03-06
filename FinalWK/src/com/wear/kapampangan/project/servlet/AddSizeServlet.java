package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;

@WebServlet("/size/add")
public class AddSizeServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String size = request.getParameter("size");
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			manager.addSize(size);
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/size-list.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	

}
