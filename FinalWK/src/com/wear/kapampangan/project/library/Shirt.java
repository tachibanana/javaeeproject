package com.wear.kapampangan.project.library;

import java.util.List;

public class Shirt {

	private int id;
	private int userId;
	private String shirtName;
	private String shirtChoose;
	private String date;
	private List<DesignFront> designFront;
	private List<DesignBack> designBack;
		
	public Shirt(int id, int userId, String shirtName, String shirtChoose,
			String date, List<DesignFront> designFront,
			List<DesignBack> designBack) {
		this.id = id;
		this.userId = userId;
		this.shirtName = shirtName;
		this.shirtChoose = shirtChoose;
		this.date = date;
		this.designFront = designFront;
		this.designBack = designBack;
	}
	
	public String getShirtName() {
		return shirtName;
	}
	public void setShirtName(String shirtName) {
		this.shirtName = shirtName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getShirtChoose() {
		return shirtChoose;
	}
	public void setShirtChoose(String shirtChoose) {
		this.shirtChoose = shirtChoose;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public List<DesignFront> getDesignFront() {
		return designFront;
	}
	public void setDesignFront(List<DesignFront> designFront) {
		this.designFront = designFront;
	}
	public List<DesignBack> getDesignBack() {
		return designBack;
	}
	public void setDesignBack(List<DesignBack> designBack) {
		this.designBack = designBack;
	}
	
	

}
