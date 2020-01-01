package com.railer.rt.mypage;

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
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpServletRequest req,
			HttpSession session) {
	
		String cp = req.getContextPath();		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		if(userId== null) {
			return "redirect:/member/login";
		}
		
		int items = 3;
		int total_page = 0;
		int dataCount = 0;
		
	
		Map<String, Object> map = new HashMap<>();

		map.put("name", "mybookmark");
		map.put("userId", userId);
		map.put("cateNum", 0);
		

		dataCount = tourService.myBookMarkCount(map);


		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);
		

		
		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("items", items);

		
		List<Tour> myBookMarkList = tourService.myBookMark(map);
		
		
		String listUrl = cp + "/bookmark/tour";
		
		String paging = myUtil.paging(current_page, total_page,listUrl);
		
		String detailInfoUrl = cp+"/tour/detail?page="+current_page;
		
		model.addAttribute("current_page", current_page);
		model.addAttribute("list", myBookMarkList);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("detailInfoUrl", detailInfoUrl);
		
		model.addAttribute("subMenu", "2");
		model.addAttribute("subItems", "0");
		
		return ".four.mypage.bookmark.tour";
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
