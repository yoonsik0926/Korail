package com.railer.rt.commu.friend;

import java.io.File;
import java.math.BigDecimal;
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
import org.springframework.data.mongodb.core.aggregation.ArrayOperators.In;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.railer.rt.common.FileManager;
import com.railer.rt.common.MyUtil;
import com.railer.rt.member.SessionInfo;

@Controller("commu.friend.friendController")
public class FriendController {

	@Autowired
	FriendServiceImpl service;

	@Autowired
	private FileManager fileManager;

	@Autowired
	private MyUtil util;

	/**
	 * 동행구하기 게시판 리스트
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/friend/friend")
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

		// 1페이지인 경우 공지리스트 가져오기
		List<Friend> friendList = null;
		if (current_page == 1)
			friendList = service.listFriendTop();
		
		// 전체 페이지 수 구하기, 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * rows;
		if (offset < 0) {
			offset = 0;
		}
		map.put("offset", offset);
		map.put("rows", rows);

		// 글 리스트
		List<Friend> list = service.listFriend(map);

		// 리스트의 번호
		Date endDate = new Date();
		long gap;
		int listNum, n = 0;
		for (Friend dto : list) {
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

		String query = "";
		String listUrl;
		String articleUrl;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");

		}
		listUrl = cp + "/friend/friend";
		articleUrl = cp + "/friend/article?page=" + current_page;

		if (query.length() != 0) {
			listUrl = listUrl + "?" + query;
			articleUrl = articleUrl + "&" + query;
		}

		String paging = util.paging(current_page, total_page, listUrl);

		if (keyword.length() != 0)
			model.addAttribute("search", "search");

		model.addAttribute("friendList",friendList);
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		model.addAttribute("subMenu", "3");
		return ".four.commu.friend.friend";
	}

	@RequestMapping(value = "/friend/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("subMenu", "3");
		model.addAttribute("mode", "created");
		return ".four.commu.friend.created";
	}

	@RequestMapping(value = "/friend/created", method = RequestMethod.POST)
	public String createdSubmit(Friend dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "friend";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.insertFriend(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/friend/friend";
	}

	@RequestMapping(value = "/friend/article", method=RequestMethod.GET)
	public String article(@RequestParam int friendNum,
            @RequestParam String page,
            @RequestParam(defaultValue="all") String condition,
            @RequestParam(defaultValue="") String keyword,
            @CookieValue(defaultValue="0") int cnum,
            HttpServletResponse resp,
            Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
	      
	      String query="page="+page;
	      if(keyword.length()!=0) {
	         query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
	      }

	      // 조회수 증가 및 해당 레코드 가져 오기
	      if(friendNum!=cnum) {
	         service.updateHitCount(friendNum);
	         
	         Cookie ck=new Cookie("cnum", Integer.toString(friendNum));
	         resp.addCookie(ck);
	      }
	      
	      Friend dto = service.readFriend(friendNum);
	
	      if(dto==null) {
	    	  return "redirect:/friend/friend?"+query;
	      }
	      
	      List<Friend> files = service.listFile(friendNum);
	
	      // 이전 글, 다음 글
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("condition", condition);
	      map.put("keyword", keyword);
	      map.put("noticeNum", friendNum);

	      Friend preReadDto = service.preReadFriend(map);
	      Friend nextReadDto = service.nextReadFriend(map);
	      model.addAttribute("dto", dto);
	      model.addAttribute("files", files);
	      model.addAttribute("preReadDto", preReadDto);
	      model.addAttribute("nextReadDto", nextReadDto);
	      model.addAttribute("page", page);
	      model.addAttribute("query", query);
	      
	      
		model.addAttribute("subMenu", "3");
		return ".four.commu.friend.article";
	}
	// 댓글의 좋아요/싫어요 추가 : AJAX-JSON
		@RequestMapping(value="/friend/insertFriendBookmark", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertFriendBookmark(
				@RequestParam Map<String, Object> paramMap,
				HttpSession session
				) {
			String state="true";
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			Map<String, Object> model=new HashMap<>();
			
			try {
				paramMap.put("userId", info.getUserId());
				service.insertFriendBookmark(paramMap);
			} catch (Exception e) {
				state="false";
			}
			int friendNum = Integer.parseInt((String) paramMap.get("friendNum"));
			int bookmarkCount= 0;
			try {
				bookmarkCount= service.bookmarkCount(friendNum);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			model.put("bookmarkCount", bookmarkCount);
			model.put("state", state);
			return model;
		}

}
