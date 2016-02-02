package com.wear.kapampangan.project.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/inventory/item")
public class AddItemToFeatureList extends HttpServlet{

	protected void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException , IOException{
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		System.out.println("hello");
		
		String itemParameter = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");
		String colorListParameter = (request.getParameter("color_item_list") != null ? request.getParameter("color_item_list") : "");
		String sizeListParameter = (request.getParameter("size_item_list") != null ? request.getParameter("size_item_list") : "");
		
		List<Integer> colorIdList = new ArrayList<Integer>();
		List<Integer> sizeIdList = new ArrayList<Integer>();
		
		if(!(itemParameter.equals("") || colorListParameter.equals("") || sizeListParameter.equals(""))){
			try{
				System.out.println("tnx");
				if(colorListParameter.contains(":")){
					if(colorListParameter.split(":").length > 0){
						for(String splitColorId : colorListParameter.split(":")){
							//if success and no error
							try{
								int id = (splitColorId != null || !splitColorId.equals("") ? Integer.parseInt(splitColorId) : 0);
								colorIdList.add(id);
							
							//if error then return 0
							}catch(Exception e){
								colorIdList.add(0);
							}
						}
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			}
			
			try{
				if(sizeListParameter.contains(":")){
					if(sizeListParameter.split(":").length > 0){
						for(String splitSizeId : colorListParameter.split(":")){
							//if success and no error
							try{
								int id = (splitSizeId != null || !splitSizeId.equals("") ? Integer.parseInt(splitSizeId) : 0);
								sizeIdList.add(id);
							
							//if error then return 0
							}catch(Exception e){
								sizeIdList.add(0);
							}
						}
					}
				}
			}catch(Exception e){
				e.printStackTrace();
			}		
		}		
	}

}
