package com.railer.rt.commu;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller("commu.boardController")
public class BoardController {
	@RequestMapping(value="/board/board")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		return ".four.commu.board.board";
	}

}
