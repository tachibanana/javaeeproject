package com.wear.kapampangan.project.library;

public class Category {

	private int id;
	private String categoryName;
	private String description;	
	private String icon;
	
	public Category(int id, String categoryName, String description, String icon) {
		this.id = id;
		this.categoryName = categoryName;
		this.description = description;
		this.icon = icon;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}

}
