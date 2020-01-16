package com.railer.rt.plan;

import org.springframework.web.multipart.MultipartFile;

public class Plan {
	private int planNum;
	private int ticketDay; // 티켓이 몇일차짜리 인지
	private String userId;
	private String sDate; // 내일로 여행 시작날짜
	private String eDate; //여행 끝 날짜
	private String title;
	private String imageFileName; //이미지 파일 이름
	private MultipartFile upload;
	private String writer; //작성자
	private String staName; //역 이름
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String geteDate() {
		return eDate;
	}
	public void seteDate(String eDate) {
		this.eDate = eDate;
	}
	public String getImageFileName() {
		return imageFileName;
	}
	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getStaName() {
		return staName;
	}
	public void setStaName(String staName) {
		this.staName = staName;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
	
}
