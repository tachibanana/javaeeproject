package com.wear.kapampangan.project.controller;

import com.wear.kapampangan.project.database.DBManager;
import com.wear.kapampangan.project.database.MYSQLConnection;
import com.wear.kapampangan.project.database.ServerConnection;
import com.wear.kapampangan.project.library.Item;

abstract public class Administrator {
	
	private ServerConnection sc;
	private DBManager manager;
	
	public Administrator(){
		ServerConnection sc = new MYSQLConnection("jdbc:mysql://localhost:3306/" , "dbwearkapampangan" , "root" ,"" , "com.mysql.jdbc.Driver");
		DBManager manager = new DBManager(sc);
		manager.openConnection();
	}
	public void addItem(Item item){
		
		
		
		
		
	}

}
