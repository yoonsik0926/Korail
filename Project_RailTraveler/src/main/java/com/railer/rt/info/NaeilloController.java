package com.railer.rt.info;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("info.naeilloController")
public class NaeilloController {
	@RequestMapping(value="/naeillo/info")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "0");
		return ".four.info.naeillo.info";
	}
	
	@RequestMapping(value="/naeillo/info2")
	public ModelAndView history() throws Exception {
		ModelAndView mav=new ModelAndView(".four.info.naeillo.info");
		mav.addObject("subMenu", "2");
		return mav;
	}
}
