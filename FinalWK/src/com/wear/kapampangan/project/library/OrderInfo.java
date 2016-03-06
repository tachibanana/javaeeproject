package com.wear.kapampangan.project.library;

import java.util.List;

public class OrderInfo {

	private int id;
	private User user;
	private UserInfo userInfo;
	private String date;
	private String status;
	private int orderNo;
	private List<Product> itemList;
	
	public OrderInfo(int id, User user, UserInfo userInfo, String date,
			String status, int orderNo, List<Product> itemList) {
		super();
		this.id = id;
		this.user = user;
		this.userInfo = userInfo;
		this.date = date;
		this.status = status;
		this.orderNo = orderNo;
		this.itemList = itemList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public UserInfo getuserInfo() {
		return userInfo;
	}

	public void setuserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public List<Product> getItemList() {
		return itemList;
	}

	public void setItemList(List<Product> itemList) {
		this.itemList = itemList;
	}
	
	
	
	

}
