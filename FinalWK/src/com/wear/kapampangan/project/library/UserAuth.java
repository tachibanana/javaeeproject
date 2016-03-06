package com.wear.kapampangan.project.library;

public class UserAuth {

	private int id;
	private int userId;
	private int isActivated;
	private String accountType;
	
	
	public UserAuth(int id, int userId, int isActivated, String accountType) {
		this.id = id;
		this.userId = userId;
		this.isActivated = isActivated;
		this.accountType = accountType;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public int getUserId() {
		return userId;
	}
	
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	public int getIsActivated() {
		return isActivated;
	}
	
	public void setIsActivated(int isActivated) {
		this.isActivated = isActivated;
	}
	
	public String getAccountType() {
		return accountType;
	}
	
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	
	

}
