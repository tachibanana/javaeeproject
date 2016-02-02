package com.wear.kapampangan.project.library;

public class WishlistItem {

	private String id;
	private String userId;
	private Item item;
	
	public WishlistItem(String id, String userId, Item item) {
		this.id = id;
		this.userId = userId;
		this.item = item;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}
	
	
	

}
