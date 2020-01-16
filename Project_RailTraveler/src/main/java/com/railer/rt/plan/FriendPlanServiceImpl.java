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
	public Plan readPlan(int planNum) throws Exception {
		Plan dto = null;
		try {
			dto = dao.selectOne("fplan.readPlan",planNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Plan> readStation(Map<String, Object> map) throws Exception {
		List<Plan> list = null;
		try {
			list = dao.selectList("fplan.readStation",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public List<Plan> readDetailPlan(Map<String, Object> map) throws Exception {
		List<Plan> list = null;
		try {
			list = dao.selectList("fplan.readDetail",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public int calPrice(Map<String, Object> map) throws Exception {
		int price = 0;
		try {
			price = dao.selectOne("fplan.calPrice",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return price;
	}


	@Override
	public int stationCount(int planNum) throws Exception {
		int stationCount = 0;
		try {
			stationCount = dao.selectOne("fplan.stationCount",planNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return stationCount;
	}


	@Override
	public void likeFriendPlan(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("fplan.likePlan",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	@Override
	public void disLikePlan(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("fplan.disLikePlan",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


	@Override
	public int checkLike(Map<String, Object> map) throws Exception {
		int check = 0;
		try {
			check = dao.selectOne("fplan.checkLike",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return check;
	}


	

}
