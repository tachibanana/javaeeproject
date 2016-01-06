package com.wear.kapampangan.project.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class PostgreSQLConnection extends DBUserLibrary implements ServerConnection{
	
	public PostgreSQLConnection(String URL, String catalog, String username, String password, String className) {
		super(URL, catalog, username, password, className);
	}

	private String status;

	public Connection getConnection() {
		try {
			Class.forName(getClassName());
			Connection conn = DriverManager.getConnection(getConnectionURL());
			status = "Success";
			return conn;
		} catch (Exception e) {
			status = "Error";
			e.printStackTrace();
			return null;
		}
	}

	public String getConnectionURL() {
		return getURL() + getCatalog() + "?username=" + getUsername()
				+ "&password=" + getPassword();
	}

	public String getConnectionStatus() {
		return status;
	}
}
