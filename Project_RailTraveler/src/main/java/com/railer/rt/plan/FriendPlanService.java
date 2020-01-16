package com.railer.rt.plan;

import java.util.List;
import java.util.Map;

public interface FriendPlanService {
	public List<Plan> listPlan(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	
	public Plan readPlan(int planNum) throws Exception;
	public List<Plan> readStation(Map<String, Object> map) throws Exception;
	public int stationCount(int planNum) throws Exception;
	public List<Plan> readDetailPlan(Map<String, Object> map) throws Exception;
	
	public int calPrice(Map<String, Object> map) throws Exception;
	
	public void likeFriendPlan(Map<String, Object> map) throws Exception;
	public void disLikePlan(Map<String, Object> map) throws Exception;
	public int checkLike(Map<String, Object> map) throws Exception;
}
