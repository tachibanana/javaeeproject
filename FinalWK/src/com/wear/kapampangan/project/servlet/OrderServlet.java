package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.OrderInfo;


@WebServlet("/order/info")
public class OrderServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		try{
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			OrderInfo info = manager.getOrderInfoByUserIdAndOrderNo(1 , 546532);
			List<OrderInfo> list = manager.getOrderInfoByUserId(1);
			
			//System.out.println(info.getuserInfo().getAddress1());
			//System.out.println(list.get(0).getuserInfo().getAddress1());
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
