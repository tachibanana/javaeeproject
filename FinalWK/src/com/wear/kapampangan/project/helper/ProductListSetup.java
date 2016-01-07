package com.wear.kapampangan.project.helper;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.wear.kapampangan.project.library.Color;
import com.wear.kapampangan.project.library.Item;
import com.wear.kapampangan.project.library.Product;
import com.wear.kapampangan.project.library.Size;

@WebListener
public class ProductListSetup implements HttpSessionListener{


    public ProductListSetup(){
        // TODO Auto-generated constructor stub
    }

    public void sessionCreated(HttpSessionEvent se){
    	
    	//instantiate
    	HttpSession session = se.getSession();
        List<Product> listOfProduct = new ArrayList<Product>();
        
        Item item1 = new Item("RX7809","Libut Libut" , 200 , "images/product/libut_libut.jpg" , "status" , "description");
        Color red = new Color(1,"RED","#aaaggg");
        Size large = new Size(1 , "L");
        
        listOfProduct.add(new Product(1 , 5 , 500.00 , item1 , red , large));
        //listOfProduct.add(new Product("RX7809" ,"Libut Libut" , 200 ,"images/product/libut_libut.jpg" , 5 , "RED" , "XL"));
       // listOfProduct.add(new Product("RXFY9" ,"Ciudad ning Angles" , 250 ,"images/product/ciudad_ning_angles.jpg" , 2 , "RED" , "XL"));
        
     
        
        //create an attribute object
        session.setAttribute("cartItem", listOfProduct);
        System.out.println("game");
    }

    public void sessionDestroyed(HttpSessionEvent arg0){ 
     
    }
	
}
