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

	@Override
	public void insertEventLike(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("event.insertEventLike", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int eventLikeCount(int num) {
		int result=0;
		try {
			result=dao.selectOne("event.eventLikeCount", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Event> rankEvent(Map<String, Object> map) {
		List<Event> list = null;

		try {
			list = dao.selectList("event.rankEvent", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			dao.insertData("event.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list=null;
		try {
			list=dao.selectList("event.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("event.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("event.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		List<Reply> list=null;
		try {
			list=dao.selectList("event.listReplyAnswer", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyAnswerCount(int answer) {
		int result=0;
		try {
			result=dao.selectOne("event.replyAnswerCount", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public List<Event> listMainEvent(Map<String, Object> map) {
		List<Event> list=null;
		
		try{
			list=dao.selectList("event.listMainevent", map);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
}
