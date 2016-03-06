package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;


@WebServlet("/update/order/status")
public class UpdateOrderStatusServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String status = "";
		int orderNo = 0;
		
		try{
			status = request.getParameter("status");
			orderNo = Integer.parseInt(request.getParameter("order_no"));
			
			DBManager manager  = (DBManager) request.getServletContext().getAttribute("dbmanager");
			
			
			if(status.equals("0")){
				status = "1";
				manager.updateOrderStatusOrderByOrderNumber(orderNo, status);	
				response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/order-list-admin.jsp");
				
			}else if(status.equals("1")){
				status = "2";
				manager.updateOrderStatusOrderByOrderNumber(orderNo, status);	
				response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/order-list-admin.jsp");
			}else if(status.equals("2")){
				status = "3";
				manager.updateOrderStatusOrderByOrderNumber(orderNo, status);	
				response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/order-list-admin.jsp");
			}else if(status.equals("3")){
				status = "4";
				manager.updateOrderStatusOrderByOrderNumber(orderNo, status);	
				response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/order-list-admin.jsp");
			}
			
		}catch(NullPointerException e){
			status = "";
			orderNo = 0;
			e.printStackTrace();
		}
	}

	
}
