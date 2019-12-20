package com.railer.rt.tour;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller("tour.tourController")
public class TourController {
	
	@Autowired
	private TourService service;
	
	@RequestMapping(value="/tour/sudo")
	public String tour1(Model model, @RequestParam(defaultValue ="0") int cateNum){

		
		//큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();
		
		
		//tourcategoryNum를 갖고 서비스로 간다리~
		List<Tour> list = service.listBoard(cateNum);
				
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("list", list);		
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "수도권");
		
		return ".four.tour.tour.list";
	}
	@RequestMapping(value="/tour/chungcheong")
	public String tour3(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		model.addAttribute("title", "충청권");
		return ".four.tour.tour.list";
	}
	@RequestMapping(value="/tour/gangwon")
	public String tour2(Model model) throws Exception {
		model.addAttribute("subMenu", "3");
		model.addAttribute("title", "강원권");
		return ".four.tour.tour.list";
	}
	@RequestMapping(value="/tour/jeonla")
	public String tour4(Model model) throws Exception {
		model.addAttribute("subMenu", "4");
		model.addAttribute("title", "전라권");
		return ".four.tour.tour.list";
	}
	@RequestMapping(value="/tour/gyeongsang")
	public String tour5(Model model) throws Exception {
		model.addAttribute("subMenu", "5");
		model.addAttribute("title", "경상권");
		return ".four.tour.tour.list";
	}
	
	
	@RequestMapping(value="/tour/detail")
	public String detail(Model model) throws Exception {
		
		
		return ".four.tour.tour.detail";
	}
	
	
	@RequestMapping(value="/tour/tourList")
	public String d(Model model,
					@RequestParam(defaultValue ="0")  int tourcategoryNum) throws Exception {
		//큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();
		
		
		//tourcategoryNum를 갖고 서비스로 간다리~
		List<Tour> list = service.listBoard(tourcategoryNum);
		
		
		model.addAttribute("tourcategoryNum", tourcategoryNum);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("list", list);
		return ".four.tour.tour.list";
	}
	
	

	
	
	
	// 댓글 리스트 : AJAX-TEXT
		@RequestMapping(value="/tour/listReply")
		public String listReply(
				@RequestParam int num,
				@RequestParam(value="pageNo", defaultValue="1") int current_page,
				Model model
				) throws Exception {
			
			int rows=5;
			int total_page=0;
			int dataCount=0;
			
			Map<String, Object> map=new HashMap<>();
			map.put("num", num);
			
			//dataCount=service.replyCount(map);
			//total_page = myUtil.pageCount(rows, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
	        int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
			//List<Reply> listReply=service.listReply(map);
			
			//for(Reply dto : listReply) {
			//	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			//}
			
			// AJAX 용 페이징
			//String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
			
			// 포워딩할 jsp로 넘길 데이터
			//model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyCount", dataCount);
			model.addAttribute("total_page", total_page);
			//model.addAttribute("paging", paging);
			
			return ".four.tour.tour.detailReply";
		}
	
}
