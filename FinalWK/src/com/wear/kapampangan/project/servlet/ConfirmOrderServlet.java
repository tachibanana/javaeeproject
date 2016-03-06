package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.OrderInfo;
import com.wear.kapampangan.project.library.Product;

@WebServlet("/confirm/order")
public class ConfirmOrderServlet extends HttpServlet {
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try{
			HttpSession session = request.getSession();
			OrderInfo info = (OrderInfo) session.getAttribute("orderInfo-shop");
			if(info != null){
				@SuppressWarnings("unchecked")
				List<Product> orderItemList = (List<Product>) session.getAttribute("cartItem");
				
				info.setItemList(orderItemList);
				session.setAttribute("orderInfo-shop", null);
				
				DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
				manager.addOrder(info);
				
				response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/thank-page-order.jsp?orderNo=" + info.getOrderNo());
			}else if(info == null){
				response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/checkout-2.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
