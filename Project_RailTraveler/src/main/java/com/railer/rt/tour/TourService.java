package com.railer.rt.tour;

import java.util.List;
import java.util.Map;


public interface TourService {
	public List<Tour> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public List<Tour> tourCategoryList();
	public List<Tour> localStation(int locNum);
	public List<Tour> detailTourCategory(Map<String, Object> map);
	public List<Tour> detailTourList(Map<String, Object> map);
	public void likeTour(Map<String, Object> map);
	public void disLikeTour(Map<String, Object> map);
	public int likeCheck (Map<String, Object> map);
	public List<Tour> initLikeMark(Map<String, Object> map);
	public List<Tour> hitContentList(Map<String, Object> map);

}
