package com.railer.rt.plan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.FileManager;
import com.railer.rt.common.dao.CommonDAO;

@Service("plan.planService")
public class PlanServiceImpl implements PlanService {
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
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
	public int insertPlan(Map<String, Object> map) throws Exception {
		
		int planSeq=0;
		try {
			// insertPlan 추가
			planSeq=dao.selectOne("plan.planSeq");
			String days=(String)map.get("days");
			String userId=(String)map.get("userId");
			String sDate=(String)map.get("sDate");
			String title=(String)map.get("title");
			String imageFileName=(String)map.get("imageFileName");

			// 뷰에서 넘어온 3차원 배열 -> 이놈의 길이가 일수
			JSONArray jarr=new JSONArray(days);
			
			Map<String, Object> paramMap=new HashMap<String, Object>();
			paramMap.put("planNum", planSeq);
			paramMap.put("ticketDay", jarr.length());
			paramMap.put("sDate", sDate);
			paramMap.put("userId", userId);
			paramMap.put("title", title);
			paramMap.put("imageFileName", imageFileName);
			
			dao.insertData("plan.insertPlan",paramMap);
			
			// 몇일차의 세부계획(역정보를 담고 있는 오브작트의 배열을 도는 for문) 즉
			for(int i=0; i< jarr.length(); i++) {
				JSONArray jarr2=new JSONArray(String.valueOf(jarr.get(i).toString()));
				if(jarr2.length()==0) continue; // 일차에 등록된 역 정보가 없을 경우 다음일차로 넘어감(그냥 진행)
				
				for(int j=0; j< jarr2.length(); j++) {
					// 일차에 등록된 역정보가 있을 경우 디테일플랜에 저장하기 위해 시퀀스를 증가시켜서 가져온다.
					int detailPlanSeq=dao.selectOne("plan.detailPlanSeq");
					
					// 해당 역정보 객체
					JSONObject job=jarr2.getJSONObject(j);
					int staNum=job.getInt("staNum"); // 그 객체에서 뽑은 역번호
					int nthDay=i+1; // 그리고 몇일차인지
					
					paramMap=new HashMap<String, Object>();
					paramMap.put("detailPlanNum", detailPlanSeq); // 세부계획번호
					paramMap.put("planNum", planSeq); // 계획 번호
					paramMap.put("staNum", staNum); // 역 번호
					paramMap.put("nthDay", nthDay); // 일차
					
					dao.insertData("plan.insertDetailPlan", paramMap);
				
					JSONArray jarr3=job.getJSONArray("detailList"); // 역정보 리스트에서 뽑은 세부계획 리스트
					// 해당 역에 대한 세부계획
					for(int k=0; k<jarr3.length(); k++) {
						
						JSONObject mdObject=jarr3.getJSONObject(k); // 역정보 리스트에서 뽑은 세부계획 리스트를 한개씩 떼어낸다.
						
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
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return planSeq;
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

	@Override
	public void updateImage(Plan dto, String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setImageFileName(saveFilename);

				dao.updateData("plan.updateImage", dto);
			} 
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
