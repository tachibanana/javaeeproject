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


@WebServlet("/forum/post/add")
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			Calendar cal = Calendar.getInstance();
			String date = dateFormat.format(cal.getTime());
			int userId = Integer.parseInt(request.getParameter("user_id"));
			int topicId = Integer.parseInt(request.getParameter("topic_id"));
			String content = request.getParameter("content");			
			int contentNo = manager.getAllPostByTopicId(topicId).size() + 1;
			
			manager.addPostToTopic(topicId, new Post(0 , topicId , userId , content , contentNo , date));
			
			response.sendRedirect("/FinalWK/wearkapampangan/forum/forum-forum-post.jsp?topic_id=" + topicId);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
