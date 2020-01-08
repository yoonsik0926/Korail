package com.railer.rt.commu.friend;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Friend {
	private int listNum, friendNum;
	private String userId, userName;
	private String subject;
	private String content;
	private String created;
	private String sDate,eDate;
	private int hitCount;
	private int notice;
	private int enable;
	private int validate;
	
	
	public int getValidate() {
		return validate;
	}
	public void setValidate(int validate) {
		this.validate = validate;
	}
	private int friendFileNum;
	private String saveFilename, originalFilename;
	private long fileSize;
	private int fileCount;
	
	private List<MultipartFile> upload;
	private long gap;
	
	private int replyCount;
	private int bookmarkCount;
	private int myBookMark;

	private int deleted;
	private String deleteId;
	
	
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
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getFriendNum() {
		return friendNum;
	}
	public void setFriendNum(int friendNum) {
		this.friendNum = friendNum;
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
	
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getFriendFileNum() {
		return friendFileNum;
	}
	public void setFriendFileNum(int friendFileNum) {
		this.friendFileNum = friendFileNum;
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
	
	
	public int getEnable() {
		return enable;
	}
	public void setEnable(int enable) {
		this.enable = enable;
	}
	public int getMyBookMark() {
		return myBookMark;
	}
	public void setMyBookMark(int myBookMark) {
		this.myBookMark = myBookMark;
	}
	@Override
	public String toString() {
		return "Friend [listNum=" + listNum + ", friendNum=" + friendNum + ", userId=" + userId + ", userName="
				+ userName + ", subject=" + subject + ", content=" + content + ", created=" + created + ", hitCount="
				+ hitCount + ", friendFileNum=" + friendFileNum + ", saveFilename=" + saveFilename
				+ ", originalFilename=" + originalFilename + ", fileSize=" + fileSize + ", fileCount=" + fileCount
				+ ", upload=" + upload + ", gap=" + gap + ", getListNum()=" + getListNum() + ", getFriendNum()="
				+ getFriendNum() + ", getUserId()=" + getUserId() + ", getUserName()=" + getUserName()
				+ ", getSubject()=" + getSubject() + ", getContent()=" + getContent() + ", getCreated()=" + getCreated()
				+ ", getHitCount()=" + getHitCount() + ", getFriendFileNum()=" + getFriendFileNum()
				+ ", getSaveFilename()=" + getSaveFilename() + ", getOriginalFilename()=" + getOriginalFilename()
				+ ", getFileSize()=" + getFileSize() + ", getFileCount()=" + getFileCount() + ", getUpload()="
				+ getUpload() + ", getGap()=" + getGap() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
