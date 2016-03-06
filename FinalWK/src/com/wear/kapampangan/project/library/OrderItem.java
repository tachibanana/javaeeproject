package com.wear.kapampangan.project.library;

public class OrderItem {

	private int id;
	private int orderId;
	private Item ite;
	private Color color;
	private Size size;
	
	public OrderItem(int id, int orderId, Item ite, Color color, Size size) {

		this.id = id;
		this.orderId = orderId;
		this.ite = ite;
		this.color = color;
		this.size = size;
	}

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

	public Item getIte() {
		return ite;
	}

	public void setIte(Item ite) {
		this.ite = ite;
	}

	public Color getColor() {
		return color;
	}

	public void setColor(Color color) {
		this.color = color;
	}

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}
	
	

}
