package com.wear.kapampangan.project.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.wear.kapampangan.project.library.Color;
import com.wear.kapampangan.project.library.Item;
import com.wear.kapampangan.project.library.Product;
import com.wear.kapampangan.project.library.Size;

public class CartUtil {
	
	private List<Product> listOfProduct;
	//private List<Product> tempListOfProduct;
	
	@SuppressWarnings("unchecked")
	public CartUtil(HttpSession session){
		listOfProduct = (List<Product>) session.getAttribute("cartItem");
		//tempListOfProduct =  (List<Product>) session.getAttribute("tempCartItem"); 
	}
	
	public List<Product> addToCart(Product product_){
		try{
			Product tempProduct = null;
			boolean notExist = true;
			for(Product product : listOfProduct){
				System.out.printf("*%s = %s & %s = %s || %s = %s\n", product_.getItem().getProductCode() , product.getItem().getProductCode() , product_.getColor().getColor() , product.getColor().getColor(), product_.getSize().getSize() , product.getSize().getSize());
				if(product.getItem().getProductCode().equals(product_.getItem().getProductCode())){
					if(product.getSize().getSize().equals(product_.getSize().getSize()) && product.getColor().getColor().equals(product_.getColor().getColor())){
						notExist = false;
						tempProduct = new Product(0,
												  product.getQuantity() + product_.getQuantity(),
												  (product.getQuantity() + product_.getQuantity()) * product_.getItem().getPrice(),
												  product.getItem(),
												  product.getColor(),
												  product.getSize());
						listOfProduct.remove(product);
						System.out.println( product.getTotalPrice() + " = " + product_.getItem().getPrice());
						break;
					}
				}
			}
			
			if(notExist){
				listOfProduct.add(product_);
				System.out.println("YES");
			}else{
				listOfProduct.add(tempProduct);
				System.out.println("NO");
			}
				
			
			return listOfProduct;
		}catch(Exception e){
			return null;
		}
		
	}
	
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
	
//	public List<Product> updateQuantity(String code , String color , String size , int newQuantity){
//		Product newProduct = null;
//		List<Product> list = tempListOfProduct;
//				
//		for(Product product : list){
//			System.out.println("- counter\n");
//			if(product.getItem().getProductCode().equals(code)){
//				if(product.getSize().getSize().equals(size) && product.getColor().getColor().equals(color)){
//					System.out.println("- test\n");
//					newProduct = new Product(1 ,
//							newQuantity ,
//							newQuantity * product.getItem().getPrice() ,
//							product.getItem() ,
//							product.getColor() , 
//							product.getSize());
//					list.remove(product);
//					break;
//				}
//			}
//			
//		}
//		
//		list.add(newProduct);
//		return list;
//	}
//	
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
