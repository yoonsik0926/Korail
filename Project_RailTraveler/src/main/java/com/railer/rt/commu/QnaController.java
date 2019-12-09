package com.railer.rt.commu;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("commu.qnaController")
public class QnaController {
	@RequestMapping(value="/qna/qna")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		return ".four.commu.qna.qna";
	}

}
