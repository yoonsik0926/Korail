package com.railer.rt.plan;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("plan.planController")
public class PlanController {
	@RequestMapping(value="/plan/write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("subMenu", "0");
		model.addAttribute("title", "나의 여행 계획");
		return "/plan/plan/write";
	}

	@RequestMapping(value="/plan/planlist")
	public String planlist(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "친구의 여행 플랜");
		return ".four.plan.plan.list";
	}
	
	@RequestMapping(value="/plan/recommand")
	public String recommand(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		model.addAttribute("title", "추천 코스");
		return ".four.plan.plan.list";
	}
}
