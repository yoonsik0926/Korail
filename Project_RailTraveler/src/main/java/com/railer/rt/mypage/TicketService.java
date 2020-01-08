package com.railer.rt.mypage;

import java.util.List;
import java.util.Map;

public interface TicketService {
	public List<Ticket> listTicket(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
	
	public List<Ticket> listStamp(Map<String, Object> map) throws Exception;
	public int stampDataCount(Map<String, Object> map) throws Exception;
}
