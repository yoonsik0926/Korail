package com.railer.rt.commu;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("commu.friendController")
public class FriendController {
	@RequestMapping(value="/friend/friend")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "3");
		return ".four.commu.friend.friend";
	}
	@RequestMapping(value="/friend/created")
	public String createdForm(Model model) throws Exception {
		model.addAttribute("subMenu", "3");
		model.addAttribute("mode", "created");
		return ".four.commu.friend.created";
	}
	@RequestMapping(value="/friend/article")
	public String article(Model model) throws Exception { 
		model.addAttribute("subMenu", "3");
		
		return ".four.commu.friend.article";
	}
}
