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


@WebServlet("/send/decline/message")
public class SendDeclineMailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String sendTo = "";
			String subject = "";
			String message = "";
			String orderNo = "";
			
			try{
				sendTo = request.getParameter("sendTo");
				orderNo = request.getParameter("order_no");
			}catch(NullPointerException e){
				sendTo = "wearkapampanganoffcial@gmail.com";
				subject = "Error";
				message = "We have an error";
			}
			
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			User user = (User) manager.getUserById(manager.getUserIdByEmail(sendTo));
			
			subject = "Declined";
			message = "<div class='container'><ul style='list-style-type: none; margin: 0;padding: 0;overflow: hidden;background-color: #1ED760; height:100%;'>" +
					"<li style='float:left;'><a style='color:white;display: inline-block;color: white;text-align: center;padding: 14px 16px;text-decoration: none;'>Wear Kapampangan</a></li>"
					+ "</ul><div class='asa' style='padding-top:1%;padding-bottom:5%;padding-left:10%;padding-right:20%; background-color:white;'>"
					+ " <h2>Hello "+ user.getFirstName()  +"</h2><h3>Decline Message</h3><p> Were sorry for declining your order <u> #"+ orderNo +"</u>. For the mean time you can try our other products. </p><h4>Wear Kapampangan Team</p>"
					+ "</div><footer style='background-color:black; padding-top:5px; height:15px;'><p></p></footer></div>";
			
			SMTPUtil smtpUtil = new SMTPUtil();
			smtpUtil.sendMail(sendTo, message, subject);
			
			response.sendRedirect("/FinalWK/update/order/status?order_no="+ orderNo +"&status=3");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
