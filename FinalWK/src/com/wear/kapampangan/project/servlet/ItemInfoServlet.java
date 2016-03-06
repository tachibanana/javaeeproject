package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Item;


@WebServlet("/item/info")
public class ItemInfoServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String productName = request.getParameter("searchName");
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			Item item = null;
			if(manager.getItemByNameQuery(productName) != null){
				item = manager.getItemByNameQuery(productName).get(0);
			}
			
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/item-info.jsp?productCode=" + item.getProductCode());
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
