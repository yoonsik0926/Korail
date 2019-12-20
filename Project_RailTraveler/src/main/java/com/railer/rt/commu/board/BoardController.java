package com.railer.rt.commu.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("commu.board.boardController")
public class BoardController {
	@RequestMapping(value="/board/board")
	public String info(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		return ".four.commu.board.board";
	}
	@RequestMapping(value="/board/created")
	public String createdForm(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		model.addAttribute("mode", "created");
		return ".four.commu.board.created";
	}
	@RequestMapping(value="/board/article")
	public String article(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		
		return ".four.commu.board.article";
	}
}
