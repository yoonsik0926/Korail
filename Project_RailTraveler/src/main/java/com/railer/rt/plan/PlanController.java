package com.railer.rt.plan;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
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

@Controller("plan.planController")
public class PlanController {
	
	@Autowired
	PlanServiceImpl service;
	
	@Autowired
	private MyUtil myUtil;
	
	// 첫 로딩시 모든 마커 출력
	@RequestMapping(value="/plan/write")
	public String writeForm(Model model) throws Exception {
		
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("locNum", 0);
        map.put("keyword", "");

		List<Station> list=service.listStation(map);
		List<Tour> listCategory=service.listCategory(); // 세부계획 모달창의 대분류 셀렉트 박스는 첫 로딩때 미리 설정해줌
		

		model.addAttribute("listCategory", listCategory);
        model.addAttribute("list", list);
		model.addAttribute("subMenu", "0");
		model.addAttribute("title", "나의 여행 계획");
		
		return "/plan/plan/write";
	}
	
	// 지도에서 원하는 역 검색
	@RequestMapping(value="/plan/searchStation")
	@ResponseBody
	public Map<String, Object> searchStation(@RequestParam int locNum,
											 @RequestParam String keyword) throws Exception {
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("locNum", locNum);
		map.put("keyword", keyword);
		
		List<Station> list=service.listStation(map);
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		
		return model;
	}
	
	// 소분류 카테고리 뿌리기
	@RequestMapping(value="/plan/listDetailTourCate", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> listTourCate(@RequestParam int cateNum,
										    @RequestParam Map<String, Object> model) throws Exception {
		
		Map<String, Object> map=new HashMap<>();
		map.put("cateNum", cateNum);
		
		List<Tour> listDetailCate=service.listDetailCate(map);
		
		model.put("listDetailCate", listDetailCate);
		
		return model;
	}
	
	// 세부계획 DB에 추가 -> 가공은 서비스에서
	@RequestMapping(value="/plan/insertTicketDay", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> insertTicketDay(@RequestParam String days,
											   @RequestParam String sDate,
											   @RequestParam String title,
											   HttpSession session,
											   HttpServletRequest request) {
		
		int planNum=0;
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		Map<String, Object> map=new HashMap<>();
		map.put("userId", info.getUserId());
		map.put("days",days);
		map.put("sDate",sDate);
		map.put("title", title);
		
		try {
			planNum=service.insertPlan(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> model1 = new HashMap<>();
		model1.put("planNum", planNum);
		return model1;
	}
	
	// 세부계획 모달에서 장소 검색
	@RequestMapping(value="/plan/searchPlace")
	@ResponseBody
	public Map<String, Object> searchPlace(@RequestParam(value="page", defaultValue="1") int current_page,
										   @RequestParam int detailcateNum,
										   @RequestParam int staNum,
										   @RequestParam String keyword,
										   HttpServletRequest req,
										   Model model) throws Exception {
		
		
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			keyword = URLDecoder.decode(keyword, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map=new HashMap<>();
		map.put("staNum", staNum);
		map.put("detailcateNum", detailcateNum);
		map.put("keyword", keyword);
		
		dataCount=service.placeDataCount(map);
		if(dataCount!=0) {
			total_page=myUtil.pageCount(rows,dataCount);
		}
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset=(current_page-1)*rows;
		if(offset <0) {
			offset=0;
		}
		map.put("offset", offset);
        map.put("rows", rows);
        
        // 여행지 리스트
		List<Tour> list=service.listTour(map);
//		for(Tour dto : list) {
//			dto.setAddress(dto.getContent().replaceAll("\n", "<br>"));
//		}

		String paging=myUtil.pagingMethod(current_page, total_page, "findTourThing");
		Map<String, Object> model1 = new HashMap<>();
		model1.put("total_page", total_page);
		model1.put("paging", paging);
		model1.put("dataCount", dataCount);
		
		model1.put("list",list);
		
		return model1;
	}
	
	@RequestMapping(value="/plan/planlist")
	public String planlist(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "친구의 여행 플랜");
		return ".four.plan.plan.planlist";
	}
	
	@RequestMapping(value="/plan/updateImage", method=RequestMethod.POST)
	public String updateImage(Plan dto,
							  HttpSession session) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+"uploads"+File.separator+"plan";
		
		try {
			service.updateImage(dto, path);
		} catch (Exception e) {
		}
    	
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info.getUserId()=="admin")
			return "redirect:/plan/recommand";
		else
			return "redirect:/friendPlan/planlist";
			
	}
	
	

	@RequestMapping(value="/plan/recommand") 
	public String recommand(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		model.addAttribute("title", "추천 코스");
		return ".four.plan.plan.recommandlist";
	}
	
	@RequestMapping(value="/plan/list")
	public String planlist(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "condition", defaultValue = "all") String condition,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		int rows = 4;
		int total_page = 0;
		int dataPlanCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		dataPlanCount = service.dataPlanCount(map);
		
		
		if (dataPlanCount != 0) {
			total_page = myUtil.pageCount(rows, dataPlanCount);
		}

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * rows;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Plan> list = service.listPlan(map);
				
		String query = "";
		String articleUrl = cp +"/plan/detail?";
		
		if(keyword.length()!=0) {
			query = "condition="+condition+"&keyword="+keyword+"&";
		}
		
		if(query.length()!=0) {
			articleUrl += query;
		}
		
		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPlanPage");
		
		model.addAttribute("list",list);
		model.addAttribute("dataCount",dataPlanCount);
		model.addAttribute("page",current_page);
		model.addAttribute("query",query);
		model.addAttribute("condition",condition);
		model.addAttribute("keyword",keyword);
		model.addAttribute("articleUrl",articleUrl);
		model.addAttribute("paging",paging);
		
		model.addAttribute("subMenu", "2");
		model.addAttribute("title", "추천 코스");
		
		return "/plan/plan/list";
	}
	
	
	@RequestMapping(value="/plan/detail")
	public String detail(
			@RequestParam int planNum,
			@RequestParam(defaultValue="1") String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		String cp = req.getContextPath();
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query = "page="+page;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		String listUrl = cp + "/plan/planlist?"+query;
		
		//여행 시작 날짜, 종료 날짜, 티켓 일수 ,userId, title
		Plan dto = service.readPlan(planNum);
		if(dto == null)
			return "redirect:/plan/planlist";

		Map<String, Object> map = new HashMap<>();
		map.put("planNum", planNum);
		
		//역 이름, 시작 날짜, 종료 날짜, 경도, 위도, 일 수 (nthDay)
		List<Plan> stationList = service.readStation(map);
		
		//가격 구하기
		map.put("cateName", "명소");
		int tourPrice = service.calPrice(map);
		map.remove("cateName");
		
		map.put("cateName", "맛집");
		int foodPrice = service.calPrice(map);
		map.remove("cateName");
		
		map.put("cateName", "숙소");
		int hotelPrice = service.calPrice(map);
		map.remove("cateName");
		
		//세부 일정
		List<Plan> tourList = service.readDetailPlan(map);
				
		//전체 금액
		int totPrice = tourPrice + foodPrice + hotelPrice;

		//역 개수
		int stationCount = service.stationCount(planNum);
		int length = 173 + (182*(stationCount-2));
		
		//좋아요
		HttpSession session = req.getSession();
		if(session != null && session.getAttribute("member") != null && !session.getAttribute("member").equals("")) {
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			String userId = info.getUserId();
			Map<String, Object> map2 = new HashMap<String, Object>();
			map2.put("planNum", planNum);
			map2.put("userId", userId);

			//좋아요를 했는지(1) 안했는지(0) 알기 위한 여부 체크 
			int likecheck = service.checkLike(map2);
					
			if(likecheck==0) {
				model.addAttribute("like","dislike");
			}else{
				model.addAttribute("like","like");
			}
		}
		
		model.addAttribute("dto",dto);
		model.addAttribute("stationList",stationList);
		model.addAttribute("tourList",tourList);
		model.addAttribute("planNum",planNum);
		
		model.addAttribute("listUrl",listUrl);
		model.addAttribute("tourPrice",tourPrice);
		model.addAttribute("foodPrice",foodPrice);
		model.addAttribute("hotelPrice",hotelPrice);
		model.addAttribute("totPrice",totPrice);
		model.addAttribute("length",length);
		model.addAttribute("stationCount",stationCount);
		
		model.addAttribute("subMenu", "2");
		model.addAttribute("title", "추천 코스");
		
		return ".four.plan.plan.detail";
	}
	
	
	@RequestMapping(value="/plan/like")
	@ResponseBody
	public Map<String, Object> likePlan(
			@RequestParam int planNum,
			HttpSession session) throws Exception{
		
		Map<String, Object> model = new HashMap<>();
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("planNum", planNum);
		map.put("userId", userId);
		

		//좋아요를 했는지(1) 안했는지(0) 알기 위한 여부 체크 
		int likecheck = service.checkLike(map);
				
		if(likecheck==0) {
			service.likeFriendPlan(map);
		}else{
			service.disLikePlan(map);
		}
		
		
		model.put("likecheck", likecheck);	
		
		return model;
	}
	
	
	
}
