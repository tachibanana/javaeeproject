package com.wear.kapampangan.project.library;

public class Color {
	
	private int id;
	private String color;
	private String hex;
	
	public Color(int id, String color, String hex) {
		super();
		this.id = id;
		this.color = color;
		this.hex = hex;
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getHex() {
		return hex;
	}

	public void setHex(String hex) {
		this.hex = hex;
	}
	
}
