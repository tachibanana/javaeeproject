package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.OrderInfo;


@WebServlet("/notification/counter")
public class NotificationCounter extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int numberOfNotif = 0;
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();

			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			for(OrderInfo info : manager.getAllOrderInfo()){
				if(manager.getOrderViewById(info.getId()).getIsRead() == 0){
					numberOfNotif ++;
				}
			}
			//System.out.println("respose has been send");
			if(numberOfNotif > 0){
				out.println("Order <span class='badge danger'>" + numberOfNotif  + "</span>");
			}else
				out.println("Order");
			
			System.out.println("request");
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

	
}
