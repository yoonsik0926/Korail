package com.railer.rt.singo;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.railer.rt.common.MyUtil;
import com.railer.rt.member.SessionInfo;

@Controller("singo.singoController")
public class SingoController {
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private SingoService service;
	
	
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
	
	
	//신고 테이블 추가
	@RequestMapping(value="/singo/insertSingo")
	@ResponseBody
	public Map<String, Object> insertSingo(
			@RequestParam int targetNo,
			@RequestParam String content,
			@RequestParam String targetUrl,
			HttpSession session
			) {

			
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
			
			String targetUserId = service.findTargetId(targetNo);
		
		try {
			Singo dto = new Singo();
			
			dto.setTargetNo(targetNo);
			dto.setTargetType(1);
			dto.setTargetTitle("tour");
			dto.setUserId(info.getUserId());
			dto.setTargetUserId(targetUserId);
			dto.setTargetUrl(targetUrl);
			dto.setContent(content);	

			service.insertSingo(dto);
			
			
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
}
