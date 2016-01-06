package com.wear.kapampangan.project.database;

public class DBUserLibrary {

	public  String URL;
	public  String catalog;
	public  String username;
	public  String password;
	public  String className;
	
	public DBUserLibrary(String URL, String catalog, String username, String password, String className) {
		super();
		this.URL = URL;
		this.catalog = catalog;
		this.username = username;
		this.password = password;
		this.className = className;
	}
	
	public String getURL() {
		return URL;
	}
	public String getCatalog() {
		return catalog;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}
	public String getClassName() {
		return className;
	}
	
}
