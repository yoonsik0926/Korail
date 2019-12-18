package com.railer.rt.ticket;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.railer.rt.member.SessionInfo;

@Controller("ticket.ticketController")
public class TicketController {
	
	@Autowired
	private TicketService service;
	
	
	@RequestMapping(value="/ticket/pay")
	public String writeForm(Model model,HttpSession session) throws Exception {
		
		List<Ticket> list = null;
		Ticket dto = null;
		
	
		//로그인 한 사람에 대한 정보를 가져온다.
		SessionInfo info = (SessionInfo)session.getAttribute("member");		
		
		//로그인을 하지 않은 상태면 로그인창으로 넘겨준다.
		if(info== null) {
			return "redirect:/member/login";
		}
		
		//티켓에 대한 정보를 가져온다.
		list = service.listticket();
		
		
		String userId =info.getUserId();		
		dto = service.readMember(userId);
		
		
		//전화번호를 나눠서 저장
		String[] tel = dto.getTel().split("-");
		dto.setTel1(tel[0]);
		dto.setTel2(tel[1]);
		dto.setTel3(tel[2]);
		
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
			
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
			@RequestParam String ticketNum		
			) throws Exception {
		Ticket dto = null;
		
		
		dto = service.selectedticket(Integer.parseInt(ticketNum));
		
		model.addAttribute("dto", dto);
		model.addAttribute("msg", msg);		
		return ".ticket.paydone";
	}
	
}
