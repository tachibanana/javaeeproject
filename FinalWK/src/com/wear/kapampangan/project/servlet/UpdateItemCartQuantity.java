package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.library.Product;
import com.wear.kapampangan.project.util.CartUpdateUtil;


@WebServlet("/update/cart/item")
public class UpdateItemCartQuantity extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");
		String color = (request.getParameter("color") != null ? request.getParameter("color") : "");
		String size = (request.getParameter("size") != null ? request.getParameter("size") : "");
		int newQuantity = (request.getParameter("newQuantity") != null ? Integer.parseInt(request.getParameter("newQuantity")) : 0);
		
		HttpSession session = request.getSession();
		
		if(!(productCode.trim().equals("") && color.trim().equals("") && size.trim().equals(""))){
			try{
				
				CartUpdateUtil updateCartUtil = new CartUpdateUtil(session);
				List<Product> tempSessionProductList = updateCartUtil.updateQuantity(productCode, color, size, newQuantity);
				session.setAttribute("cartItem", tempSessionProductList);
				
				out.print("<table class='cartTable table-responsive' style='width:100%'>" +
				"<tbody>" +
					"<tr class='CartProduct cartTableHeader'>"+
						"<td style='width:15'> Product </td>" +
						"<td style='width:40%'>Details</td>" +
						"<td style='width:10%' class='delete'>&nbsp;</td>" +
						"<td style='width:10%'>QNT</td>" +
						"<!-- <td style='width:10%'>Discount</td> -->" +
						"<td style='width:15%'>Total</td>" +
					"</tr>");
				for(Product product : tempSessionProductList){
					out.print("<tr class='CartProduct'>" +
					"<td class='CartProductThumb'><div> <a href='product-details.html'><img src='"+product.getItem().getImage()+ "' alt='img'></a> </div></td>" +
						"<td>" +
							"<div class='CartDescription'>" +
								"<h4> <a href='#'>" + product.getItem().getName() +"</a> </h4>" +
								"<span class='size'>" + product.getSize().getSize() +"</span>" +
								"<div class='price'> <span>" + product.getItem().getPrice() + "</span></div>" +
							"</div>" +
						"</td>" +
						"<td class='delete'><a title='Delete'><i class='glyphicon glyphicon-trash fa-2x'></i></a></td>" +
						"<td><input class='quanitySniper' type='text' value='"+ product.getQuantity() +"' name='quanitySniper'></td>" +
						"<!-- <td>0</td> -->" +
						"<td class='price'>"+ product.getItem().getPrice() * product.getQuantity() +"</td>" +
					"</tr>");
				}
				out.print("</tbody>" +
						"</table>");
			 
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}


}
