package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;

@WebServlet("/item/remove")
public class RemoveItemServlet extends HttpServlet {

	private DBManager manager = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");

		if(!productCode.equals("")){
			manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			manager.removeItem(productCode);
		}
		
		response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/item-list.jsp");
	}

}
