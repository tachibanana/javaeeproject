package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Item;



@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String param = (request.getParameter("search") != null ? request.getParameter("search") : "");
//		DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
//		Item resultItem = null;
//		int counter = 0;
//		for(Item item : manager.getItemList()){
//			if(item.getName().equalsIgnoreCase(param) || 
//					String.valueOf(item.getPrice()).equalsIgnoreCase(param) ||
//					item.getProductCode().equalsIgnoreCase(param)){
//				resultItem = item;
//				counter ++;
//			}
//		}
//		
//		if(resultItem != null && counter == 1){
//			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/product-details.jsp?productCode=" + resultItem.getProductCode());;
//		}else{
//			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/shop.jsp");
//		}
		
		String param = (request.getParameter("productName") != null ? request.getParameter("productName") : "");
		DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		try{
			Item item = manager.getItemByNameQuery(param).get(0);
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/product-details.jsp?productCode=" + item.getProductCode());;
		}catch(Exception e){
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/shop.jsp");
		}
	}

}
