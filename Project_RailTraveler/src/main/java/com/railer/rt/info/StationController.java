package com.railer.rt.info;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("info.stationController")
public class StationController {
	@RequestMapping(value="/station/info")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.info.station.info";
	}
	
	@RequestMapping(value="/station/info2")
	public ModelAndView history() throws Exception {
		ModelAndView mav=new ModelAndView(".four.info.station.info");
		mav.addObject("subMenu", "2");
		return mav;
	}
}
