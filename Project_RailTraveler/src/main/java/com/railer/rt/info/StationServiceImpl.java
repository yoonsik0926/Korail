package com.railer.rt.info;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;

@Service("station.stationService")
public class StationServiceImpl implements StationService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Station> listLocation() {
		List<Station> locList = null;
		try {
			locList = dao.selectList("station.listLocation");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return locList;
	}

	@Override
	public List<Station> listStation(Map<String, Object> map) {
		List<Station> staList = null;
		try {
			staList = dao.selectList("station.listStation",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return staList;
	}

	@Override
	public Station readStation(int staNum) {
		Station dto = null;
		try {
			dto = dao.selectOne("station.readStation",staNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<Station> listBenefit(int staNum) {
		List<Station> beneList = null;
		try {
			beneList = dao.selectList("station.listBenefit",staNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return beneList;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int dataCount = 0;
		try {
			dataCount = dao.selectOne("station.dataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount;
	}

}
