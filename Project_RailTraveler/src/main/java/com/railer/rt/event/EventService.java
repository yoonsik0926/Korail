package com.railer.rt.event;

import java.util.List;
import java.util.Map;

public interface EventService {
	public void insertEvent(Event dto) throws Exception;
	public void updateEvent(Event dto) throws Exception;
	public void deleteEvent(int num) throws Exception;
	public Event readEvent(int num);
	public List<Event> listEvent(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
} 
