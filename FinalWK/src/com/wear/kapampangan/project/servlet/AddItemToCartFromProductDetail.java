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

@WebServlet("/product-detail/cart/add")
public class AddItemToCartFromProductDetail extends HttpServlet {
       
	private DBManager manager = null;
	private List<Product> listOfProduct = null;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		//set parameter
		String productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");
		int quantity = (request.getParameter("quantity") != null ? Integer.parseInt(request.getParameter("quantity")) : 0);
		String colorValue = (request.getParameter("color") != null ? request.getParameter("color") : "");
		String sizeValue = (request.getParameter("size") != null ? request.getParameter("size") : "");
	
		//set session and session value
		HttpSession session = request.getSession();
		
		//remove the existing product
		CartUtil cartUtil = new CartUtil(session);
		listOfProduct = cartUtil.removeToCart(productCode, colorValue, sizeValue);
		
		//save the new list of product
		session.setAttribute("cartItem" , listOfProduct);
		
		//set the replacement product
		manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		Item item = getItem(productCode , manager.getItemList());
		Color color = getColor(colorValue , manager.getColorList());
		Size size = getSize(sizeValue , manager.getSizeList());
		Product product_ = new Product(1 , quantity, (item.getPrice() * quantity) , item , color , size);
		
		//add the new product
		listOfProduct = cartUtil.addToCart(product_);
		
		//save the new list of product
		session.setAttribute("cartItem" , listOfProduct);
		
		response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/cart.jsp");
		
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
