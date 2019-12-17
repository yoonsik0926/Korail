package com.railer.rt.event;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("event.eventController")
public class EventController {
	@RequestMapping(value="/event/current")
	public String current(Model model) throws Exception {
		model.addAttribute("subMenu", "0");
		model.addAttribute("title", "진행중인 이벤트");
		return ".four.event.current.list";
	}

	@RequestMapping(value="/event/last")
	public String last(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "지난 이벤트");
		return ".four.event.last.list";
	}
}
