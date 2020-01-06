package com.railer.rt.singo;

public class Singo {
	private int blameNo;
	private int targetNo;
	private int targetType; //게시물(0)인지 댓글(1)인지~
	private String targetTitle;
	private String userId;
	private String targetUserId;
	private String content;
	private String targetUrl;
	private String created;
	
	
	public String getCreated() {
		return created;
	}
	public void setCreated(String created) {
		this.created = created;
	}
	public int getBlameNo() {
		return blameNo;
	}
	public void setBlameNo(int blameNo) {
		this.blameNo = blameNo;
	}
	public int getTargetNo() {
		return targetNo;
	}
	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}
	public int getTargetType() {
		return targetType;
	}
	public void setTargetType(int targetType) {
		this.targetType = targetType;
	}
	public String getTargetTitle() {
		return targetTitle;
	}
	public void setTargetTitle(String targetTitle) {
		this.targetTitle = targetTitle;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getTargetUserId() {
		return targetUserId;
	}
	public void setTargetUserId(String targetUserId) {
		this.targetUserId = targetUserId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTargetUrl() {
		return targetUrl;
	}
	public void setTargetUrl(String targetUrl) {
		this.targetUrl = targetUrl;
	}

	
	
	
	

}
