package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wear.kapampangan.project.util.SMTPUtil;


@WebServlet("/test/test")
public class RANKING extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String html = "<div><h3 align='center'>New Shirt</h3>";
		html += "<div><img src='http://wearkapampangan-rafaelmanuel.rhcloud.com/FinalWK/wearkapampangan/wear/team/kapampangan/images/product/9.jpg' width='200px' height='300px' /></div>";
		html += "</div>";
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		
		//out.println(System.getenv("OPENSHIFT_DATA_DIR"));
		//out.println(System.getenv("OPENSHIFT_DATA_DIR"));
		
//		SMTPUtil util = new SMTPUtil();
	//	util.sendMail("rafaelmanuel00@gmail.com", html, "try");

		
		
	}

	
}
