package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.library.User;


@WebServlet("/myAccount")
public class MyAccount extends HttpServlet {
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			HttpSession session = request.getSession();
			User user = null;
			user = (User) session.getAttribute("currentuser");
			
			if(session != null){
				if(user != null){
					response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/account.jsp");
				}else{
					response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/login1.jsp");
				}
			}
	}

}
