package com.railer.rt.tour;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.railer.rt.common.MyUtil;




@Controller("tour.tourController")
public class TourController {

	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private TourService service;

	@RequestMapping(value = "/tour/sudo")
	public String tour1(Model model,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "1") int locNum, HttpServletRequest req) {
		
		String cp = req.getContextPath();
		
		int items = 12;
		int total_page = 0;
		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);
		map.put("name", "totalData");
		
		//cateNum과 locNum을 이용해서 카운터 세기
		dataCount = service.dataCount(map);
		
		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);

		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("items", items);

		
		//지역별 이미지를 가져옴
		List<Tour> list = service.listBoard(map);
		
		//지역별 기차역을 가져옴
		List<Tour> localStation = service.localStation(locNum);

		
		int listNum, n = 0;
		for(Tour dto : list) {
			listNum = dataCount - (offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp +"/tour/sudo?cateNum="+cateNum;
		/*String articleUrl = cp+"/tour/detail?cateNum="+cateNum+"&page="+current_page;
		

        
        if(query.length()!=0) {
        	listUrl = cp+"/sbbs/list?" + query;
        	articleUrl = cp+"/sbbs/article?page=" + current_page + "&"+ query;
        	listUrl +="&"+query;
        	articleUrl+= "&"+query;
        }
        */
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		// 큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();

		model.addAttribute("localStation", localStation);
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("list", list);
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "수도권");
		model.addAttribute("subTitle", "sudo");
		model.addAttribute("paging", paging);

		return ".four.tour.tour.list";
	}

	@RequestMapping(value = "/tour/chungcheong")
	public String tour3(Model model, @RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "2") int locNum) throws Exception {
		
	
		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);

		// tourcategoryNum를 갖고 서비스로 간다리~
		List<Tour> list = service.listBoard(map);

		// 큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();
		
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("list", list);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("subMenu", "2");
		model.addAttribute("title", "충청권");
		model.addAttribute("subTitle", "chungcheong");
		return ".four.tour.tour.list";
	}

	@RequestMapping(value = "/tour/gangwon")
	public String tour2(Model model, @RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "3") int locNum) throws Exception {
		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);

		// tourcategoryNum를 갖고 서비스로 간다리~
		List<Tour> list = service.listBoard(map);
		// 큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();
		
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("list", list);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("subMenu", "3");
		model.addAttribute("title", "강원권");
		model.addAttribute("subTitle", "gangwon");
		return ".four.tour.tour.list";
	}

	@RequestMapping(value = "/tour/jeonla")
	public String tour4(Model model, @RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "4") int locNum) throws Exception {
		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);

		// tourcategoryNum를 갖고 서비스로 간다리~
		List<Tour> list = service.listBoard(map);

		// 큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();

		model.addAttribute("cateNum", cateNum);
		model.addAttribute("list", list);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("subMenu", "4");
		model.addAttribute("title", "전라권");
		model.addAttribute("subTitle", "jeonla");
		return ".four.tour.tour.list";
	}

	@RequestMapping(value = "/tour/gyeongsang")
	public String tour5(Model model, @RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "5") int locNum) throws Exception {
		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);

		// tourcategoryNum를 갖고 서비스로 간다리~
		List<Tour> list = service.listBoard(map);

		// 큰 카테고리의 정보를 가져온다.
		List<Tour> tourCategoryList = service.tourCategoryList();

		model.addAttribute("cateNum", cateNum);
		model.addAttribute("list", list);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("subMenu", "5");
		model.addAttribute("title", "경상권");
		model.addAttribute("subTitle", "gyeongsang");
		return ".four.tour.tour.list";
	}

	@RequestMapping(value = "/tour/detail")
	public String detail(Model model) throws Exception {

		return ".four.tour.tour.detail";
	}

	// 댓글 리스트 : AJAX-TEXT
	@RequestMapping(value = "/tour/listReply")
	public String listReply(@RequestParam int num, @RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			Model model) throws Exception {

		int rows = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("num", num);

		// dataCount=service.replyCount(map);
		// total_page = myUtil.pageCount(rows, dataCount);
		if (current_page > total_page)
			current_page = total_page;

		int offset = (current_page - 1) * rows;
		if (offset < 0)
			offset = 0;
		map.put("offset", offset);
		map.put("rows", rows);
		// List<Reply> listReply=service.listReply(map);

		// for(Reply dto : listReply) {
		// dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		// }

		// AJAX 용 페이징
		// String paging=myUtil.pagingMethod(current_page, total_page, "listPage");

		// 포워딩할 jsp로 넘길 데이터
		// model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		// model.addAttribute("paging", paging);

		return ".four.tour.tour.detailReply";
	}
	
	@RequestMapping(value = "/tour/detailTourCategory", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> detailTourCategory(@RequestParam int cateNum) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateNum", cateNum);

		List<Tour> detailTourCategoy = service.detailTourCategory(map);

		Map<String, Object> model = new HashMap<>();
		model.put("detailTourCategoy", detailTourCategoy);

		return model;
	}
	
	
	@RequestMapping(value = "/tour/detailTourList")
	public String detailTourList(Model model,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			@RequestParam int staNum,
			@RequestParam int detailcateNum,
			@RequestParam String subTitle,
			HttpServletRequest req) {
				
		int items = 6;
		int total_page = 0;
		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<>();

		map.put("staNum", staNum);
		map.put("detailcateNum", detailcateNum);
		map.put("name", "detailData");
		
		//cateNum과 locNum을 이용해서 카운터 세기
		dataCount = service.dataCount(map);
	

		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);
		

		
		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("items", items);

		
		List<Tour> detailTourList = service.detailTourList(map);
		
		
		// AJAX 용 페이징
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
				
		model.addAttribute("list", detailTourList);
		model.addAttribute("paging", paging);

		return "tour/tour/optionsList";
	}
	
	
	
	

}
