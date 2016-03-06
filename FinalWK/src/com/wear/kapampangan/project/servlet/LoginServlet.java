package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Product;
import com.wear.kapampangan.project.library.User;
import com.wear.kapampangan.project.library.UserAuth;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet implements Serializable{
	
	private HttpSession session;
	protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServletException , IOException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
			
		String email = (request.getParameter("email") != null ? request.getParameter("email").trim() : "");
		String password = (request.getParameter("password") != null ? request.getParameter("password").trim() : "");
		
		//SET MANAGER
		DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		
		//SET FLAG
		boolean flag = false;
		
		//SET AUTHENTICATE
		for(User user : manager.getAllUser()){
			System.out.println(user.getEmail());
			System.out.println(user.getPassword());
			
			if(user.getEmail().equals(email) && user.getPassword().equals(password)){
				flag = true;
				request.getSession().setAttribute("currentuser" , user);
			}
		}
		UserAuth auth = manager.getUserAuthByUserId(manager.getUserIdByEmail(email));
		
		if(flag && auth.getIsActivated() == 1){
			if(((List<Product>)(session.getAttribute("cartItem"))).size() > 0){
				response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/cart.jsp");
			}else{
				response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/account.jsp");
			}
			
		}else{
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/wrong_password.jsp");
		}
			
	}

}
