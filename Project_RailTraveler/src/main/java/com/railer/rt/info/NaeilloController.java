package com.railer.rt.info;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("info.naeilloController")
public class NaeilloController {
	@RequestMapping(value="/naeillo/info")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "0");
		return ".four.info.naeillo.info";
	}
	
}
