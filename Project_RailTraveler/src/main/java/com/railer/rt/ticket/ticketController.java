package com.railer.rt.ticket;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("ticket.ticketController")
public class ticketController {
	
	@RequestMapping(value="/ticket/pay")
	public String writeForm(Model model) throws Exception {
	
		return ".ticket.ticket";
	}
	
}
