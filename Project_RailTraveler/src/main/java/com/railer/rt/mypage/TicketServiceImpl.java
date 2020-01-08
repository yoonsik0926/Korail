package com.railer.rt.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;

@Service("mypage.ticketService")
public class TicketServiceImpl implements TicketService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Ticket> listTicket(Map<String, Object> map) throws Exception {
		List<Ticket> list = null;
		try {
			list = dao.selectList("mypage.myTicketList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) throws Exception {
		int dataCount = 0;
		try {
			dataCount = dao.selectOne("mypage.ticketDataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dataCount;
	}

	@Override
	public List<Ticket> listStamp(Map<String, Object> map) throws Exception {
		List<Ticket> listStamp = null;
		try {
			listStamp = dao.selectList("mypage.stampList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listStamp;
	}

	@Override
	public int stampDataCount(Map<String, Object> map) throws Exception {
		int dataCount = 0;
		try {
			dataCount = dao.selectOne("mypage.stampDataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dataCount;
	}
	
}
