package com.railer.rt.singo;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("singo.singoController")
public class SingoController {
	@RequestMapping(value="/singo/plan")
	public String plan(Model model) throws Exception {
		model.addAttribute("subMenu", "0");
		model.addAttribute("title", "플래너");
		return ".four.singo.plan.plan";
	}
	@RequestMapping(value="/singo/qna")
	public String qna(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "묻고 답하기");
		return ".four.singo.qna.qna";
	}
	@RequestMapping(value="/singo/board")
	public String board(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		model.addAttribute("title", "자유게시판");
		return ".four.singo.board.board";
	}
	@RequestMapping(value="/singo/friend")
	public String friend(Model model) throws Exception {
		model.addAttribute("subMenu", "3");
		model.addAttribute("title", "동행 구하기");
		return ".four.singo.friend.friend";
	}
}
