package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.library.Product;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/cart/update/new")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String updateQuantity = ((request.getParameter("update_quantity") != null ? request.getParameter("update_quantity") : ""));
			List<Product> item  = (List<Product>) request.getSession().getAttribute("cartItem");
			List<Product> newItem = new ArrayList<Product>();
			//int cartItemToUpdate = 0;
			List<Integer> num = new ArrayList<Integer>();
			
			
			
			
			
			if(!updateQuantity.equals("")){
				
				if(updateQuantity.split("@").length > 0){
					for(String s : updateQuantity.split("@")){
						if(!s.trim().equals("")){
							System.out.println("hello");
							num.add(Integer.parseInt(s.trim()));
						}
					}
				}
				
				if(num.size() == item.size()){
					int ctr = 0;
					System.out.println(num.size() + " " + item.size());
					for(Product p : item){
						newItem.add(new Product(p.getId() , num.get(ctr) , num.get(ctr) * p.getItem().getPrice() , p.getItem() , p.getColor() , p.getSize()));
						ctr += 1;
					}
					
					request.getSession().setAttribute("cartItem", newItem);
					
				}
			}
			
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/cart.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}
