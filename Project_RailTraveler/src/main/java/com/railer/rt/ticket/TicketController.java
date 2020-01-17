package com.railer.rt.ticket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.railer.rt.common.MyUtil;
import com.railer.rt.member.SessionInfo;

@Controller("ticket.ticketController")
public class TicketController {
	
	@Autowired
	private TicketService service;
	
	@Autowired
	private MyUtil myUtil;

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
		
		if(info.getUserId().equals("admin")) {
			dto.setTel("000-0000-0000");
		}
		
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

	
		try {
			//실제 구매 테이블에 저장한다.
			service.insertTicket(dto);	
			
			//결제(pay) 테이블에 저장
			service.insertpay(dto);
			
		} catch (Exception e) {
			
			check = false;
			e.printStackTrace();
		}
		 
		//구매번호를 가져온다.
		int saleNum = service.readSaleNum(dto.getMerchant_uid());	
		
		
		Map<String, Object> map=new HashMap<>();
		map.put("check", check);
		map.put("saleNum", saleNum);
		
	
		return map;
		

	}
	
	@RequestMapping(value="/ticket/payfail")
	public String payFail(Model model, 
			@RequestParam String saleNum
			) throws Exception {
		//디비로 들어가서 sale 이랑 pay 테이블 삭제하는거
		
		//결제된거 환불..
		
		
		String msg ="시스템 오류로 결제가 취소되었습니다. 다시 시도해주세요";
		

		return ".ticket.payFail";
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
		dto.setMerchant_uid(merchant_uid);
		
		//디비에 추가한다.
		
		model.addAttribute("dto", dto);

		return ".ticket.paydone";
	}
	
	//매출관리
	//관리	
		@RequestMapping(value="/ticket/sale", method=RequestMethod.GET)
		public String aaa(Model model,@RequestParam(defaultValue="all") String condition,
				@RequestParam(defaultValue="") String keyword,
				HttpServletRequest req) {
			
			
			//티켓별 매출을 가져와볼까?
			
			
			
			
			model.addAttribute("subMenu", 2);
			model.addAttribute("condition", condition);
			model.addAttribute("keyword", keyword);
			return ".four.ticket.ticket.sale";
		}
		
		@RequestMapping(value="/ticket/saleList")
		public String saleList(Model model,
				@RequestParam(defaultValue="all") String condition,
				@RequestParam(defaultValue="") String keyword,
				@RequestParam(value="pageNo", defaultValue="1") int current_page,
				HttpServletRequest req) {
			
			String cp = req.getContextPath();	

			
			Map<String,Object> map = new HashMap<>();
			map.put("condition", condition);
			map.put("keyword", keyword);
			
			
			int rows = 5;
			int total_page = 0;
			int dataCount = 0;
			
						
			//(데이터 구하기
			dataCount = service.saleCount(map);
		
			//페이징처리
			if (dataCount != 0)
				total_page = myUtil.pageCount(rows, dataCount);

			if (total_page < current_page)
				current_page = total_page;
			
			int offset = (current_page - 1) * rows;
			if (offset < 0)
				offset = 0;
			
			map.put("offset", offset);
			map.put("rows", rows);
			
			//유저 전체 목록 가져오기
			List<Ticket> saleList = service.saleList(map);
		
			//리스트 번호 재정의
	        int listNum, n = 0;
	        for(Ticket dto : saleList) {
	            listNum = dataCount - (offset + n);
	            dto.setListNum(listNum);
	            n++;
	        };
	        
			// AJAX 용 페이징
			String paging=myUtil.pagingMethod(current_page, total_page, "salelistPage");
			

			model.addAttribute("subMenu", 2);		
			model.addAttribute("paging", paging);
			model.addAttribute("saleList", saleList);
			model.addAttribute("dataCount", dataCount);		
			model.addAttribute("condition", condition);
			model.addAttribute("keyword", keyword);
								
			return "/ticket/ticket/ajaxsaleList";
		}
		
		
		
		@RequestMapping(value="/ticket/maingraph")
		@ResponseBody
		public Map<String, Object> line1() throws Exception{
			Map<String, Object> model = new HashMap<String, Object>();			
			List<Map<String, Object>> list = new ArrayList<>();
			
			
			Map<String, Object> map;
			map = new HashMap<>();
			
			//총매출 가져오기
			List<Revenue> revenue = service.RevenueManagement(map);
			map.put("name", "RT_2020년 총매출");
			map.put("data", new double[] {
					revenue.get(0).getSale(),
					revenue.get(1).getSale(),
					revenue.get(2).getSale(),
					revenue.get(3).getSale(),
					revenue.get(4).getSale(),
					revenue.get(5).getSale(),
					revenue.get(6).getSale(),
					revenue.get(7).getSale(),
					revenue.get(8).getSale(),
					revenue.get(9).getSale(),
					revenue.get(10).getSale(),
					revenue.get(11).getSale()});
			
			list.add(map);
			
			
			model.put("series", list);
			return model;
			
		}
	
	
	
	
}
