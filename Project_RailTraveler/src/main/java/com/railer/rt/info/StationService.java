package com.railer.rt.info;

import java.util.List;
import java.util.Map;

public interface StationService {
	public List<Station> listLocation();
	public List<Station> listTourCate();
	public List<Station> listStation(Map<String, Object> map);
	public Station readStation(int staNum);
	public int dataCount(Map<String, Object> map);
	public int countBenefit(int staNum);
	public void insertStation(Station dto, String pathname) throws Exception;
	public void updateStation(Station dto, String pathname) throws Exception;
	public void deleteStation(int staNum, String pathname) throws Exception;
	
	public void deleteBenefit(Map<String, Object> map) throws Exception;
	public void insertBenefit(Station dto) throws Exception;
	public void updateBenefit(Station dto) throws Exception;
	public List<Station> listBenefit(int staNum);
	public Station readBenefit(int beneNum);
	
}
