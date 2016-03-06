package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;

@SuppressWarnings("serial")
@WebServlet("/remove/rating")
public class RemoveReviewServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemId = request.getParameter("item_id");
		int userId = Integer.parseInt(request.getParameter("user_id"));
		DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		manager.removeReview(itemId, userId);
		response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/product-details.jsp?productCode=" + itemId);
	
	}

}
