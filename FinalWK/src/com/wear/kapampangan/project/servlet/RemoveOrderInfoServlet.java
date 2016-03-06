 package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;


@WebServlet("/remove/order/info")
public class RemoveOrderInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int orderNo = (request.getParameter("order_no") != null || request.getParameter("order_no") != "" ? Integer.parseInt(request.getParameter("order_no")) : 0);
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			manager.removeOrderInfoByOrderNo(orderNo);
			
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/order-list-admin.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
