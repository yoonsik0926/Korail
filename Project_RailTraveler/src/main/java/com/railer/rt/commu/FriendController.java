package com.railer.rt.commu;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("commu.friendController")
public class FriendController {
	@RequestMapping(value="/friend/friend")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "3");
		return ".four.commu.friend.friend";
	}

}
