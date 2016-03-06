package com.wear.kapampangan.project.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.UserAuth;


@WebServlet("/user/block")
public class UserBlockServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			int userId = Integer.parseInt((request.getParameter("userId")));
			
			DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
			UserAuth auth = manager.getUserAuthByUserId(userId);
			if(auth.getIsActivated() == 1){
				manager.updateUserAuth(auth.getId(), 0, auth.getAccountType());
			}else{
				manager.updateUserAuth(auth.getId(), 1, auth.getAccountType());
			}
			
			response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/user-list.jsp");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
