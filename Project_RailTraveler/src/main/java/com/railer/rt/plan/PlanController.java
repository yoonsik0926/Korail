package com.railer.rt.plan;

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

@Controller("plan.planController")
public class PlanController {
	
	@Autowired
	PlanServiceImpl service;
	
//	@Autowired
//	private MyUtil myUtil;
	
	// 첫 로딩시 모든 마커 출력
	@RequestMapping(value="/plan/write")
	public String writeForm(Model model) throws Exception {
		
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("locNum", 0);
        map.put("keyword", "");

		List<Station> list=service.listStation(map);
		

        model.addAttribute("list", list);
		model.addAttribute("subMenu", "0");
		model.addAttribute("title", "나의 여행 계획");
		
		return "/plan/plan/write";
	}
	
	// 지도에서 원하는 역 검색
	@RequestMapping(value="/plan/searchStation")
	@ResponseBody
	public Map<String, Object> searchStation(
								@RequestParam int locNum,
								@RequestParam String keyword) throws Exception {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("locNum", locNum);
		map.put("keyword", keyword);
		
		List<Station> list=service.listStation(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		
		return model;
	}
	
	// 카테고리 뿌리기
	@RequestMapping(value="/plan/listCategory")
	@ResponseBody
	public Map<String, Object> listCategory(@RequestParam int cateNum,
										   @RequestParam Map<String, Object> model) throws Exception {
		Map<String, Object> map=new HashMap<>();
		map.put("cateNum", cateNum);
		List<Tour> listCate=service.listCategory(map);
		
		model.put("listCategory", listCate);
		
		return model;
	}
	
	@RequestMapping(value="/plan/insertTicketDay", method=RequestMethod.POST)
	public Map<String, Object> insertTicketDay(Plan dto,
											   HttpSession session) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		int ticketDay=dto.getTicketDay();
		String sDate=dto.getsDate();
		
		try {
			dto.setUserId(info.getUserId());
			service.insertPlan(dto);
//			service.insertDetailPlan(dto);
//			service.insertMoreDetailPlan(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("ticketDay", ticketDay);
		model.put("sDate", sDate);
		return model;
	}
	
	@RequestMapping(value="/plan/planlist")
	public String planlist(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "친구의 여행 플랜");
		return ".four.plan.plan.planlist";
	}
	
	@RequestMapping(value="/plan/recommand") 
	public String recommand(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		model.addAttribute("title", "추천 코스");
		return ".four.plan.plan.list";
	}
}
