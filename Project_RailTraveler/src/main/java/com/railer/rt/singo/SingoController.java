package com.railer.rt.singo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
	public String singo(Model model,
			@RequestParam(defaultValue="tourreply") String targetTitle,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req
			) throws Exception {		

		
		String cp = req.getContextPath();		
		int rows = 20;
		int total_page = 0;
		int dataCount = 0;
		String numName = "";
		
		Map<String, Object> map = new HashMap<>();
		map.put("targetTitle", targetTitle);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		if(targetTitle.equals("tourreply")) {
			numName="replyNum";
		}
		else if (targetTitle.equals("friend")) {
			numName="friendNum";
		}
		else if (targetTitle.equals("board")) {
			numName="boardNum";
		}
		else if (targetTitle.equals("qna")) {
			numName="qnaNum";
		}
		else if (targetTitle.equals("friendreply")) {
			numName="friendreplyNum";
		}
		else if (targetTitle.equals("boardreply")) {
			numName="boardreplyNum";
		}
		else if (targetTitle.equals("qnareply")) {
			numName="qnareplyNum";
		}
		
		
		//reply일 때 content 게시판일때 subject 출력
		if(targetTitle.contains("reply")) {
			map.put("selected", "reply");
		}else {
			map.put("selected", "board");
		}
		
		map.put("numName", numName);
		
		//데이터 갯수 구하기
		dataCount = service.dataCount(map);
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);

		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * rows;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		
		//신고 목록을 가져온다~
		List<Singo> singoList = new ArrayList<Singo>();		
		singoList = service.singoList(map);
		
		
		//신고 리스트 번호 재정의
        int listNum, n = 0;
        for(Singo dto : singoList) {
            listNum = dataCount - (offset + n);
            dto.setBlameNo(listNum);
            n++;
        }
        
        
		
		String listUrl = cp +"/singo/singo?targetTitle="+targetTitle;	
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("condition", condition);
		model.addAttribute("targetTitle", targetTitle);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("singoList", singoList);
		model.addAttribute("subMenu", "0");
		model.addAttribute("title", "투어댓글");
		
		
		return ".singo.singo";
	}
	
	@RequestMapping(value="/singo/userManagment")
	public String userManagment(
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(value="page", defaultValue="1") int current_page,
			HttpServletRequest req,
			Model model
			) throws Exception {		

		String cp = req.getContextPath();		
		int rows = 20;
		int total_page = 0;
		int dataCount = 0;
		
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		
		//데이터 갯수 구하기
				dataCount = service.singoListCount(map);
				
				if (dataCount != 0)
					total_page = myUtil.pageCount(rows, dataCount);

				if (total_page < current_page)
					current_page = total_page;
				
				int offset = (current_page - 1) * rows;
				if (offset < 0)
					offset = 0;
				
				map.put("offset", offset);
				map.put("rows", rows);
				
				
				
				
				List<SingoManagment> singoCountList = new ArrayList<SingoManagment>();			
				singoCountList = service.singoCountList(map);
		

				//신고 리스트 번호 재정의
		        int listNum, n = 0;
		        for(SingoManagment dto : singoCountList) {
		            listNum = dataCount - (offset + n);
		            dto.setSingoNum(listNum);
		            n++;
		        }
		        
				String listUrl = cp +"/singo/userManagment";
				String paging = myUtil.paging(current_page, total_page, listUrl);
		
		     model.addAttribute("paging", paging);
		     model.addAttribute("singoCountList", singoCountList);
		
				return "/singo/userManagment";
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
			dto.setTargetTitle("tourreply");
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
