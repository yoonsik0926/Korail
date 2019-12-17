package com.railer.rt.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("mypage.mypageController")
public class MypageController {
	
	@RequestMapping(value="/bookmark/tour")
	public String bookmarkTour(
			Model model) {
		
		model.addAttribute("subMenu", "2");
		model.addAttribute("subItems", "0");
		return ".four.mypage.bookmark.tour";
	}
	
	@RequestMapping(value="/bookmark/recommend")
	public String bookmarkRecommend(
			Model model) {
		
		model.addAttribute("subMenu", "3");
		model.addAttribute("subItems", "1");
		return ".four.mypage.bookmark.recommend";
	}
	
	@RequestMapping(value="/bookmark/commu")
	public String bookmarkCommu(
			Model model) {
		
		model.addAttribute("subMenu", "4");
		model.addAttribute("subItems", "2");
		
		return ".four.mypage.bookmark.commu";
	}



	@RequestMapping(value="/ticket/ticket")
	public String myTicket(
			Model model) {
		
		model.addAttribute("subMenu", "5");

		return ".four.mypage.ticket.ticket";
	}
	
	@RequestMapping(value="/stamp/stamp")
	public String stamp(
			Model model) {
		
		model.addAttribute("subMenu", "6");

		return ".four.mypage.stamp.stamp";
	}

	@RequestMapping(value="/plan/plan")
	public String myPlan(
			Model model) {
		
		model.addAttribute("subMenu", "7");

		return ".four.mypage.plan.plan";
	}
	
	@RequestMapping(value="/bbs/mybbs")
	public String myBbs(
			Model model) {
		
		model.addAttribute("subMenu", "8");

		return ".four.mypage.bbs.mybbs";
	}
	
}
