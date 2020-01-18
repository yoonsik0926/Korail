package com.railer.rt.plan;

import java.util.List;
import java.util.Map;

public interface PlanService {
	public List<Station> listStation(Map<String, Object> map); // 맵에서 검색한 역 리스트(마커로 뿌려줌)
	public int dataCount(Map<String, Object> map); // 역 개수
	public List<Tour> listCategory(); // 대분류
	public List<Tour> listDetailCate(Map<String, Object> map); // 소분류
	public int insertPlan(Map<String, Object> map) throws Exception; // 세부계획 DB저장
	public int placeDataCount(Map<String, Object> map); // 장소 개수
	public List<Tour> listTour(Map<String, Object> map); // 장소 리스트(세부계획 모달 검색창에서 뿌려줌)
	public void updateImage(Plan dto, String pathname) throws Exception; // jsp에서 submit한 이미지 파일을 db에 추가하기 위해서 필요한 것

	//추천코스
	public List<Plan> listPlan(Map<String, Object> map) throws Exception;
	public int dataPlanCount(Map<String, Object> map) throws Exception;
	
	public Plan readPlan(int planNum) throws Exception;
	public List<Plan> readStation(Map<String, Object> map) throws Exception;
	public int stationCount(int planNum) throws Exception;
	public List<Plan> readDetailPlan(Map<String, Object> map) throws Exception;
	
	public int calPrice(Map<String, Object> map) throws Exception;
	
	//플랜 북마크
	public void likeFriendPlan(Map<String, Object> map) throws Exception;
	public void disLikePlan(Map<String, Object> map) throws Exception;
	public int checkLike(Map<String, Object> map) throws Exception;
	
	public List<Plan> listBookmark(Map<String, Object> map) throws Exception;
	public int bookmarkCount(Map<String, Object> map) throws Exception;
	


}
