package com.railer.rt.plan;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.railer.rt.common.MyUtil;
import com.railer.rt.member.SessionInfo;

@Controller("plan.friendPlanController")
public class FriendPlanController {
	@Autowired
	private FriendPlanServiceImpl fPlanService;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/friendPlan/planlist")
	public String friendPlan(Model  model) {
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "친구의 여행 플랜");
		
		return ".four.plan.friendPlan.planlist";
	}
	
	
	@RequestMapping(value="/friendPlan/list")
	public String planlist(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "condition", defaultValue = "all") String condition,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			HttpServletRequest req, 
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		int rows = 8;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		dataCount = fPlanService.dataCount(map);
		
		
		if (dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * rows;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Plan> list = fPlanService.listPlan(map);
				
		String query = "";
		String articleUrl = cp +"/friendPlan/detail?";
		
		if(keyword.length()!=0) {
			query = "condition="+condition+"&keyword="+keyword+"&";
		}
		
		if(query.length()!=0) {
			articleUrl += query;
		}
		
		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listFriendPlanPage");
		
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("page",current_page);
		model.addAttribute("query",query);
		model.addAttribute("condition",condition);
		model.addAttribute("keyword",keyword);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("paging",paging);
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "친구의 여행 플랜");
		
		return "/plan/friendPlan/list";
	}
	
	
	@RequestMapping(value="/friendPlan/detail")
	public String detail(
			@RequestParam int planNum,
			@RequestParam String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		String listUrl = cp + "/friendPlan/planlist?"+query;
		
		//여행 시작 날짜, 종료 날짜, 티켓 일수 ,userId, title
		Plan dto = fPlanService.readPlan(planNum);
		if(dto == null)
			return "redirect:/friendPlan/planlist";

		Map<String, Object> map = new HashMap<>();
		map.put("planNum", planNum);
		
		//역 이름, 시작 날짜, 종료 날짜, 경도, 위도, 일 수 (nthDay)
		List<Plan> stationList = fPlanService.readStation(map);
		
		
		
		//가격 구하기
		map.put("cateName", "명소");
		int tourPrice = fPlanService.calPrice(map);
		//세부 일정
		List<Plan> tourList = fPlanService.readDetailPlan(map);
		
		map.put("cateName", "맛집");
		int foodPrice = fPlanService.calPrice(map);
		//세부 일정
		List<Plan> foodList = fPlanService.readDetailPlan(map);
		
		map.put("cateName", "숙소");
		int hotelPrice = fPlanService.calPrice(map);
		//세부 일정
		List<Plan> hotelList = fPlanService.readDetailPlan(map);
		
		//전체 금액
		int totPrice = tourPrice + foodPrice + hotelPrice;

	
		//역 개수
		int stationCount = fPlanService.stationCount(planNum);
		int length = 173 + (182*(stationCount-2));
		
		model.addAttribute("dto",dto);
		model.addAttribute("stationList",stationList);
		model.addAttribute("tourList",tourList);
		model.addAttribute("foodList",foodList);
		model.addAttribute("hotelList",hotelList);

		model.addAttribute("listUrl",listUrl);
		model.addAttribute("tourPrice",tourPrice);
		model.addAttribute("foodPrice",foodPrice);
		model.addAttribute("hotelPrice",hotelPrice);
		model.addAttribute("totPrice",totPrice);
		model.addAttribute("length",length);
		model.addAttribute("stationCount",stationCount);
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "친구의 여행 플랜");
		
		return ".four.plan.friendPlan.detail";
	}
	
	
	@RequestMapping(value="/friendPlan/like")
	@ResponseBody
	public Map<String, Object> likePlan(
			@RequestParam int planNum,
			HttpSession session) throws Exception{
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("planNum", planNum);
		map.put("userId", info.getUserId());
		

		//좋아요를 했는지(1) 안했는지(0) 알기 위한 여부 체크 
		int likecheck = fPlanService.checkLike(map);
				
		if(likecheck==0) {
			fPlanService.likeFriendPlan(map);;			
		}else{
			fPlanService.disLikePlan(map);;
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("likecheck", likecheck);	
		
		return model;
	}
	
}
