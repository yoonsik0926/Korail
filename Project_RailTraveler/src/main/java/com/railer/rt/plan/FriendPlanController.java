package com.railer.rt.plan;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.railer.rt.common.MyUtil;

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
		String articleUrl = "";
		
		if(keyword.length()!=0) {
			query = "&condition="+condition+"&keyword="+keyword;
		}
		
		if(query.length()!=0) {
			articleUrl = cp +"/plan/friendPlan/detail?page="+current_page+query;
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
	public String detail(Model model) throws Exception {
		
		
		
		
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "친구의 여행 플랜");
		
		return ".four.plan.friendPlan.detail";
	}
	
}
