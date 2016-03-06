package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Review;

/**
 * Servlet implementation class AddRatingServlet
 */
@WebServlet("/add/rating")
public class AddRatingServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String itemId = request.getParameter("item_id");
			int userId = Integer.parseInt(request.getParameter("user_id"));
			int rate = Integer.parseInt(request.getParameter("rate"));
			String subject = request.getParameter("subject");
			String comment = request.getParameter("comment");
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
			Date d = new Date();
			String dateNow = dateFormat.format(d);
			Review review = new Review(0 , userId , itemId , subject , rate , comment , dateNow);
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			manager.addReviewsToItem(userId, itemId, review);
			
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/product-details.jsp?productCode=" + itemId);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
