package com.railer.rt.plan;

public class Station {
	private int staNum;
	private int locNum;
	private String staName;
	private String staTel;
	private String staAddress;
	private String imageFilename;
	
	private int listNum;
	
	public int getStaNum() {
		return staNum;
	}
	public void setStaNum(int staNum) {
		this.staNum = staNum;
	}
	public int getLocNum() {
		return locNum;
	}
	public void setLocNum(int locNum) {
		this.locNum = locNum;
	}
	public String getStaName() {
		return staName;
	}
	public void setStaName(String staName) {
		this.staName = staName;
	}
	public String getStaTel() {
		return staTel;
	}
	public void setStaTel(String staTel) {
		this.staTel = staTel;
	}
	public String getStaAddress() {
		return staAddress;
	}
	public void setStaAddress(String staAddress) {
		this.staAddress = staAddress;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	@Override
	public String toString() {
		return "Station [staNum=" + staNum + ", LocNum=" + locNum + ", staName=" + staName + ", staTel=" + staTel
				+ ", staAddress=" + staAddress + ", imageFilename=" + imageFilename + "]";
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	
	
}
