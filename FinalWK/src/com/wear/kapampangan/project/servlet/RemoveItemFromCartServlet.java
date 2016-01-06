//package com.wear.kapampangan.project.servlet;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.wear.kapampangan.project.library.Product;
//import com.wear.kapampangan.project.util.CartUtil;
//
//@WebServlet("/remove")
//public class RemoveItemFromCartServlet extends HttpServlet {       
//
//	private static final long serialVersionUID = 1L;
//	
//	private String productCode;
//	private String name;
//	private int quantity;
//	private String color;
//	private String size;
//	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html");
//		PrintWriter out = response.getWriter();
//		List<Product> productList = null;
//		
//		try{
//			
//			//SET PARAMETER
//			productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");
//			name = (request.getParameter("name") != null ? request.getParameter("name") : "");
//			quantity = (request.getParameter("quantity") != null ? Integer.parseInt(request.getParameter("quantity")) : 0);
//			color = (request.getParameter("color") != null ? request.getParameter("color") : "");
//			size = (request.getParameter("size") != null ? request.getParameter("size") : "");
//			
//			//SET UTILITIES
//			HttpSession session = request.getSession();
//			CartUtil cartUtil = new CartUtil(session);
//			
//			//REMOVE PRODUCT INTO CART
//			productList = cartUtil.removeToCart(productCode, color, size);
//			
//			//ADD NEW CART
//			session.setAttribute("cartItem" , productList);
//			
//			int cartItemPrice = 0;
//			for(Product product : productList) cartItemPrice += product.getPrice();
//			
//			out.println(""+
//				"<a href='#' class='dropdown-toggle' data-toggle='dropdown'>" +
//				"<i class='fa fa-shopping-cart'> </i> <span class='cartRespons'> Cart (PHP " + cartItemPrice + ")</span> <b class='caret'></b>" +
//				"</a>" +
//				"<div class='dropdown-menu col-lg-4 col-xs-12 col-md-4'>" +
//				"<div class='w100 miniCartTable scroll-pane'>" +
//				
//				"<table>" +
//				"<tbody>");
//			
//			for(Product product : productList){
//				out.println(""+
//				"<tr class='miniCartProduct'>" +
//				"<td style='width: 20%' class='miniCartProductThumb'>" +
//				"<div>" +
//				"<a href='product-details.html'> <img " +
//				"src='"+ product.getImage() +"' alt='img'>" +
//				"</a>" +
//				"</div>" +
//				"</td>" +
//				"<td style='width: 40%'>" +
//				"<div class='miniCartDescription'>" +
//				"<h4>" +
//				"<a href='product-details.html'>" + product.getName() + "</a>" +
//				"</h4>" +
//				"<span class='size'>" + product.getSize() + "</span>" +
//				"<div class='price'>" +
//				"<span>PHP " + product.getPrice() + "</span>" +
//				"</div>" +
//				"</div>" +
//				"</td>" +
//				"<td style='width: 10%' class='miniCartQuantity'><a>X " + product.getQuantity() + "</a></td>" +
//				"<td style='width: 15%' class='miniCartSubtotal'><span>PHP " + product.getPrice() + "</span></td>" +
//				"<td style='width: 5%' class='delete' id='" + product.getProductCode() + "' onclick='removeItem();'><a> x </a></td>" +
//				"</tr>");			
//			}
//			
//			out.println(""+
//				"</tbody>" +
//				"</table>" +
//				"</div>" +
//				"<div class='miniCartFooter text-right'>" +
//				"<h3 class='text-right subtotal'>Subtotal: PHP "+ cartItemPrice +"</h3>" +
//				"<a class='btn btn-sm btn-danger'> <i class='fa fa-shopping-cart'>" +
//				"</i> VIEW CART" +
//				"</a><a class='btn btn-sm btn-primary'> CHECKOUT </a>" +
//				"</div>");
//		
//			
//			
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		
//	}
//
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//	}
//
//}
