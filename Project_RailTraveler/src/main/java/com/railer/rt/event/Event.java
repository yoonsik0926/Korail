package com.railer.rt.event;
 
public class Event {
	private int listNum, eventNum;
	
	private String name;
	private String content;
	private String sdate;
	private String edate;
	private String imagename;
	public int getEventNum() {
		return eventNum;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getEdate() {
		return edate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public int getListNum() {
		return listNum;
	}
	public void setListNum(int listNum) {
		this.listNum = listNum;
	}
	public String getImagename() {
		return imagename;
	}
	public void setImagename(String imagename) {
		this.imagename = imagename;
	}
}
