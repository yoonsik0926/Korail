package com.railer.rt.commu.qna;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Qna {
	private int listNum, qnaNum;
	private String userId, userName;
	private String subject;
	private String content;
	private String created;
	private int hitCount;
	private int notice;
	private int enable;
	private int answer;
	private String category, categoryName;
	
	private List<File> files;
	
	private String subjectParent;
	public String getSubjectParent() {
		return subjectParent;
	}

	public void setSubjectParent(String subjectParent) {
		this.subjectParent = subjectParent;
	}

	public List<File> getFiles() {
		return files;
	}

	public void setFiles(List<File> files) {
		this.files = files;
	}

	private int qnaFileNum;
	private String saveFilename, originalFilename;
	private long fileSize;
	private int fileCount;
	
	private List<MultipartFile> upload;
	private long gap;
	
	private int replyCount;
	private int bookmarkCount;
	private int myBookMark;
	private int reArticleCount;

	public int getReArticleCount() {
		return reArticleCount;
	}

	public void setReArticleCount(int reArticleCount) {
		this.reArticleCount = reArticleCount;
	}

	private String deleteId;

	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public int getQnaNum() {
		return qnaNum;
	}

	public void setQnaNum(int qnaNum) {
		this.qnaNum = qnaNum;
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

	public int getNotice() {
		return notice;
	}

	public void setNotice(int notice) {
		this.notice = notice;
	}

	public int getEnable() {
		return enable;
	}

	public void setEnable(int enable) {
		this.enable = enable;
	}

	public int getAnswer() {
		return answer;
	}

	public void setAnswer(int answer) {
		this.answer = answer;
	}

	public int getQnaFileNum() {
		return qnaFileNum;
	}

	public void setQnaFileNum(int qnaFileNum) {
		this.qnaFileNum = qnaFileNum;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Qna [listNum=" + listNum + ", qnaNum=" + qnaNum + ", userId=" + userId + ", userName=" + userName
				+ ", subject=" + subject + ", content=" + content + ", created=" + created + ", hitCount=" + hitCount
				+ ", notice=" + notice + ", enable=" + enable + ", answer=" + answer + ", category=" + category
				+ ", categoryName=" + categoryName + ", files=" + files + ", subjectParent=" + subjectParent
				+ ", qnaFileNum=" + qnaFileNum + ", saveFilename=" + saveFilename + ", originalFilename="
				+ originalFilename + ", fileSize=" + fileSize + ", fileCount=" + fileCount + ", upload=" + upload
				+ ", gap=" + gap + ", replyCount=" + replyCount + ", bookmarkCount=" + bookmarkCount + ", myBookMark="
				+ myBookMark + ", reArticleCount=" + reArticleCount + ", deleteId=" + deleteId + ", getSubjectParent()="
				+ getSubjectParent() + ", getFiles()=" + getFiles() + ", getReArticleCount()=" + getReArticleCount()
				+ ", getListNum()=" + getListNum() + ", getQnaNum()=" + getQnaNum() + ", getUserId()=" + getUserId()
				+ ", getUserName()=" + getUserName() + ", getSubject()=" + getSubject() + ", getContent()="
				+ getContent() + ", getCreated()=" + getCreated() + ", getHitCount()=" + getHitCount()
				+ ", getNotice()=" + getNotice() + ", getEnable()=" + getEnable() + ", getAnswer()=" + getAnswer()
				+ ", getQnaFileNum()=" + getQnaFileNum() + ", getSaveFilename()=" + getSaveFilename()
				+ ", getOriginalFilename()=" + getOriginalFilename() + ", getFileSize()=" + getFileSize()
				+ ", getFileCount()=" + getFileCount() + ", getUpload()=" + getUpload() + ", getGap()=" + getGap()
				+ ", getReplyCount()=" + getReplyCount() + ", getBookmarkCount()=" + getBookmarkCount()
				+ ", getMyBookMark()=" + getMyBookMark() + ", getDeleteId()=" + getDeleteId() + ", getCategory()="
				+ getCategory() + ", getCategoryName()=" + getCategoryName() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
