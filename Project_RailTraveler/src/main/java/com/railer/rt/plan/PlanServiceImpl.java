package com.railer.rt.plan;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;

@Service("plan.planService")
public class PlanServiceImpl implements PlanService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Station> listStation(Map<String, Object> map) {
		List<Station> list=null;
		
		try {
			list=dao.selectList("plan.listStation",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("plan.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Tour> listCategory(Map<String, Object> map) {
		List<Tour> list=null;
		
		try {
			list=dao.selectList("plan.listCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public void insertPlan(Map<String, Object> map) throws Exception {
		
		try {
			Plan dto=new Plan();
			
			int planSeq=dao.selectOne("plan.planSeq");
			dto.setPlanNum(planSeq);
			
			dao.insertData("plan.insertTicketDay",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertDetailPlan(Map<String, Object> map) throws Exception {
		
		try {
			Plan dto=new Plan();
			
			int detailPlanSeq=dao.selectOne("plan.detailPlanSeq", map);
			dto.setDetailPlanNum(detailPlanSeq);
			
			dao.insertData("plan.insertPlans",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public void insertMoreDetailPlan(Map<String, Object> map) throws Exception {

		try {
			
			dao.insertData("plan.insertDetailPlan",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
