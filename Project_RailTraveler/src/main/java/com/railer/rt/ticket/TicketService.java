package com.railer.rt.ticket;

import java.util.List;


public interface TicketService {
	public List<Ticket> listticket();
	public Ticket selectedticket(int ticketNum);
}
