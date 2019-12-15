package com.railer.rt.commu;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("commu.noticeController")
public class NoticeController {
	@RequestMapping(value="/notice/notice")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "0");
		return ".four.commu.notice.notice";
	}
	@RequestMapping(value="/notice/created")
	public String createdForm(Model model) throws Exception {
		model.addAttribute("mode", "created");
		return ".four.commu.notice.created";
	}
}
