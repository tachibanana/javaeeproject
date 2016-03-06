package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Post;
import com.wear.kapampangan.project.library.Topic;

@WebServlet("/forum/topic/create")
public class CreateTopicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int categoryId = Integer.parseInt(request.getParameter("category_id"));
			int userId = Integer.parseInt(request.getParameter("user_id"));
			String subject = request.getParameter("subject");
			String tags = request.getParameter("tags");
			String content = request.getParameter("content");
			
			DateFormat dateFormat1 = new SimpleDateFormat("yyyy/MM/dd");
			DateFormat dateFormat2 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			
			Calendar cal = Calendar.getInstance();
			String date1 = dateFormat1.format(cal.getTime());
			String date2 = dateFormat2.format(cal.getTime());
			
			Topic topic = new Topic(0 , categoryId , userId , subject , tags , 0 , date1);
			
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			
			manager.addTopicToCategory(categoryId, topic);
			
			for(int i : manager.getAllTopicByUserId(userId)){
				if(manager.getAllPostByTopicId(i).size() == 0){
					manager.addPostToTopic(i, new Post(0 , i , userId , content ,  manager.getAllPostByTopicId(i).size() + 1 , date2));
					response.sendRedirect("/FinalWK/wearkapampangan/forum/forum-forum-post.jsp?topic_id=" + i);
				}
			}
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}

		
	}


}
