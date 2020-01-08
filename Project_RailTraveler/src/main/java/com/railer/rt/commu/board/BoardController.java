package com.railer.rt.commu.board;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.railer.rt.common.FileManager;
import com.railer.rt.common.MyUtil;
import com.railer.rt.commu.friend.Friend;
import com.railer.rt.commu.friend.FriendServiceImpl;
import com.railer.rt.member.SessionInfo;

@Controller("commu.board.boardController")
public class BoardController {
	
	@Autowired
	BoardService service;

	@Autowired
	private FileManager fileManager;

	@Autowired
	private MyUtil util;
	
	
	@RequestMapping(value="/board/board")
	public String list(@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req, Model model) throws Exception {
		

		String cp = req.getContextPath();

		int rows = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
 
		dataCount = service.dataCount(map);
		total_page = util.pageCount(rows, dataCount);

		// 다른사람이 자료를 삭제해서 총 페이지가 줄어든 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		List<Board> noticeList = null;
		noticeList = service.listBoardTop();
		
		// 전체 페이지 수 구하기, 리스트에 출력할 데이터를 가져오기
				int offset = (current_page - 1) * rows;
				if (offset < 0) {
					offset = 0; 
				}
				map.put("offset", offset);
				map.put("rows", rows);
		
				// 글 리스트 
				List<Board> list = service.listBoard(map);

				// 리스트의 번호
				Date endDate = new Date();
				long gap;	// 최근 게시물 표시
				int listNum, n = 0;
				for (Board dto : list) {
					listNum = dataCount - (offset + n);
					dto.setListNum(listNum);

					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date beginDate = formatter.parse(dto.getCreated());
					// 날짜 차이 (시간)
					gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
					dto.setGap(gap);
					dto.setCreated(dto.getCreated().substring(0, 10));
					n++;
				} 
				
				//공지사항 맥이기
				for (Board dto : noticeList) {

					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date beginDate = formatter.parse(dto.getCreated());
					// 날짜 차이 (시간)
					gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
					dto.setGap(gap);
					dto.setCreated(dto.getCreated().substring(0, 10));
				}
				

				String query = "";
				String listUrl;
				String articleUrl;
				if (keyword.length() != 0) {
					query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
				} 
				listUrl = cp + "/board/board";
				articleUrl = cp + "/board/article?page=" + current_page;

				if (query.length() != 0) {
					listUrl = listUrl + "?" + query;
					articleUrl = articleUrl + "&" + query;
				}
 
				String paging = util.paging(current_page, total_page, listUrl);

				if (keyword.length() != 0)
					model.addAttribute("search", "search");
				model.addAttribute("noticeList", noticeList);
				model.addAttribute("list", list);
				model.addAttribute("articleUrl", articleUrl);
				model.addAttribute("page", current_page);
				model.addAttribute("dataCount", dataCount);
				model.addAttribute("paging", paging);

				model.addAttribute("condition", condition);
				model.addAttribute("keyword", keyword);
				
		model.addAttribute("subMenu", "2");
		return ".four.commu.board.board";
	}
	@RequestMapping(value="/board/created")
	public String createdForm(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		model.addAttribute("mode", "created");
		return ".four.commu.board.created";
	}
	  

	@RequestMapping(value = "/board/created", method = RequestMethod.POST)
	public String createdSubmit(Board	 dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "board";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.insertBoard(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/board";
	}
	
	
	@RequestMapping(value="/board/article", method = RequestMethod.GET)
	public String article(@RequestParam int boardNum, @RequestParam String page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			@CookieValue(defaultValue = "0") int cnum, HttpServletResponse resp, Model model, HttpSession session) throws Exception {
 
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		// 조회수 증가 및 해당 레코드 가져 오기
		if (boardNum != cnum) {
			service.updateHitCount(boardNum);

			Cookie ck = new Cookie("cnum", Integer.toString(boardNum));
			resp.addCookie(ck);
		}
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId;
		if(info==null) {
			userId= "x";
		}else {
			userId= info.getUserId();
		}
		Map<String, Object> readMap = new HashMap<String, Object>();
		readMap.put("userId", userId);
		readMap.put("boardNum", boardNum);
		
		Board dto = service.readBoard(readMap);

		if (dto == null) {
			return "redirect:/board/board?" + query;
		}

		if(dto.getUserId().equals("admin")) {
			List<Board> noticeList = null;
			noticeList = service.listBoardTop();

			model.addAttribute("noticeList", noticeList);
		}
		List<Board> files = service.listFile(boardNum);

		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("boardNum", boardNum);

		Board preReadDto = service.preReadBoard(map);
		Board nextReadDto = service.nextReadBoard(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("files", files);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		model.addAttribute("subMenu", "2");
		
		return ".four.commu.board.article";
	}
}
