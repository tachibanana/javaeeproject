package com.wear.kapampangan.project.helper;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.database.MYSQLConnection;
import com.wear.kapampangan.project.database.ServerConnection;

@WebListener
public class DBManagerSetup implements ServletContextListener {

    public void contextDestroyed(ServletContextEvent sce)  {
    	
    }


    public void contextInitialized(ServletContextEvent sce)  { 
        
    	try{
//    		//Using POSTGRESQL
//    		//ServerConnection sc = new PostgreSQLConnection("jdbc:postgresql://localhost/" , "dbwearkapampangan" , "rafael.manuel" ,"" , "org.postgresql.Driver");   		
    		ServerConnection sc = new MYSQLConnection("jdbc:mysql://localhost:3306/" , "dbwk" , "root" ,"" , "com.mysql.jdbc.Driver");
    		
    		//database on host
    		//ServerConnection sc = new MYSQLConnection("jdbc:mysql://127.10.71.130:3306/" , "wearkapampangan" , "admin3fdV4Hf" ,"uYyP66MpT81A" , "com.mysql.jdbc.Driver");
    		
    		
 //   		ServerConnection sc = new MYSQLConnection("jdbc:mysql://127.9.59.130:3306/" , "wearkapampanganofficial" , "admin7j7LvkL" ,"UjCMVHraiVds" , "com.mysql.jdbc.Driver");
    		
    		DBManager manager = new DBManager(sc);
    		
    		//OPEN Connection
    		manager.openConnection();
    		
    		//Connection Status
    		System.out.println(""+sc.getConnectionStatus());
    		
    		//Connection URL
    		System.out.println(sc.getConnectionURL());
    		
    		ServletContext context = sce.getServletContext();
    		context.setAttribute("dbmanager", manager);
    		
    		//Manager Setup Completed
    		System.out.println("DBManager Setup Completedd");
    		
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
    }
	
}
