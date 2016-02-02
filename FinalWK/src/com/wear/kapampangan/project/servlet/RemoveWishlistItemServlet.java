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
import com.wear.kapampangan.project.library.User;

@WebServlet("/wishlist/remove")
public class RemoveWishlistItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			String productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			User currentUser = (User) request.getSession().getAttribute("currentuser");
			int userId = manager.getUserIdByEmail(currentUser.getEmail());
			int wishlistId = manager.getWishlistIdByUserId(userId);
			
			manager.removeWishlistItemToUser(wishlistId, productCode);
			
			
			for(Item item : manager.getWishlistItemByUserEmail(currentUser.getEmail())){
			out.println( "<tr class='CartProduct'>"
					+ "<td style='width:10%' class='CartProductThumb'>"
					+ "<div><a href='product-details.html'><img src='" +  item.getImage() +"' alt='img'></a></div></td>"
					+ "<td style='width:40%'>"
					+ "<div class='CartDescription'>"
					+ "<h4><a href='product-details.html'>" + item.getName() + "</a></h4>"
					+ "<span class='size'>12 x 1.5 L</span>"
					+ "<div class='price'> <span>PHP " + item.getPrice() + "</span> </div></div></td>"
					+ "<td style='width:15%'>"
					+ "<a class='btn btn-primary'>"
					+ "<span class='add2cart'><i class='glyphicon glyphicon-shopping-cart'></i> Add to cart </span></a></td>"
					+ "<td style='width:40%' class='delete'><a title='Delete' onclick='removeToWishList(\""+ item.getProductCode()  +"\");'> <i class='glyphicon glyphicon-trash fa-2x'></i> </a></td></tr>"
					);
			}

		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
