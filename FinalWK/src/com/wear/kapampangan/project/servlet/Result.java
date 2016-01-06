//package com.wear.kapampangan.project.servlet;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.wear.kapampangan.project.util.CartUtil;
//
//
//@WebServlet("/result")
//public class Result extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	
//  
//
//	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		
//		CartUtil cart = new CartUtil(request.getSession());
//		
//		cart.updateQuantity("asas", "RED", "XL", 1);
//		cart.updateQuantity("123", "PINK", "S", 1);
//		out.println("Hello");
//	}
//
//
//}
