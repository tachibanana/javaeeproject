package com.wear.kapampangan.project.library;

public class Review {

	private int id;
	private int userId;
	private String itemId;
	private String subject;
	private int rate;
	private String comment;
	private String date;
	
	public Review(int id, int userId, String itemId, String subject, int rate,
			String comment, String date) {
		this.id = id;
		this.userId = userId;
		this.itemId = itemId;
		this.subject = subject;
		this.rate = rate;
		this.comment = comment;
		this.date = date;
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
	public String getItemId() {
		return itemId;
	}
	public void setItemId(String itemId) {
		this.itemId = itemId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
}
