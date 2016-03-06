package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Topic;

@WebServlet("/search/topic")
public class SearchTopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String searchQuery = (request.getParameter("search_query") != null ? request.getParameter("search_query") : "");
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			List<Topic> listOfTopic = new ArrayList<Topic>();
		
			for(Topic topic : manager.getAllTopic()){
				if(topic.getTags().split(",").length > 1){
					
					for(String tag : topic.getTags().split(",")){
						if(tag.trim().equalsIgnoreCase(searchQuery)){
							System.out.println(tag.trim());
							listOfTopic.add(topic);					
						}
					}
				}
			}
			
			request.getServletContext().setAttribute("searchQuery", listOfTopic);
			response.sendRedirect("/FinalWK/wearkapampangan/forum/forum-forum-search.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
