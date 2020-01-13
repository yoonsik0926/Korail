package com.railer.rt.plan;

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
		List<Tour> listCategory=service.listCategory(); // 세부계획 모달창의 대분류 셀렉트 박스는 첫 로딩때 미리 설정해줌
		

		model.addAttribute("listCategory", listCategory);
        model.addAttribute("list", list);
		model.addAttribute("subMenu", "0");
		model.addAttribute("title", "나의 여행 계획");
		
		return "/plan/plan/write";
	}
	
	// 지도에서 원하는 역 검색
	@RequestMapping(value="/plan/searchStation")
	@ResponseBody
	public Map<String, Object> searchStation(@RequestParam int locNum,
											 @RequestParam String keyword) throws Exception {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("locNum", locNum);
		map.put("keyword", keyword);
		
		List<Station> list=service.listStation(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		
		return model;
	}
	
	// 소분류 카테고리 뿌리기
	@RequestMapping(value="/plan/listDetailTourCate", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listTourCate(@RequestParam int cateNum,
										    @RequestParam Map<String, Object> model) throws Exception {
		
		Map<String, Object> map=new HashMap<>();
		map.put("cateNum", cateNum);
		
		List<Tour> listDetailCate=service.listDetailCate(map);
		
		model.put("listDetailCate", listDetailCate);
		
		return model;
	}
	
	// 세부계획 DB에 추가 -> 가공은 서비스에서
	@RequestMapping(value="/plan/insertTicketDay", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> insertTicketDay(@RequestParam String days,
											   @RequestParam String sDate,
											   HttpSession session,
											   HttpServletRequest request) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("days",days);
		map.put("sDate",sDate);
		
		try {
			service.insertPlan(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	// 세부계획 모달에서 장소 검색
	@RequestMapping(value="/plan/searchPlace", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> searchPlace(@RequestParam int tourNum,
										   @RequestParam String tourKeyword) throws Exception {
		
		Map<String, Object> map=new HashMap<>();
		map.put("tourNum", tourNum);
		map.put("tourKeyword", tourKeyword);
		
		List<Tour> list=service.listTour(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("listTour", list);
		
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
