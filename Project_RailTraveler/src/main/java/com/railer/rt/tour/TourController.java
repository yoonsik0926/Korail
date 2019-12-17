package com.railer.rt.tour;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("tour.tourController")
public class TourController {
	@RequestMapping(value="/tour/sudo")
	public String tour1(Model model) throws Exception {
		model.addAttribute("subMenu", "0");
		model.addAttribute("title", "수도권");
		return ".four.tour.tour.list";
	}
	@RequestMapping(value="/tour/gangwon")
	public String tour2(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "강원권");
		return ".four.tour.tour.list";
	}
	@RequestMapping(value="/tour/chungcheong")
	public String tour3(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		model.addAttribute("title", "충청권");
		return ".four.tour.tour.list";
	}
	@RequestMapping(value="/tour/jeonla")
	public String tour4(Model model) throws Exception {
		model.addAttribute("subMenu", "3");
		model.addAttribute("title", "전라권");
		return ".four.tour.tour.list";
	}
	@RequestMapping(value="/tour/gyeongsang")
	public String tour5(Model model) throws Exception {
		model.addAttribute("subMenu", "4");
		model.addAttribute("title", "경상권");
		return ".four.tour.tour.list";
	}
	
	
	@RequestMapping(value="/tour/detail")
	public String detail(Model model) throws Exception {
		
		
		return ".four.tour.tour.detail";
	}
	
}
