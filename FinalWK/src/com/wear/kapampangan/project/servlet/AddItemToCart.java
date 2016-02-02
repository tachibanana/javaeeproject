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

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Color;
import com.wear.kapampangan.project.library.Item;
import com.wear.kapampangan.project.library.Product;
import com.wear.kapampangan.project.library.Size;
import com.wear.kapampangan.project.util.CartUtil;

@WebServlet("/add")
public class AddItemToCart extends HttpServlet{
	
	private DBManager manager;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException , IOException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");
		int quantity = (request.getParameter("quantity") != null ? Integer.parseInt(request.getParameter("quantity")) : 0);
		String colorValue = (request.getParameter("color") != null ? request.getParameter("color") : "");
		String sizeValue = (request.getParameter("size") != null ? request.getParameter("size") : "");
	
		HttpSession session = request.getSession();
		CartUtil cartUtil = new CartUtil(session);
		manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		
		Item item = getItem(productCode , manager.getItemList());
		Color color = getColor(colorValue , manager.getColorList());
		Size size = getSize(sizeValue , manager.getSizeList());
		Product product_ = new Product(1 , quantity, item.getPrice() , item , color , size);
		
//		Item item1 = new Item("RAF123","KAIN TAYO" , 400 , "images/product/masyas.jpg" , "status" , "description");
//        Color blue = new Color(1,"BLUE","#aaaggg");
//        Size small = new Size(1 , "XS");
//        
//		Product product_ = new Product(1 , 5 , 2000 , item1 , blue , small);
		List<Product> productList = cartUtil.addToCart(product_);

		//ADD NEW CART
		session.setAttribute("cartItem" , productList);
		session.setAttribute("tempCartItem" , productList);
		
		int cartItemPrice = 0;
		for(Product product : productList) cartItemPrice += product.getTotalPrice();
		
		out.println(""+
			"<a href='#' class='dropdown-toggle' data-toggle='dropdown'>" +
			"<i class='fa fa-shopping-cart'> </i> <span class='cartRespons'> Cart (PHP " + cartItemPrice + ")</span> <b class='caret'></b>" +
			"</a>" +
			"<div class='dropdown-menu col-lg-4 col-xs-12 col-md-4'>" +
			"<div class='w100 miniCartTable scroll-pane'>" +
			
			"<table>" +
			"<tbody>");
		
		for(Product product : productList){
			out.println(""+
			"<tr class='miniCartProduct'>" +
			"<td style='width: 20%' class='miniCartProductThumb'>" +
			"<div>" +
			"<a href='product-details.jsp?productCode="+ product.getItem().getProductCode() +"&color="+ product.getColor().getColor() +"&size="+ product.getSize().getSize() +"&quantity="+ product.getQuantity() +"'> <img " +
			"src='"+ product.getItem().getImage() +"' alt='img'>" +
			"</a>" +
			"</div>" +
			"</td>" +
			"<td style='width: 40%'>" +
			"<div class='miniCartDescription'>" +
			"<h4>" +
			"<a href='product-details.html'>" + product.getItem().getName() + "</a>" +
			"</h4>" +
			"<span class='size'>" + product.getSize().getSize() + "</span>" +
			"<div class='price'>" +
			"<span>PHP " + product.getItem().getPrice() + "</span>" +
			"</div>" +
			"</div>" +
			"</td>" +
			"<td style='width: 10%' class='miniCartQuantity'><a>X " + product.getQuantity() + "</a></td>" +
			"<td style='width: 15%' class='miniCartSubtotal'><span>PHP " + product.getTotalPrice() + "</span></td>" +
			"<td style='width: 5%' class='delete' id='" + product.getItem().getProductCode() + "' onclick='removeItem(\""+ product.getItem().getProductCode() +"\" , \""+ product.getColor().getColor() +"\" , \""+ product.getSize().getSize() +"\");'><a> x </a></td>" +
			"</tr>");			
		}
		
		out.println(""+
			"</tbody>" +
			"</table>" +
			"</div>" +
			"<div class='miniCartFooter text-right'>" +
			"<h3 class='text-right subtotal'>Subtotal: PHP "+ cartItemPrice +"</h3>" +
			"<button class='btn btn-sm btn-danger'><i class='fa fa-shopping-cart'></i> VIEW CART </button> " +
			"<button class='btn btn-sm btn-primary'> CHECKOUT </button>" +
			"</div></div>");
		
	}
	
	private Item getItem(String productCode , List<Item> tempItemList){
		for(Item item : tempItemList){
			if(item.getProductCode().equals(productCode)){
				return item;
			}
		}
		return null;
	}
	
	private Color getColor(String color_ , List<Color> temColorList){
		
		for(Color color : temColorList){
			if(color.getColor().equals(color_)){
				return color;
			}
		}
		return null;
	}
	
	private Size getSize(String size_ , List<Size> temSizeList){
		
		for(Size size : temSizeList){
			if(size.getSize().equals(size_)){
				return size;
			}
		}
		return null;
	}

}
