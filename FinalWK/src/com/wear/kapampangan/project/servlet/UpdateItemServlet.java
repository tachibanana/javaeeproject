package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Item;

@WebServlet("/item/update")
public class UpdateItemServlet extends HttpServlet {

	private DBManager manager = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		 
		String productCode = "DOGXD";
		String name = "TESTYYY";
		double price = 290.00;
		String image = "dogYYY";
		String description = "hello";
		String status = "status";
		
		manager.updateItem(new Item(productCode , name , price , image , description , status));
	}

}
