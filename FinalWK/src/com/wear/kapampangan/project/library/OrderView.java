package com.wear.kapampangan.project.library;

public class OrderView {

	private int id;
	private int orderId;
	private int isRead;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getIsRead() {
		return isRead;
	}
	public void setIsRead(int isRead) {
		this.isRead = isRead;
	}
	
	public OrderView(int id, int orderId, int isRead) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.isRead = isRead;
	}

	

}
