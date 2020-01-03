package com.railer.rt.plan;

public class Plan {
	private int planNum;
	private int ticketDay; // 티켓이 몇일차짜리 인지
	private String userId;
	private String sDate; // 내일로 여행 시작날짜
	
	// DetailPlan(세부계획)
	private int detailPlanNum;
	private int staNum;
	private int nthDay; // 몇일차의 세부계획인지
	
	// MoreDetailPlan(세부계획 속 내용)
	private int mdpNum;
	private int cateNum;
	private String name;
	private String tel;
	private String address;
	private String longitude; // 경도
	private String latitude; // 위도
	private String memo;
	private String sTime;
	private String eTime;
	private String price; // 예상가격
	
	
	public int getPlanNum() {
		return planNum;
	}
	public void setPlanNum(int planNum) {
		this.planNum = planNum;
	}
	public int getTicketDay() {
		return ticketDay;
	}
	public void setTicketDay(int ticketDay) {
		this.ticketDay = ticketDay;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public int getDetailPlanNum() {
		return detailPlanNum;
	}
	public void setDetailPlanNum(int detailPlanNum) {
		this.detailPlanNum = detailPlanNum;
	}
	public int getStaNum() {
		return staNum;
	}
	public void setStaNum(int staNum) {
		this.staNum = staNum;
	}
	public int getNthDay() {
		return nthDay;
	}
	public void setNthDay(int nthDay) {
		this.nthDay = nthDay;
	}
	public int getMdpNum() {
		return mdpNum;
	}
	public void setMdpNum(int mdpNum) {
		this.mdpNum = mdpNum;
	}
	public int getCateNum() {
		return cateNum;
	}
	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLongitude() {
		return longitude;
	}
	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}
	public String getLatitude() {
		return latitude;
	}
	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public String geteTime() {
		return eTime;
	}
	public void seteTime(String eTime) {
		this.eTime = eTime;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
