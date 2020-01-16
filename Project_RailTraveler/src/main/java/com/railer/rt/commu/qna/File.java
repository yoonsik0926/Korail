package com.railer.rt.commu.qna;

public class File {
	private int qnaFileNum;
	private String saveFilename, originalFilename;
	private long fileSize;
	private int fileCount;
	
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
	
	
}
