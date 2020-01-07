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
	
	
	@RequestMapping(value="/singo/singo")
	public String plan(Model model) throws Exception {
		model.addAttribute("subMenu", "0");
		model.addAttribute("title", "투어댓글");
		return ".singo.singo";
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
			
		Singo vo= service.findTargetReply(targetNo);
		
		try {
			Singo dto = new Singo();
			
			dto.setTargetNo(targetNo);
			dto.setTargetType(1);
			dto.setTargetTitle("tour");
			dto.setUserId(info.getUserId());
			dto.setTargetUserId(vo.getTargetUserId());
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
	
	
	
	@RequestMapping(value="/singo/readreply")
	@ResponseBody
	public Map<String, Object> readreply(
			@RequestParam int targetNo,
			HttpSession session
			) {
		
		String state="true";
		Singo dto = null;
		
		try {
			dto = service.findTargetReply(targetNo);
			
			if(dto ==null) {
				state = "false-empty";
			}
									
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("dto", dto);
		return model;
	}
	
}
