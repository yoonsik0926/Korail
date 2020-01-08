package com.railer.rt.mypage;

import java.util.List;
import java.util.Map;

import com.railer.rt.info.Station;

public interface StampService {
	public List<Stamp> listStamp(Map<String, Object> map) throws Exception;
	public Stamp readStamp(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Station> listStation() throws Exception;
	public List<Stamp> listSale(Map<String, Object> map) throws Exception;
	
	public void insertStamp(Map<String, Object> map) throws Exception;
}
