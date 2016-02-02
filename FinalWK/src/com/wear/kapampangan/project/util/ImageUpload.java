package com.wear.kapampangan.project.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.apache.commons.fileupload.FileItemStream;

public class ImageUpload {

	public static String processFile(String path, FileItemStream item){
		
		try{
			System.out.println(path  + "wearkapampangan" + File.separator + "wear" + File.separator + "team" + File.separator
					+ "kapampangan" + File.separator + "images" + File.separator + "product");
			File f = new File(path  + "wearkapampangan" + File.separator + "wear" + File.separator + "team" + File.separator
					+ "kapampangan" + File.separator + "images" + File.separator + "product");
			
			if(!f.exists()) f.mkdir();
			File savedFile = new File(f.getAbsolutePath() + File.separator + item.getName());
			FileOutputStream fos = new FileOutputStream(savedFile);
			InputStream is = item.openStream();
			int x = 0;
			byte[] b = new byte[1024];
			while((x=is.read(b)) != -1){
				fos.write(b , 0 , x);
			}
			
			fos.flush();
			fos.close();
			return "images/product/" + item.getName();
		}catch(Exception e){
			e.printStackTrace();
			return "";
		}
		
	}

}
