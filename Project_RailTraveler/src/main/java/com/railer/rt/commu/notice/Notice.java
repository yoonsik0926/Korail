package com.railer.rt.commu.notice;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Notice {
	private int listNum, noticeNum;
	private String userId, userName;
	private String subject;
	private String content;
	private String created;
	private int hitCount;
	
	private int noticeFileNum;
	private String saveFilename, originalFilename;
	private long fileSize;
	private int fileCount;
	
	private List<MultipartFile> upload;
	private long gap;
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
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
	public int getNoticeFileNum() {
		return noticeFileNum;
	}
	public void setNoticeFileNum(int noticeFileNum) {
		this.noticeFileNum = noticeFileNum;
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
	
	@Override
	public String toString() {
		return "Notice [listNum=" + listNum + ", noticeNum=" + noticeNum + ", userId=" + userId + ", userName="
				+ userName + ", subject=" + subject + ", content=" + content + ", created=" + created + ", hitCount="
				+ hitCount + ", noticeFileNum=" + noticeFileNum + ", saveFilename=" + saveFilename
				+ ", originalFilename=" + originalFilename + ", fileSize=" + fileSize + ", fileCount=" + fileCount
				+ ", upload=" + upload + ", gap=" + gap + ", getListNum()=" + getListNum() + ", getNoticeNum()="
				+ getNoticeNum() + ", getUserId()=" + getUserId() + ", getUserName()=" + getUserName()
				+ ", getSubject()=" + getSubject() + ", getContent()=" + getContent() + ", getCreated()=" + getCreated()
				+ ", getHitCount()=" + getHitCount() + ", getNoticeFileNum()=" + getNoticeFileNum()
				+ ", getSaveFilename()=" + getSaveFilename() + ", getOriginalFilename()=" + getOriginalFilename()
				+ ", getFileSize()=" + getFileSize() + ", getFileCount()=" + getFileCount() + ", getUpload()="
				+ getUpload() + ", getGap()=" + getGap() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
}
