package com.railer.rt.ticket;

import java.util.List;
import java.util.Map;


public interface TicketService {
	public List<Ticket> listticket();
	public Ticket selectedticket(int ticketNum);
	public Ticket readMember(String userId);
	public void insertTicket(Sale dto);
	public void insertpay(Sale dto);
	public int readSaleNum(String merchant_uid);
	public Ticket readPurchasedinfo(int saleNum);
	public List<Revenue> RevenueManagement(Map<String, Object> map);
	public int saleCount(Map<String,Object> map);
	public List<Ticket> saleList(Map<String,Object> map);
	
}
