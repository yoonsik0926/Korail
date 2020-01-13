package com.railer.rt.plan;

import java.util.List;
import java.util.Map;

public interface PlanService {
	public List<Station> listStation(Map<String, Object> map); // 맵에서 검색한 역 리스트(마커로 뿌려줌)
	public int dataCount(Map<String, Object> map); // 역 개수
	public List<Tour> listCategory(); // 대분류
	public List<Tour> listDetailCate(Map<String, Object> map); // 소분류
	public void insertPlan(Map<String, Object> map) throws Exception; // 세부계획 DB저장
	public int placeDataCount(Map<String, Object> map); // 장소 개수
	public List<Tour> listTour(Map<String, Object> map); // 장소 리스트(세부계획 모달 검색창에서 뿌려줌)
}
