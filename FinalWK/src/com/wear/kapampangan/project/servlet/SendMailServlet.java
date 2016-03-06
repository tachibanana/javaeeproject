package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.util.SMTPUtil;

/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/compose/mail")
public class SendMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String sendTo = "";
			String subject = "";
			String message = "";
			
			try{
				sendTo = request.getParameter("sendTo");
				subject = request.getParameter("subject");
				message = request.getParameter("message");
			}catch(NullPointerException e){
				sendTo = "wearkapampanganoffcial@gmail.com";
				subject = "Error";
				message = "We have an error";
			}
			
			SMTPUtil smtp = new SMTPUtil();
			smtp.sendMail(sendTo, message, subject);
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/order-list-admin.jsp");
	}

	

}
