package com.railer.rt.event;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.FileManager;
import com.railer.rt.common.dao.CommonDAO;

@Service("Event.EventService")
public class EventServiceImpl implements EventService {
	
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertEvent(Event dto, String pathname) throws Exception {
		try {
			String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename!=null) {
				dto.setImageFilename(saveFilename);

				dao.insertData("event.insertevent", dto);
			} 
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void updateEvent(Event dto, String pathname) throws Exception {
		try {
			// 업로드한 파일이 존재한 경우
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
		
			if (saveFilename != null) {
				// 이전 파일 지우기
				if(dto.getImageFilename().length()!=0) {
					fileManager.doFileDelete(dto.getImageFilename(), pathname);
				}
					
				dto.setImageFilename(saveFilename);
			}
			
			dao.updateData("event.updateevent", dto);
		} catch (Exception e) {
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

	@Override
	public Event readEvent(int num) {
		Event dto=null;
		
		try {
			dto=dao.selectOne("event.readevent", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Event preReadEvent(Map<String, Object> map) {
		Event dto=null;
		
		try{
			dto=dao.selectOne("event.preReadevent", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Event nextReadEvent(Map<String, Object> map) {
		Event dto=null;
		
		try{
			dto=dao.selectOne("event.nextReadevent", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		try{
			// 조회수 증가
			dao.updateData("event.updateHitCount", num);
			
		} catch(Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
