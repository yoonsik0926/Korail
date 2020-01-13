package com.railer.rt.plan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
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
	public List<Tour> listCategory() {
		List<Tour> list=null;
		
		try {
			list=dao.selectList("plan.listCategory");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public void insertPlan(Map<String, Object> map) throws Exception {
		
		try {
			// insertPlan 추가
			int planSeq=dao.selectOne("plan.planSeq");

			String days=(String)map.get("days");
			String userId=(String)map.get("userId");
			String sDate=(String)map.get("sDate");

			// 뷰에서 넘어온 3차원 배열 -> 이놈의 길이가 일수
			JSONArray jarr=new JSONArray(days);
			
			Map<String, Object> paramMap=new HashMap<String, Object>();
			paramMap.put("planNum", planSeq);
			paramMap.put("ticketDay", jarr.length());
			paramMap.put("sDate", sDate);
			paramMap.put("userId", userId);
			
			dao.insertData("plan.insertPlan",paramMap);
			
			// 몇일차의 세부계획(역정보를 담고 있는 오브작트의 배열을 도는 for문) 즉
			for(int i=0; i< jarr.length(); i++) {
				JSONArray jarr2=new JSONArray(jarr.get(i).toString());
				if(jarr2.length()==0) continue; // 일차에 등록된 역 정보가 없을 경우 다음일차로 넘어감(그냥 진행)
				
				// 일차에 등록된 역정보가 있을 경우 디테일플랜에 저장하기 위해 시퀀스를 증가시켜서 가져온다.
				int detailPlanSeq=dao.selectOne("plan.detailPlanSeq");
				
				// 해당 역정보 객체
				JSONObject job=jarr2.getJSONObject(i);
				int staNum=job.getInt("staNum"); // 그 객체에서 뽑은 역번호
				int nthDay=i+1; // 그리고 몇일차인지
				
				paramMap=new HashMap<String, Object>();
				paramMap.put("detailPlanNum", detailPlanSeq); // 세부계획번호
				paramMap.put("planNum", planSeq); // 계획 번호
				paramMap.put("staNum", staNum); // 역 번호
				paramMap.put("nthDay", nthDay); // 일차
				
				dao.insertData("plan.insertDetailPlan", paramMap);
				
				// 해당 역에 대한 세부계획
				JSONArray jarr3=new JSONArray(job.get("detailList").toString());
				for(int j=0; j<jarr3.length(); j++) {
					
					if(jarr3.length()==0) continue;
					
					JSONObject mdObject=jarr3.getJSONObject(j);
					
					paramMap=new HashMap<String, Object>();
					
					paramMap.put("detailPlanNum",detailPlanSeq);
					paramMap.put("cateNum", mdObject.get("cateNum"));
					paramMap.put("name", mdObject.get("name"));
					paramMap.put("tel", mdObject.get("tel"));
					paramMap.put("address", mdObject.get("address"));
					paramMap.put("longitude", mdObject.get("longitude"));
					paramMap.put("latitude", mdObject.get("latitude"));
					paramMap.put("memo", mdObject.get("memo"));
					paramMap.put("sTime", mdObject.get("sTime"));
					paramMap.put("eTime", mdObject.get("eTime"));
					paramMap.put("price", mdObject.get("price"));
						
					dao.insertData("plan.insertMoreDetailPlan", paramMap);
					
				}
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Tour> listDetailCate(Map<String, Object> map) {
		List<Tour> list=null;
		
		try {
			list=dao.selectList("plan.listDetailCategory",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int placeDataCount(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.selectOne("plan.placeDataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Tour> listTour(Map<String, Object> map) {
		List<Tour> list=null;
		
		try {
			list=dao.selectList("plan.listTour",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
