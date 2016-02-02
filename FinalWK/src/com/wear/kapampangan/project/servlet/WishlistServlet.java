package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Item;
import com.wear.kapampangan.project.library.User;


@WebServlet("/user/wishlist")
public class WishlistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			HttpSession session = request.getSession();
			User currentUser = (User) session.getAttribute("currentuser");
			DBManager manager = (DBManager) (request.getServletContext().getAttribute("dbmanager"));
			boolean existing = false;
			int userId = manager.getUserIdByEmail(currentUser.getEmail());
			int wishlistId = manager.getWishlistIdByUserId(userId);
			
			if(currentUser != null){
				System.out.println(currentUser.getEmail());
				String productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");
				System.out.println("Soccess " + productCode);
				
				
				for(Item item : manager.getWishlistItemByUserEmail(currentUser.getEmail())){
					if(item.getProductCode().equals(productCode)){
						existing = true;
						break;
					}
				}
				if(existing){
					//remove to wishlist
					manager.removeWishlistItemToUser(wishlistId , productCode);
				}else{
					//add to wishlist
					manager.addWishlistItemToUser(wishlistId , productCode);
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
