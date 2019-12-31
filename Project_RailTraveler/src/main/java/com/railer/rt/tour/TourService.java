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
	public Tour readDetailTour(int tourNum);
	public List<Tour> myBookMark(Map<String, Object> map);
	public int myBookMarkCount(Map<String, Object> map);
	public void insertReply(TourReply dto);
	public int replyCount(int tourNum);
	public List<TourReply> replylist(Map<String, Object> map);
	public int replyAnswerCount(int replyNum);
	public List<TourReply> replyAnswerList(int answer);
	public void deleteReply(Map<String, Object> map);
	

	
	
	
}
