package com.railer.rt.info;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("info.stationController")
public class StationController {
	@RequestMapping(value="/station/info")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.info.station.info";
	}
	

	@RequestMapping(value="/station/created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception {
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("mode","created");
		
		
		return ".four.info.station.created";
	}
	
	public String createdSubmit() {
		
		return "redirect:/station/info";
	}
	
	@RequestMapping(value="/station/update", method=RequestMethod.GET)
	public String updateForm(
			Model model) throws Exception {
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("mode", "update");

		
		return ".four.info.station.created";
	}
}
