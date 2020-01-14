package com.railer.rt.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public void insertEvent(Event dto, String pathname) throws Exception;
	public void updateEvent(Event dto, String pathname) throws Exception;
	public void deleteEvent(int num) throws Exception;
	public Event readEvent(int num);
	public void updateHitCount(int num) throws Exception;
	public Event preReadEvent(Map<String, Object> map);
	public Event nextReadEvent(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public void insertEventLike(Map<String, Object> map) throws Exception;
	public int eventLikeCount(int num);
	public List<Event> rankEvent(Map<String, Object> map);
	
	public void insertReply(Reply dto) throws Exception;
	public List<Reply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	public List<Reply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);
	
	
	
} 
