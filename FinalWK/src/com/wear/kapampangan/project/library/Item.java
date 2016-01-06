package com.wear.kapampangan.project.library;

public class Item {
	
	private String productCode;
	private String name;
	private double price;
	private String image;
	private String description;
	private String status;
	
	public Item(String productCode, String name, double price, String image, String status , String description) {
		this.productCode = productCode;
		this.name = name;
		this.price = price;
		this.image = image;
		this.status = status;
		this.description = description;
	}


	public String getProductCode() {
		return productCode;
	}


	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}

	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}

	public String getDescription() {
		return description;
	}


	public void setDescription(String description) {
		this.description = description;
	}
}
