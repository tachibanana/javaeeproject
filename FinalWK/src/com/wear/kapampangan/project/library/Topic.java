package com.wear.kapampangan.project.library;

public class Topic {

	private int id;	
	private int categoryId;
	private int userId;
	private String subject;
	private String tags;
	private int views;
	private String date;


	public Topic(int id, int categoryId, int userId, String subject,
			String tags, int views, String date) {
		this.id = id;
		this.categoryId = categoryId;
		this.userId = userId;
		this.subject = subject;
		this.tags = tags;
		this.views = views;
		this.date = date;
	}


	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}
	
	
	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
