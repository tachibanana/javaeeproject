package com.wear.kapampangan.project.library;

public class Post {

	private int id;
	private int topicId;
	private int userId;
	private String content;
	private int contentNo;
	private String date;
	
	

	public Post(int id, int topicId, int userId, String content, int contentNo,
			String date) {
		this.id = id;
		this.topicId = topicId;
		this.userId = userId;
		this.content = content;
		this.contentNo = contentNo;
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

	public int getTopicId() {
		return topicId;
	}

	public void setTopicId(int topicId) {
		this.topicId = topicId;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getContentNo() {
		return contentNo;
	}

	public void setContentNo(int contentNo) {
		this.contentNo = contentNo;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	

}
