package com.railer.rt.commu.board;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private int listNum, boardNum;
	private String userId, userName;
	private String subject;
	private String content;
	private String created;
	private int hitCount;
	
	private int boardFileNum;
	private String saveFilename, originalFilename;
	private long fileSize;
	private int fileCount;
	
	private List<MultipartFile> upload;
	private long gap;
	
	private int replyCount;
	private int bookmarkCount;
	private int myBookMark;

	private String deleteId;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public int getBoardFileNum() {
		return boardFileNum;
	}

	public void setBoardFileNum(int boardFileNum) {
		this.boardFileNum = boardFileNum;
	}

	public String getSaveFilename() {
		return saveFilename;
	}

	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}

	public String getOriginalFilename() {
		return originalFilename;
	}

	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}

	public long getFileSize() {
		return fileSize;
	}

	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}

	public int getFileCount() {
		return fileCount;
	}

	public void setFileCount(int fileCount) {
		this.fileCount = fileCount;
	}

	public List<MultipartFile> getUpload() {
		return upload;
	}

	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
	}

	public long getGap() {
		return gap;
	}

	public void setGap(long gap) {
		this.gap = gap;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getBookmarkCount() {
		return bookmarkCount;
	}

	public void setBookmarkCount(int bookmarkCount) {
		this.bookmarkCount = bookmarkCount;
	}

	public int getMyBookMark() {
		return myBookMark;
	}

	public void setMyBookMark(int myBookMark) {
		this.myBookMark = myBookMark;
	}

	public String getDeleteId() {
		return deleteId;
	}

	public void setDeleteId(String deleteId) {
		this.deleteId = deleteId;
	}

	@Override
	public String toString() {
		return "Board [listNum=" + listNum + ", boardNum=" + boardNum + ", userId=" + userId + ", userName=" + userName
				+ ", subject=" + subject + ", content=" + content + ", created=" + created + ", hitCount=" + hitCount
				+ ", boardFileNum=" + boardFileNum + ", saveFilename=" + saveFilename + ", originalFilename="
				+ originalFilename + ", fileSize=" + fileSize + ", fileCount=" + fileCount + ", upload=" + upload
				+ ", gap=" + gap + ", replyCount=" + replyCount + ", bookmarkCount=" + bookmarkCount + ", myBookMark="
				+ myBookMark + ", deleteId=" + deleteId + ", getListNum()=" + getListNum() + ", getBoardNum()="
				+ getBoardNum() + ", getUserId()=" + getUserId() + ", getUserName()=" + getUserName()
				+ ", getSubject()=" + getSubject() + ", getContent()=" + getContent() + ", getCreated()=" + getCreated()
				+ ", getHitCount()=" + getHitCount() + ", getBoardFileNum()=" + getBoardFileNum()
				+ ", getSaveFilename()=" + getSaveFilename() + ", getOriginalFilename()=" + getOriginalFilename()
				+ ", getFileSize()=" + getFileSize() + ", getFileCount()=" + getFileCount() + ", getUpload()="
				+ getUpload() + ", getGap()=" + getGap() + ", getReplyCount()=" + getReplyCount()
				+ ", getBookmarkCount()=" + getBookmarkCount() + ", getMyBookMark()=" + getMyBookMark()
				+ ", getDeleteId()=" + getDeleteId() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}
