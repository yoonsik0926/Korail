package com.railer.rt.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;

@Service("Event.EventService")
public class EventServiceImpl implements EventService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public void insertEvent(Event dto) throws Exception {
		
		try{
			dao.insertData("event.insertevent", dto);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		} 
	}
	
	@Override
	public void updateEvent(Event dto) throws Exception {
		try{
			dao.updateData("event.updateevent", dto);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
		
	@Override
	public void deleteEvent(int num) throws Exception {
		try{
			dao.deleteData("event.deleteevent", num);
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Event> listEvent(Map<String, Object> map) {
		List<Event> list=null;
		
		try{
			list=dao.selectList("event.listevent", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.selectOne("event.dataCount", map);			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	
	
}
