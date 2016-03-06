package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.DesignBack;
import com.wear.kapampangan.project.library.DesignFront;
import com.wear.kapampangan.project.library.Shirt;

@WebServlet("/customize/load")
public class LoadSaveFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int shirtId = (request.getParameter("shirt_id") != null ? Integer.parseInt(request.getParameter("shirt_id")) : 0);
			int userId = (request.getParameter("user_id") != null ? Integer.parseInt(request.getParameter("user_id")) : 0);
			
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			Shirt shirt = manager.getShirtByUserIdAndShirtId(shirtId, userId);
			
			String front = "";
			String back = "";
			
			
			for(DesignFront designAtFront : shirt.getDesignFront()){
				front += (designAtFront.getDesign() + "@");
			}
			
			for(DesignBack designBack : shirt.getDesignBack()){
				back += (designBack.getDesign() + "@");
			}
			
			response.sendRedirect("/FinalWK/wearkapampangan/responsive/index.jsp?shirt_id="+ shirtId +"&front=" + front + "&back=" + back +"&shirt=" + shirt.getShirtChoose() + "&shirt_name=" + shirt.getShirtName());
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}


}
