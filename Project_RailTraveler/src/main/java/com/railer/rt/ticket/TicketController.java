package com.railer.rt.ticket;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("ticket.ticketController")
public class TicketController {
	
	@RequestMapping(value="/ticket/pay")
	public String writeForm(Model model) throws Exception {
	
		return ".ticket.ticket";
	}
	
	@RequestMapping(value="/ticket/purchaseticket")
	public String submit(Model model, Ticket dto) throws Exception {
		
		//전화번호 합치기
		dto.setTel(dto.getTel1()+dto.getTel2()+dto.getTel3());
		
		model.addAttribute("dto", dto);
		
		return ".four.tour.tour.paycontrol";
	}
	
}
