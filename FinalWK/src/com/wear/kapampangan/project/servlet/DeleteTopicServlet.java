package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;


@WebServlet("/delete/topic")
public class DeleteTopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int topicId = (request.getParameter("topic_id") != null ? Integer.parseInt(request.getParameter("topic_id")) : 0);
			int category = (request.getParameter("category_id") != null ? Integer.parseInt(request.getParameter("category_id")) : 0);
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			
			manager.removeTopicById(topicId);
			
			response.sendRedirect("/FinalWK/wearkapampangan/forum/forum-forum-topic.jsp?category_id="+ category);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
