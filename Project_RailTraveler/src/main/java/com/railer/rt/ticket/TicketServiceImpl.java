package com.railer.rt.ticket;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;
@Service("ticket.ticketService")
public class TicketServiceImpl implements TicketService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Ticket> listticket() {
		List<Ticket> list = null;
		try {
			list = dao.selectList("ticket.ticketList");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Ticket selectedticket(int ticketNum) {
		Ticket dto =null;
		try {
			dto = dao.selectOne("ticket.selectedTicket", ticketNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Ticket readMember(String userId) {
		Ticket dto = null;
		
		try {
			dto = dao.selectOne("ticket.readMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertTicket(Sale dto) {
		try {
			dao.insertData("ticket.insertBuyTicket", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void insertpay(Sale dto) {
		try {
			dao.insertData("ticket.insertpay", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Ticket readPurchasedinfo(int saleNum) {
			Ticket dto = null;
		
		try {
			dto = dao.selectOne("ticket.readPurchasedinfo", saleNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int readSaleNum(String merchant_uid) {
		int result=-1;
		
		try {
			result = dao.selectOne("ticket.readsaleNum", merchant_uid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
 
	

}
