package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/star/rating")
public class StarRatingServlet extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			String star = request.getParameter("star");
			
			if(star.equals("1")){
				out.print("Hated it");
			}else if(star.equals("2")){
				out.print("Didn't like it");
			}else if(star.equals("3")){
				out.print("Just OK");
			}else if(star.equals("4")){
				out.print("Liked it");
			}else if(star.equals("5")){
				out.print("Loved it");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}


}
