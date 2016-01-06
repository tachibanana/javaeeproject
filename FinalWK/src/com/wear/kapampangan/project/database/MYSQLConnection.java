package com.wear.kapampangan.project.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class MYSQLConnection extends DBUserLibrary implements ServerConnection {

	public MYSQLConnection(String uRL, String catalog, String username, String password, String className) {
		super(uRL, catalog, username, password, className);
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
			return null;
		}
	}

	public String getConnectionURL() {
		return getURL() + getCatalog() + "?user=" + getUsername()
				+ "&password=" + getPassword();
	}

	public String getConnectionStatus() {
		return status;
	}

}
