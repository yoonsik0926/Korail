package com.railer.rt.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.mypageController")
public class MypageController {
	
	@RequestMapping(value="/bookmark/bookmark")
	public String bookmark(
			Model model) {
		
		model.addAttribute("subMenu", "1");
		
		return ".four.mypage.bookmark.bookmark";
	}

	@RequestMapping(value="/ticket/ticket")
	public String myTicket(
			Model model) {
		
		model.addAttribute("subMenu", "2");
		
		return ".four.mypage.ticket.ticket";
	}
	
	@RequestMapping(value="/stamp/stamp")
	public String stamp(
			Model model) {
		
		model.addAttribute("subMenu", "3");
		
		return ".four.mypage.stamp.stamp";
	}

	@RequestMapping(value="/plan/plan")
	public String myPlan(
			Model model) {
		
		model.addAttribute("subMenu", "4");
		
		return ".four.mypage.plan.plan";
	}
	
	@RequestMapping(value="/bbs/mybbs")
	public String myBbs(
			Model model) {
		
		model.addAttribute("subMenu", "5");
		
		return ".four.mypage.bbs.mybbs";
	}
	
}
