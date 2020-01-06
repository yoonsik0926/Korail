package com.railer.rt.mypage;

import java.util.List;
import java.util.Map;

import com.railer.rt.info.Station;

public interface StampService {
	public List<Stamp> listStamp(String userId) throws Exception;
	public Stamp readStamp(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	public List<Station> listStation() throws Exception;
}
