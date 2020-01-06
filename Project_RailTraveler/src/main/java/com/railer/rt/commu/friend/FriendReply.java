package com.railer.rt.commu.friend;

public class FriendReply {
	private int listNum, friendReplyNum;
	private String userId, userName;
	private int friendNum;
	private String content;
	private String created;
	private int answer;
	private int secret;

	private int deleted;
	private String deleteId;
	
	private int replyCount;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getFriendReplyNum() {
		return friendReplyNum;
	}

	public void setFriendReplyNum(int friendReplyNum) {
		this.friendReplyNum = friendReplyNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getFriendNum() {
		return friendNum;
	}

	public void setFriendNum(int friendNum) {
		this.friendNum = friendNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}	//대댓글 개수

	public int getDeleted() {
		return deleted;
	}

	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}

	public String getDeleteId() {
		return deleteId;
	}

	public void setDeleteId(String deleteId) {
		this.deleteId = deleteId;
	}

	@Override
	public String toString() {
		return "FriendReply [listNum=" + listNum + ", friendReplyNum=" + friendReplyNum + ", userId=" + userId
				+ ", userName=" + userName + ", friendNum=" + friendNum + ", content=" + content + ", created="
				+ created + ", answer=" + answer + ", secret=" + secret + ", replyCount=" + replyCount
				+ ", getListNum()=" + getListNum() + ", getFriendReplyNum()=" + getFriendReplyNum() + ", getUserId()="
				+ getUserId() + ", getUserName()=" + getUserName() + ", getFriendNum()=" + getFriendNum()
				+ ", getContent()=" + getContent() + ", getCreated()=" + getCreated() + ", getAnswer()=" + getAnswer()
				+ ", getSecret()=" + getSecret() + ", getReplyCount()=" + getReplyCount() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}
