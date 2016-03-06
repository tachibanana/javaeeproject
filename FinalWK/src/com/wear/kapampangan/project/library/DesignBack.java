package com.wear.kapampangan.project.library;

public class DesignBack {

	private int id;
	private int shirtId;
	private String design;
	
	public DesignBack(int id, int shirtId, String design) {
		this.id = id;
		this.shirtId = shirtId;
		this.design = design;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getShirtId() {
		return shirtId;
	}
	public void setShirtId(int shirtId) {
		this.shirtId = shirtId;
	}
	public String getDesign() {
		return design;
	}
	public void setDesign(String design) {
		this.design = design;
	}
	
}