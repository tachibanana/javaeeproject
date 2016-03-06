package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.User;
import com.wear.kapampangan.project.util.SMTPUtil;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
	
	public String email;
	public String message;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String firstName = request.getParameter("firstname");
			String lastName = request.getParameter("lastname");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			Boolean flag = true;
			this.email = email;
			
			String message = "<h3>Confirm your email address</h3><br />";
			message += "We ask that you take a minute to confirm that the email address you provide in <br />"
					+ "your customer account is correct. All you need to do is click on the following "
					+ "<a href='www.wearkapampangan.com/email/verification?email="+ email +"'>link</a>"
					+ "<br /><h6>Wear Kampangan team.</h6>";
					
			
			
			this.message = message;
			
			
			
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			manager.createTempUserRegister(firstName, lastName, email, password);
			
			for(User user : manager.getAllUser()){
				if(user.getEmail().equals(email)){
					flag = false;
					break;
				}
			}
			
			if(flag){
				System.out.println("Email :" + email);
				SMTPUtil smtp = new SMTPUtil();
				//reconnect(smtp);
				smtp.sendMail(email , message , "Email Confirmation");
				//manager.registerUser(email, password, name[0], name[1]);
				
				response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/verify.jsp");
			}else{
				response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/signup-error.jsp");
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void reconnect(SMTPUtil smtp){
		try{
			smtp.sendMail(email , message , "Email Confirmation");
		}catch(Exception e){
			System.out.println("Reconnecting...");
			reconnect(smtp);
		}
		
	}
}


