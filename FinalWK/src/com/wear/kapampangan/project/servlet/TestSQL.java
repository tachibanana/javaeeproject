package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/TestSQL")
public class TestSQL extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbwearkapampangan","root","");
			System.out.println("success");
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
