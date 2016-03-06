package com.wear.kapampangan.project.library;

public class Admin {

	private String username;
	private String email;
	private String password;
	private int isActivated;
	
	public Admin(String username, String email, String password, int isActivated) {
		super();
		this.username = username;
		this.email = email;
		this.password = password;
		this.isActivated = isActivated;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getIsActivated() {
		return isActivated;
	}

	public void setIsActivated(int isActivated) {
		this.isActivated = isActivated;
	}
	
	

}
