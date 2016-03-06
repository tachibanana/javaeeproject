package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.InventoryDetail;


@WebServlet("/inventory/update/quantity")
public class UpdateInventoryQuantity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String productCode = request.getParameter("productCode");
			String command = request.getParameter("command");
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			InventoryDetail detail = manager.getInventoryDetailByProductCode(productCode);
			if(command.equalsIgnoreCase("add"))
				manager.updateQuantity(productCode,detail.getQuantity() + quantity);
			else
				manager.updateQuantity(productCode,((detail.getQuantity() - quantity) < 0 ? 0 : (detail.getQuantity() - quantity)));
			
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/inventory-list.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}


}
