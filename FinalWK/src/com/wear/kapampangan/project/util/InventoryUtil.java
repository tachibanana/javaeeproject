package com.wear.kapampangan.project.util;

import java.util.List;

import javax.servlet.ServletContext;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.library.Item;

public class InventoryUtil {

	private static DBManager manager = null;
	public InventoryUtil(ServletContext sc) {
		manager = (DBManager) sc.getAttribute("dbmanager");
	}
	
	public void addItem(String productCode){
		try{
			Item item = (Item) manager.getItemByProductCode(productCode);
			manager.addItem(item);
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void addColorToList(String productCode , List<Integer> colorIdList){
		try{
			for(int colorId : colorIdList){
				manager.addColorToItem(productCode, colorId);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void addSizeToList(String productCode , List<Integer> sizeIdList){
		try{
			for(int sizeId : sizeIdList){
				manager.addSizeToItem(productCode, sizeId);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void updateItem(){
		
	}

}
