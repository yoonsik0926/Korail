package com.railer.rt.plan;

import java.util.List;
import java.util.Map;

public interface FriendPlanService {
	public List<Plan> listPlan(Map<String, Object> map) throws Exception;
	public List<Plan> listStation(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	
	public Plan readPlan(Map<String, Object> map) throws Exception;
}
