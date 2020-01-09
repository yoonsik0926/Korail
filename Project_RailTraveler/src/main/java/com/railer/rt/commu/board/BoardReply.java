package com.railer.rt.commu.board;

public class BoardReply {
	private int listNum, boardReplyNum;
	private String userId, userName;
	private int boardNum;
	private String content;
	private String created;
	private int answer;

	private String deleteId;
	
	private int replyCount;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getBoardReplyNum() {
		return boardReplyNum;
	}

	public void setBoardReplyNum(int boardReplyNum) {
		this.boardReplyNum = boardReplyNum;
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

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
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

	public String getDeleteId() {
		return deleteId;
	}

	public void setDeleteId(String deleteId) {
		this.deleteId = deleteId;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "BoardReply [listNum=" + listNum + ", boardReplyNum=" + boardReplyNum + ", userId=" + userId
				+ ", userName=" + userName + ", boardNum=" + boardNum + ", content=" + content + ", created=" + created
				+ ", answer=" + answer + ", deleteId=" + deleteId + ", replyCount=" + replyCount + ", getListNum()="
				+ getListNum() + ", getBoardReplyNum()=" + getBoardReplyNum() + ", getUserId()=" + getUserId()
				+ ", getUserName()=" + getUserName() + ", getBoardNum()=" + getBoardNum() + ", getContent()="
				+ getContent() + ", getCreated()=" + getCreated() + ", getAnswer()=" + getAnswer() + ", getDeleteId()="
				+ getDeleteId() + ", getReplyCount()=" + getReplyCount() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
}
