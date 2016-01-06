package com.wear.kapampangan.project.library;

import java.util.List;

public class InventoryProduct {
	
	private String id;
	private Item item;
	private List<Color> availableColor;
	private List<Size> availableSize;
	private int totalQuantity;
	
	public InventoryProduct(String id, Item item, List<Color> availableColor, List<Size> availableSize, int totalQuantity) {
		
		this.id = id;
		this.item = item;
		this.availableColor = availableColor;
		this.availableSize = availableSize;
		this.totalQuantity = totalQuantity;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}
	
	public Item getItem() {
		return item;
	}


	public void setItem(Item item) {
		this.item = item;
	}


	public List<Color> getAvailableColor() {
		return availableColor;
	}


	public void setAvailableColor(List<Color> availableColor) {
		this.availableColor = availableColor;
	}


	public List<Size> getAvailableSize() {
		return availableSize;
	}


	public void setAvailableSize(List<Size> availableSize) {
		this.availableSize = availableSize;
	}


	public int getTotalQuantity() {
		return totalQuantity;
	}


	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
		

}
