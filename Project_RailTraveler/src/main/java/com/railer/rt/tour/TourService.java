package com.railer.rt.tour;

import java.util.List;
import java.util.Map;


public interface TourService {
	public List<Tour> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public List<Tour> tourCategoryList();
}
