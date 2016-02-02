package com.wear.kapampangan.project.util;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.library.Product;

public class CartUpdateUtil {

	List<Product> listOfProduct;
	
	public CartUpdateUtil(HttpSession session) {
		listOfProduct = (List<Product>) session.getAttribute("cartItem"); 
	}

	public List<Product> updateQuantity(String code , String color , String size , int newQuantity){
		Product newProduct = null;
		List<Product> list = listOfProduct;
				
		for(Product product : list){
			System.out.println("- counter\n");
			if(product.getItem().getProductCode().equals(code)){
				if(product.getSize().getSize().equals(size) && product.getColor().getColor().equals(color)){
					System.out.println("- test\n");
					newProduct = new Product(1 ,
							newQuantity ,
							newQuantity * product.getItem().getPrice() ,
							product.getItem() ,
							product.getColor() , 
							product.getSize());
					list.remove(product);
					break;
				}
			}
			
		}
		
		list.add(newProduct);
		return list;
	}
	
}
