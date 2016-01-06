package com.wear.kapampangan.project.database;

import java.sql.Connection;

public interface ServerConnection {

	public Connection getConnection();
	public String getConnectionURL();
	public String getConnectionStatus();
}
