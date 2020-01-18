package com.railer.rt.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.railer.rt.plan.Plan;
import com.railer.rt.plan.PlanService;

@Controller("mainController")
public class MainController {
	@Autowired
	private PlanService planService;
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String method(Model model) {
		
		List<Plan> planList = null;
		try {
			planList = planService.mainListPlan();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Plan> fplanList = null;
		try {
			fplanList = planService.mainFriendPlanList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("planList",planList);
		model.addAttribute("fplanList",fplanList);
		return ".mainLayout";
	}
}
