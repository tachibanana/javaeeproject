package com.wear.kapampangan.project.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Item;
import com.wear.kapampangan.project.util.ImageUpload;


@WebServlet("/image/upload")
public class UploadImageServlet extends HttpServlet {

	private String path;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String productCode = (request.getParameter("productCode") != null ? request.getParameter("productCode") : "");
		DBManager manager = (DBManager) request.getServletContext().getAttribute("dbmanager");
		
		boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
		if(isMultiPart){
			ServletFileUpload upload = new ServletFileUpload();
			try{
				FileItemIterator itr = upload.getItemIterator(request);
				while(itr.hasNext()){
					FileItemStream item = itr.next();
					if(item.isFormField()){
						//do field specific process
						String fieldName = item.getFieldName();
						InputStream is = item.openStream();
						byte[] b = new byte[is.available()];
						is.read(b);
						String value = new String(b);
						response.getWriter().print(fieldName + ":" + value + "<br />");
					}else{
						//do file upload specific process
			
						
						String path = getServletContext().getRealPath("/");
						//this.path = "images/product/" + item.getName();
						//call a method to upload file
						if(!(this.path = ImageUpload.processFile(path, item)).equals(""))
							response.getWriter().println("File upload success");
						else 
							response.getWriter().println("File upload failed");
						//this.path = "images/product/" + item.getName();
					}
			
				}
				
				if(!productCode.equals("")){
					Item item = (Item) manager.getItemByProductCode(productCode);
					manager.updateItem(new Item(item.getProductCode() , item.getName() , item.getPrice() , this.path , item.getStatus() , item.getDescription()));
					response.sendRedirect("/FinalWK/wearkapampangan/wear/team/kapampangan/item-info.jsp?productCode=" + item.getProductCode());
				}
				
			
				out.println("\n" +path);
			}catch(FileUploadException e){
				e.printStackTrace();
			}
		}
		//else do nothing
	}

}
