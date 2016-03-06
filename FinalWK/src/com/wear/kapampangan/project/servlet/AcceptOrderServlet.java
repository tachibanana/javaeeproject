package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Product;
import com.wear.kapampangan.project.library.User;
import com.wear.kapampangan.project.util.SMTPUtil;


@WebServlet("/accept/order")
public class AcceptOrderServlet extends HttpServlet {
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
			
			int userId = manager.getUserIdByEmail(sendTo);
			int totalAmount = 0;
			List<Product> item = (List<Product>) manager.getOrderInfoByUserIdAndOrderNo(userId, Integer.parseInt(orderNo)).getItemList();
					
			subject = "Your order status";
			message = "<div class='container'><ul style='list-style-type: none; margin: 0;padding: 0;overflow: hidden;background-color: #1ED760; height:100%;'>" +
					"<li style='float:left;'><a style='color:white;display: inline-block;color: white;text-align: center;padding: 14px 16px;text-decoration: none;'>Wear Kapampangan</a></li>"
					+ "</ul><div class='asa' style='padding-top:1%;padding-bottom:5%;padding-left:10%;padding-right:20%; background-color:white;'>"
					+ " <h2>Hello "+ user.getFirstName()  +"</h2><h3>Your Receipt</h3><p>Order : <u>#"+ orderNo +"</u></p>"
					+ "<table style='width:100%' cellspacing='2%' class='qwe'><tr><td><b> Product Code:</b></td><td><b>Product Name:</b></td><td><b>Quantity</b></td><td><b>Amount</b></td></tr>";	
			
			for(Product product : item){
				message += "<tr><td>"+ product.getItem().getProductCode() +"</td><td>"+ product.getItem().getName() +"</td>"
						+ "<td>"+ product.getQuantity() +"</td><td>PHP "+ product.getTotalPrice() +"0</td></tr>";
				
				totalAmount += product.getTotalPrice();
				
			}
			
			message += "</table><p align='right'><b>Total Amount:</b> PHP "+ totalAmount +"</p>"
					+ "<p>Thank you for shopping with WEAR KAPAMPANGAN. We attempt to provide you best quality products at the most "
					+ "reasonable price. Customer satisfaction is our primary focus. We would be glad to hear from you if you have "
					+ "any feedbacks or complains regarding our services and products. We will let you know when your items are on their way.</p>"
					+ "<h4>Wear Kapampangan Team</h4>";
			
			message	+= "</div><footer style='background-color:black; padding-top:5px; height:15px;'><p></p></footer></div>";
			
			SMTPUtil smtpUtil = new SMTPUtil();
			smtpUtil.sendMail(sendTo, message, subject);
			
			response.sendRedirect("/FinalWK/update/order/status?order_no="+ orderNo +"&status=0");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
