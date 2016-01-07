package com.wear.kapampangan.project.util;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.library.Product;

public class CartUtil {
	
	private static List<Product> listOfProduct;
	
	@SuppressWarnings("unchecked")
	public CartUtil(HttpSession session){
		listOfProduct = (List<Product>) session.getAttribute("cartItem");
	}
	
//	public String addToCart(String productCode , String name , double price , String image ,  int quantity , String color , String size){
//		try{
//			
//			Product newProduct = new Product(productCode , name, price,image,quantity,color,size);
//			listOfProduct.add(newProduct);
//			
//			return "ONE ITEM ADDED TO CART.";
//		}catch(Exception e){
//			return "FAILED TO ADD INTO CART";
//		}
//		
//	}
	
	public List<Product> removeToCart(String productCode , String color , String size){
		try{
			for(Product product : listOfProduct){
				if(product.getItem().getProductCode().equals(productCode)){
					
					if(product.getColor().getColor().equals(color) || product.getSize().getSize().equals(size)){
						listOfProduct.remove(product);
						break;
					}
				}
			}
			
			return listOfProduct;
		}catch(Exception e){
			return listOfProduct;
		}
	}
	
//	public void updateQuantity(String productCode , String  color ,String size , int newQuantity){
//		String setcode = "";
//		String setname = "";
//		double setprice = 0.0;
//		String setcolor = "";
//		String setsize = "";
//		int setquantity = 0;
//		String setimage = "";
//		
//		for(Product product : listOfProduct){
//			if(product.getProductCode().equals(productCode)){
//				System.out.println("looping");
//				
//				if(product.getColor().equals(color) && product.getSize().equals(size)){
//					System.out.println("attemping");
//					
//					setcode = product.getProductCode();
//					setname = product.getName();
//					setprice = product.getPrice();
//					setcolor = product.getColor();
//					setsize = product.getSize();
//					setimage = product.getImage();
//					setquantity = newQuantity;
//					
//					listOfProduct.remove(product);
//					listOfProduct.add(new Product(setcode , setname , setprice , setimage , setquantity , setcolor , setsize));
//					break;
//				}
//			}
//		}
//	}

}
