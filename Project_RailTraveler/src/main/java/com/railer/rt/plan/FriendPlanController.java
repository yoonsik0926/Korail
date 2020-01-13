package com.railer.rt.plan;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("plan.friendPlanController")
public class FriendPlanController {

	
	@RequestMapping(value="/friendPlan/planlist")
	public String planlist(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "친구의 여행 플랜");
		return ".four.plan.friendPlan.planlist";
	}
	
	
}
