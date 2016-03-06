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
import com.wear.kapampangan.project.library.User;

@WebServlet("/customize/save")
public class SaveCustomizeState extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		String front = request.getParameter("front");
		String back = request.getParameter("back");
		String shirt = request.getParameter("shirt");
		String name = (request.getParameter("name") != null ? request.getParameter("name") : "ShirtWK");
		String type = (request.getParameter("type") != null ? request.getParameter("type") : "");
		int shirt_id = (request.getParameter("shirt_id") != null ? Integer.parseInt(request.getParameter("shirt_id")) : 0);
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		Date date = new Date();
		
		User user  = (User) request.getSession().getAttribute("currentuser");
		
		
		String genId = (int) Math.floor(Math.random() * 99) +
				"" + (int) Math.floor(Math.random() * 99) +
				"" + (int) Math.floor(Math.random() * 99) + 
				"" + (int) Math.floor(Math.random() * 99);
		
		int id = Integer.parseInt(genId);
		
		System.out.println("Type : " + shirt_id);
		if(type.equalsIgnoreCase("new")){
			manager.addSaveFileToUser(id, user.getId() , name , shirt, dateFormat.format(date), front, back);
		}else{
			manager.updateShirtByShirtId(shirt_id, name, shirt, dateFormat.format(date), front, back);
		}
		response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/user-custom-page.jsp");
	}


}
