package com.railer.rt.ticket;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		
		//로그인된 유저에 대한 정보를 가져온다.
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
	public String submit(Model model, Ticket dto,HttpSession session) throws Exception {
		//ticketNum 자동으로 넘어옴

		//로그인 한 사람에 대한 정보를 가져온다.
		SessionInfo info = (SessionInfo)session.getAttribute("member");					
		int userNum =info.getUserNum();
		dto.setUserNum(userNum);

		//전화번호 합치기
		dto.setTel(dto.getTel1()+dto.getTel2()+dto.getTel3());
		dto.settName(dto.gettName());
		dto.setEmail(dto.getEmail());
	
		model.addAttribute("dto", dto);
		
		return ".ticket.paycontrol";
	}

	
	@RequestMapping(value="/ticket/complete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> payComplete( Sale dto, HttpSession session) throws Exception {
		

		boolean check = true;
		String checkmsg ="";
	
		try {
			//실제 구매 테이블에 저장한다.
			service.insertTicket(dto);	
			
			//결제(pay) 테이블에 저장
			service.insertpay(dto);
			
		} catch (Exception e) {
			
			check = false;
			checkmsg = "시스템 문제로 결제가 취소되었습니다.";
			e.printStackTrace();
		}
		

		
		//추가된 구매 번호를 가져옴
		Map<String, Object> map=new HashMap<>();
		map.put("check", check);
		map.put("checkmsg", checkmsg);

		
	
		return map;
		

	}
	
	

	@RequestMapping(value="/ticket/paydone")
	public String paydone(Model model, 
			@RequestParam String merchant_uid
			) throws Exception {
		Ticket dto = null;
		
		System.out.println(merchant_uid);
		//구매번호를 가져온다.
		int saleNum = service.readSaleNum(merchant_uid);	
		
		//그 구매번호로 정보를 얻어온다.
		dto = service.readPurchasedinfo(saleNum);

		
		model.addAttribute("dto", dto);

		return ".ticket.paydone";
	}
	
}
