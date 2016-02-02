package com.wear.kapampangan.project.library;

public class InventoryDetail {

	private int id;
	private String productCode;
	private int quantity;
	private byte status;
	
	public InventoryDetail(int id, String productCode, int quantity, byte status) {
		
		this.id = id;
		this.productCode = productCode;
		this.quantity = quantity;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProductCode() {
		return productCode;
	}

	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public byte getStatus() {
		return status;
	}

	public void setStatus(byte status) {
		this.status = status;
	}
	
	
	
	

}
