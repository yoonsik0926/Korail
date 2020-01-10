package com.railer.rt.singo;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;

@Service("singo.SingoService")
public class SingoServiceImpl implements SingoService {

	
	@Autowired
	private CommonDAO dao;

	
	@Override
	public void insertSingo(Singo dto) {
		try {
			dao.insertData("singo.insertSingo", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Singo> singoList(Map<String, Object> map) {
		List<Singo> list =null;
		
		try {
			list =dao.selectList("singo.singoList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public Singo findTargetReply(int targetNo) {
		Singo dto =null;
		try {
			dto = dao.selectOne("singo.findTargetId", targetNo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result =0;
		
		try {
			result = dao.selectOne("singo.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<SingoManagment> singoCountList(Map<String, Object> map) {
		 List<SingoManagment> list = null;
		
		try {
			list =dao.selectList("singo.singoCountList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}

	@Override
	public int singoListCount(Map<String, Object> map) {
				int result =0;
		
		try {
			result = dao.selectOne("singo.singoCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void restrictId(String targetUserId) {
		
		try {
			dao.updateData("singo.restrictUserId", targetUserId);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

	
}
