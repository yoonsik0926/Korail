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
	public int singoCount(String targetId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Singo> singoList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
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

	
}
