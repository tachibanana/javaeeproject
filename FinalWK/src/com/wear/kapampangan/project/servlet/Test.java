package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.library.User;


@WebServlet("/test")
public class Test extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		User trySession = null;
		HttpSession session = request.getSession();
		if(session != null)
			 trySession = (User) session.getAttribute("currentuser");
		if(trySession != null){
			
			
			
		}else{
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/wearkapampangan/wear/team/kapampangan/login.jsp");
//			dispatcher.forward(request, response);
			
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/login.jsp");
			
		}
	}


}
