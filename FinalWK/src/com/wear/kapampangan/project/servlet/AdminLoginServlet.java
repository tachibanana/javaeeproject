package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Admin;
import com.wear.kapampangan.project.library.Product;
import com.wear.kapampangan.project.library.User;
import com.wear.kapampangan.project.library.UserAuth;

@WebServlet("/admin/login")
public class AdminLoginServlet extends HttpServlet {
	
	private HttpSession session;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		session = request.getSession();
			
		String email = (request.getParameter("email") != null ? request.getParameter("email") : "");
		String password = (request.getParameter("password") != null ? request.getParameter("password") : "");
		
		//SET MANAGER
		DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		
		
		//SET FLAG
		boolean flag = false;
		
		//SET AUTHENTICATE
		for(Admin admin : manager.getAllAdmin()){
			System.out.println(admin.getEmail());
			System.out.println(admin.getPassword());
			
			if(admin.getEmail().equals(email) && admin.getPassword().equals(password)){
				flag = true;
				request.getSession().setAttribute("currentadmin" , admin);
			}
		}
		
		
		if(!flag){
			//SET FLAG
			
			//SET AUTHENTICATE
			User userr = null;
			for(User user : manager.getAllUser()){
				System.out.println(user.getEmail());
				System.out.println(user.getPassword());
				
				if(user.getEmail().equals(email) && user.getPassword().equals(password)){
					flag = true;
					userr = user;
					request.getSession().setAttribute("currentuser" , user);
				}
			}
			UserAuth auth = manager.getUserAuthByUserId(manager.getUserIdByEmail(email));
			
			if(flag && auth.getIsActivated() == 1 && auth.getAccountType().equalsIgnoreCase("admin")){
				flag = true;
				request.getSession().setAttribute("currentadmin" , userr);
			}else{
				flag = false;
			}
			
			
		}	
		
		if(flag){
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/item-list.jsp");
			
		}else{
			response.sendRedirect("wrong_password.jsp");
		}
	}

}
