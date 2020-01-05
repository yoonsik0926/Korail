package com.railer.rt.mypage;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.railer.rt.common.MyUtil;
import com.railer.rt.member.SessionInfo;
import com.railer.rt.tour.Tour;
import com.railer.rt.tour.TourService;

@Controller("mypage.mypageController")
public class MypageController {
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private TourService tourService;
	
	@RequestMapping(value="/bookmark/tour")
	public String bookmarkTour(
			Model model,
			HttpServletRequest req,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session) throws Exception {		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info== null) {
			return "redirect:/member/login";
		}
		String userId = info.getUserId();
		
		//지도에 마크 찍을 리스트
		int dataCount = 0;
		Map<String, Object> map = new HashMap<>();

		map.put("userId", userId);
		dataCount = tourService.myBookMarkCount(map);

		map.put("name", "mybookmark");
		map.put("cateNum", 0);
		map.put("offset", 0);
		map.put("items", dataCount);

		List<Tour> myBookMarkList = tourService.myBookMark(map);
		
		model.addAttribute("list",myBookMarkList);
		model.addAttribute("pageNo",current_page);

		model.addAttribute("subMenu", "2");
		model.addAttribute("subItems", "0");
		
		return ".four.mypage.bookmark.tour";
	}
	
	@RequestMapping(value="/bookmark/tourlist")
	public String tourlist(
			HttpServletRequest req,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "") String keyword,
			HttpSession session,
			Model model
			) throws Exception{
		

		String cp = req.getContextPath();		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		if(userId== null) {
			return "redirect:/member/login";
		}
		
		
		int items = 3;
		int total_page = 0;
		int dataCount = 0;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();

		
		map.put("userId", userId);
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = tourService.myBookMarkCount(map);
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);
		
		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("name", "mybookmark");
		map.put("cateNum", 0);
		map.put("offset", offset);
		map.put("items", items);

		
		List<Tour> myBookMarkList = tourService.myBookMark(map);

		String detailInfoUrl = cp+"/tour/detail?page="+current_page;

		String paging=myUtil.pagingMethod(current_page, total_page, "tourlistPage");
		
		model.addAttribute("paging",paging);
		model.addAttribute("pageNo",current_page);
		model.addAttribute("total_page",total_page);
		model.addAttribute("keyword",keyword);
		model.addAttribute("condition",condition);
		model.addAttribute("list",myBookMarkList);
		model.addAttribute("detailInfoUrl",detailInfoUrl);
		model.addAttribute("dataCount",dataCount);
		
		
		return "mypage/bookmark/tourlist";
	}
	
	@RequestMapping(value="/bookmark/deleteBookmark", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> deleteBookmark(
			@RequestParam int tourNum,
			HttpSession session) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		String state = "true";
		
		Map<String, Object> map = new HashMap<>();
		map.put("tourNum", tourNum);
		map.put("userId", userId);
		
		try {
			tourService.disLikeTour(map);
		} catch (Exception e) {
			state="false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/bookmark/address")
	@ResponseBody
	public Map<String, Object> readAddress(
			@RequestParam int tourNum){
		
		Tour dto = new Tour();
		
		Map<String, Object> map = new HashMap<>();
		map.put("tourNum",tourNum);
		
		try {
			dto = tourService.readAddress(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("dto", dto);
		
		return model;
	}
	
	
	
	@RequestMapping(value="/bookmark/recommend")
	public String bookmarkRecommend(
			Model model) {
		
		model.addAttribute("subMenu", "3");
		model.addAttribute("subItems", "1");
		return ".four.mypage.bookmark.recommend";
	}
	
	@RequestMapping(value="/bookmark/commu")
	public String bookmarkCommu(
			Model model) {
		
		model.addAttribute("subMenu", "4");
		model.addAttribute("subItems", "2");
		
		return ".four.mypage.bookmark.commu";
	}



	@RequestMapping(value="/ticket/ticket")
	public String myTicket(
			Model model) {
		
		model.addAttribute("subMenu", "5");

		return ".four.mypage.ticket.ticket";
	}
	
	@RequestMapping(value="/stamp/stamp")
	public String stamp(
			Model model) {
		
		model.addAttribute("subMenu", "6");

		return ".four.mypage.stamp.stamp";
	}

	@RequestMapping(value="/plan/plan")
	public String myPlan(
			Model model) {
		
		model.addAttribute("subMenu", "7");

		return ".four.mypage.plan.plan";
	}
	
	@RequestMapping(value="/bbs/mybbs")
	public String myBbs(
			Model model) {
		
		model.addAttribute("subMenu", "8");

		return ".four.mypage.bbs.mybbs";
	}
	
}
