package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.OrderInfo;
import com.wear.kapampangan.project.library.Product;
import com.wear.kapampangan.project.library.User;
import com.wear.kapampangan.project.library.UserInfo;

@WebServlet("/checkout/shipping/address")
public class SaveShippingAddress extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try{
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			String address1 = request.getParameter("address1");
			String address2 = request.getParameter("address2");
			String city = request.getParameter("city");
			String zip = request.getParameter("zip");
			String additionalInfo = request.getParameter("additionalInfo");
			String mobileNo = request.getParameter("mobileNo");
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			
			//System.out.println(); //2014/08/06 15:59:48
			
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("currentuser");

			UserInfo userInfo = new UserInfo( 0, user.getId() , address1 , address2 , city , zip , additionalInfo , mobileNo);
			OrderInfo order = new OrderInfo(0 , user , userInfo , dateFormat.format(date) , "0" , 
					Integer.parseInt(  ((int) (Math.random() * 99)) +""+ ((int) (Math.random() * 99)) +""+ ((int) (Math.random() * 99)) ) ,
					(List<Product>) (null));
			
			session.setAttribute("orderInfo-shop", order);
			System.out.println(session.getAttribute("orderInfo-shop"));
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/checkout-4.jsp");
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
