package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;


@WebServlet("/set/read")
public class SetAsReadServlet extends HttpServlet {

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id= request.getParameter("id");
		String orderNo = request.getParameter("orderId");
		String email = request.getParameter("email");
		
		DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		manager.updateUserViewToRead(Integer.parseInt(id));
		response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/order-status-admin.jsp?orderId="+ orderNo + "&email=" + email);
		
	}


}
