package com.railer.rt.plan;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;

@Service("plan.friendPlanService")
public class FriendPlanServiceImpl implements FriendPlanService{
	@Autowired
	private CommonDAO dao;
	
	
	@Override
	public List<Plan> listPlan(Map<String, Object> map) throws Exception {
		List<Plan> list = null;
		try {
			list = dao.selectList("fplan.listPlan",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int dataCount = 0;
		try {
			dataCount = dao.selectOne("fplan.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount;
	}


	@Override
	public List<Plan> listStation(Map<String, Object> map) throws Exception {
		List<Plan> station = null;
		try {
			station = dao.selectList("fplan.listStation",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return station;
	}


	@Override
	public Plan readPlan(Map<String, Object> map) throws Exception {
		Plan dto = null;
		try {
			dto = dao.selectOne("fplan.readPlan",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
