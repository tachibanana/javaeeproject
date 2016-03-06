package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;


@WebServlet("/item/remove/manny")
public class RemoveMannyItemServlet extends HttpServlet {
       
	private DBManager manager = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String productCodes = (request.getParameter("productCodes") != null ? request.getParameter("productCodes") : "");
		
		if(!productCodes.equals("")){
			manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			for(String code : productCodes.split(":")){
				if(!code.trim().equals("")){
					manager.removeItem(code);
				}
			}
			
		}
		
		response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/item-list.jsp");
	}

}
