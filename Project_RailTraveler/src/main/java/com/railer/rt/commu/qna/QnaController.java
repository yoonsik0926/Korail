package com.railer.rt.commu.qna;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("commu.qna.qnaController")
public class QnaController {
	@RequestMapping(value="/qna/qna")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.commu.qna.qna";
	}
	@RequestMapping(value="/qna/created")
	public String createdForm(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		model.addAttribute("mode", "created");
		return ".four.commu.qna.created";
	}
	@RequestMapping(value="/qna/article")
	public String article(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		
		return ".four.commu.qna.article";
	}
}
