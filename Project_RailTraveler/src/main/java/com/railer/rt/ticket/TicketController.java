package com.railer.rt.ticket;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("ticket.ticketController")
public class TicketController {
	
	@Autowired
	private TicketService service;
	
	
	@RequestMapping(value="/ticket/pay")
	public String writeForm(Model model) throws Exception {
		
		List<Ticket> list = new ArrayList<Ticket>();
		
		//티켓에 대한 정보를 가져온다.
		list = service.listticket();
		System.out.println(list.get(0).gettDays());
		
		model.addAttribute("list", list);
		
		return ".ticket.ticket";
	}
	
	@RequestMapping(value="/ticket/purchaseticket")
	public String submit(Model model, Ticket dto) throws Exception {

	
		//전화번호 합치기
		dto.setTel(dto.getTel1()+dto.getTel2()+dto.getTel3());
		dto.settName(dto.gettName());
		dto.setEmail(dto.getEmail());
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("ticketNum", dto.getTicketNum());
		return ".ticket.paycontrol";
	}
	

	
	@RequestMapping(value="/ticket/paydone")
	public String paydone(Model model, 
			@RequestParam String msg, 
			Ticket dto			
			) throws Exception {

		model.addAttribute("msg", msg);
		
		return ".ticket.paydone";
	}
	
}
