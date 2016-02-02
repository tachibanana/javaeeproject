package com.wear.kapampangan.project.util;

import java.util.List;

import com.wear.kapampangan.project.library.Item;


public class WishlistUtil {
	
	public Item getItemByItemId(String itemId , List<Item> itemList){
		Item item = null;
		
		try{
			for(Item i : itemList){
				if(i.getProductCode().equals(itemId)){
					item = i;
					break;
				}
			}
			
			return item;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	
}
