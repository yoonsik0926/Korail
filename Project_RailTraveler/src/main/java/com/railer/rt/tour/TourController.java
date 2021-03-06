package com.railer.rt.tour;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.railer.rt.common.MyUtil;
import com.railer.rt.member.SessionInfo;

@Controller("tour.tourController")
public class TourController {

	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private TourService service;

	@RequestMapping(value = "/tour/{locName}")
	public String tour1(Model model,
			@PathVariable String locName,
			@RequestParam(defaultValue = "0") int cateNum,
			@RequestParam(defaultValue = "1") int locNum,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(value = "q", defaultValue = "" ) String q,
			HttpServletRequest req,
			HttpSession session) {
		
		String cp = req.getContextPath();
		
		int items = 12;
		int total_page = 0;
		int dataCount = 0;
		
		String title = "";
		if(locName.equals("sudo")) {
			locNum =1;
			title = "수도권";
		}
		else if (locName.equals("chungcheong")) {
	
			locNum =2;
			title="충청권";	
		}
		else if (locName.equals("gangwon")) {
			locNum =3;
			title="강원권";
		}
		else if (locName.equals("jeonla")) {
			locNum =4;
			title="전라권";	
		}
		else if (locName.equals("gyeongsang")) {
			locNum =5;
			title="경상권";	
		}

		Map<String, Object> map = new HashMap<>();

		map.put("cateNum", cateNum);
		map.put("locNum", locNum);
		
		map.put("name", "list");
		
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

		
		
		String userId = "";
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		if(info ==null) {
			map.put("userId", userId);
		}else {
			map.put("userId", info.getUserId());
		}
		

		
		//지역별 정보를 가져옴
		List<Tour> list = service.listBoard(map);
		
		//지역별 기차역을 가져옴
		List<Tour> localStation = service.localStation(locNum);
		
		//추천해줄 곳을 가져옴
		List<Tour> hitContentList = service.hitContentList(map);
		
		

		int listNum, n = 0;
		for(Tour dto : list) {
			listNum = dataCount - (offset+n);
			dto.setListNum(listNum);
			n++;
		}
		
	
		String listUrl = cp +"/tour/sudo?cateNum="+cateNum;				
		String articleUrl = cp+"/tour/detail?cateNum="+cateNum+"&page="+current_page+"&subTitle="+locName;

				
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
	      
		List<Tour> tourCategoryList = service.tourCategoryList();
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("hitContentList", hitContentList);
		model.addAttribute("localStation", localStation);
		model.addAttribute("cateNum", cateNum);
		model.addAttribute("tourCategoryList", tourCategoryList);
		model.addAttribute("list", list);
		model.addAttribute("paging", paging);
		model.addAttribute("subMenu", locNum);
		model.addAttribute("title", title);
		model.addAttribute("subTitle", locName);
		/*model.addAttribute("tarketUrl", tarketUrl);*/
		
		model.addAttribute("q", q);
		
		return ".four.tour.tour.list";
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
			@RequestParam String cateNum,
			HttpServletRequest req) {
		
			System.out.println(cateNum);

		String cp = req.getContextPath();
		
		int items = 12;
		int total_page = 0;
		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<>();

		map.put("staNum", staNum);
		map.put("detailcateNum", detailcateNum);
		map.put("name", "listBySearch");
		
		//카운터 세기
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
		
		String articleUrl = cp+"/tour/detail?page="+current_page+"&subTitle="+subTitle+"&cateNum="+cateNum;
				
		model.addAttribute("list", detailTourList);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("articleUrl", articleUrl);
		return "tour/tour/optionsList";
	}
	
	@RequestMapping(value = "/tour/likeTour" )
	@ResponseBody
	public Map<String, Object> likeTour(
			@RequestParam int tourNum,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		 
	
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tourNum", tourNum);
		map.put("userId", info.getUserId());
		

		//좋아요를 했는지(1) 안했는지(0) 알기 위한 여부 체크 
		int likecheck = service.likeCheck(map);
				
		if(likecheck==0) {
			service.likeTour(map);			
		}else{
			service.disLikeTour(map);
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("likecheck", likecheck);
	

		return model;
	}
	

	@RequestMapping(value="/tour/detail")
	public String article(
			@RequestParam int cateNum,
			@RequestParam String page,
			@RequestParam String subTitle,
			@RequestParam int tourNum,
			Model model,
			HttpServletRequest req
			) throws Exception {
		String cp = req.getContextPath();	
		Tour vo = service.readDetailTour(tourNum);
		

		
		//쿠키를 이용하여 중복되지 않게 카운트 추가

        //크롤링할 url지정
        String url = "https://search.naver.com/search.naver?where=post&sm=tab_jum&query="+vo.getName();          
        Document doc = null; 
      
        
        System.out.println(url);
        try {
        	doc = Jsoup.connect(url).get();
        	
		} catch (Exception e) {
			e.printStackTrace();
		}  
        
        
        String url2 = "https://search.naver.com/search.naver?where=image&sm=tab_jum&query="+vo.getName();  
        Document doc2 = null;
        
        try {
        	doc2 = Jsoup.connect(url2).get();
        	
		} catch (Exception e) {
			e.printStackTrace();
		}  
        
        List<BlogCrwaling> bloglist = new ArrayList<BlogCrwaling>();
        List<ImageCrwaling> imagelist = new ArrayList<ImageCrwaling>();
    
        Elements element = doc.select("dl"); 
        Elements element2 = doc2.select("div.img_area._item"); 

        

        
        for(int j =0; j<12;j++) {
        	ImageCrwaling dto = new ImageCrwaling();
        	 dto.setImgUrl(element2.eq(j).select("img._img").attr("data-source")); 
        	 dto.setImgAlt(element2.eq(j).select("img._img").attr("alt")); 
        	 imagelist.add(dto);
        }

        

        for(int i=3; i<8/*element.size()*/; i++){
        	BlogCrwaling dto = new BlogCrwaling();
        	dto.setBlogContent(element.eq(i).select("dd.sh_blog_passage").text());
        	dto.setBlogName(element.eq(i).select("a.txt84").text());
        	dto.setCreated(element.eq(i).select("dd.txt_inline").text());
        	dto.setBlogSubject(element.eq(i).select("a.sh_blog_title._sp_each_url._sp_each_title").text());
        	dto.setBlogUrl(element.eq(i).select("a.url").attr("href"));
        		  
        	bloglist.add(dto);
        }
        
		String targetUrl = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+cp+"/tour/detail?cateNum="+cateNum+"&page="+page+
		"&subTitle="+subTitle+"&tourNum="+tourNum;
        
        
        model.addAttribute("imagelist", imagelist);
        model.addAttribute("bloglist", bloglist);
		model.addAttribute("vo",vo);
		model.addAttribute("targetUrl", targetUrl);
		return ".four.tour.tour.detail";
	}
	
	@RequestMapping(value = "/tour/myBookMark")
	public String myBookMark(Model model,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpServletRequest req,
			HttpSession session) {
	
		String cp = req.getContextPath();		
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		if(userId== null) {
			return "redirect:/member/login";
		}
		
		int items = 7;
		int total_page = 0;
		int dataCount = 0;
		
	
		Map<String, Object> map = new HashMap<>();

		map.put("name", "mybookmark");
		map.put("userId", userId);
		map.put("cateNum", 0);
		

		dataCount = service.myBookMarkCount(map);


		
		if (dataCount != 0)
			total_page = myUtil.pageCount(items, dataCount);
		

		
		if (total_page < current_page)
			current_page = total_page;
		
		int offset = (current_page - 1) * items;
		if (offset < 0)
			offset = 0;
		
		map.put("offset", offset);
		map.put("items", items);

		
		List<Tour> myBookMarkList = service.myBookMark(map);
		
		
		// AJAX 용 페이징
		String paging=myUtil.pagingMethod(current_page, total_page, "modallistPage");
		
		String detailInfoUrl = cp+"/tour/detail?page="+current_page;
		
		model.addAttribute("current_page", current_page);
		model.addAttribute("list", myBookMarkList);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("detailInfoUrl", detailInfoUrl);

		return "tour/tour/myBookMarkList";
	}
	
		// 댓글 및 댓글의 답글 등록 : AJAX-JSON
		@RequestMapping(value="/tour2/insertReply", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertReply(
				TourReply dto,
				HttpSession session
				) {
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			String state="true";
			
			try {
				dto.setUserId(info.getUserId());
				service.insertReply(dto);
			} catch (Exception e) {
				state="false";
			}
			
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			return model;
		}
	 
		
		// 댓글 리스트 : AJAX-TEXT
		@RequestMapping(value="/tour2/listReply", method = RequestMethod.GET)
		public String listReply(
				@RequestParam int tourNum,
				@RequestParam(value="pageNo", defaultValue="1") int current_page,
				HttpSession session,
				Model model
				) throws Exception {
			

			int rows=5;
			int total_page=0;
			int dataCount=0;
			
			Map<String, Object> map=new HashMap<>();
			map.put("tourNum", tourNum);
			
			dataCount=service.replyCount(tourNum);
			
			total_page = myUtil.pageCount(rows, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
	        int offset = (current_page-1) * rows;
			if(offset < 0) offset = 0;
	        map.put("offset", offset);
	        map.put("rows", rows);
	        

			SessionInfo info=(SessionInfo)session.getAttribute("member");
	        String userId="";
	        	 		
	        if(info !=null) {
	        	map.put("userId", info.getUserId());
	        }else {
	        	map.put("userId", userId );
	        }
			
        
			List<TourReply> listReply=service.replylist(map);
			
			for(TourReply dto : listReply) {
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}
			
			// AJAX 용 페이징
			String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
			
			// 포워딩할 jsp로 넘길 데이터
			model.addAttribute("listReply", listReply);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("replyCount", dataCount);
			model.addAttribute("total_page", total_page);
			model.addAttribute("paging", paging);
			
			
			return "tour/tour/detailReply";
		}
		
		
		 // 댓글의 답글 리스트 : AJAX-TEXT
		@RequestMapping(value="/tour2/listReplyAnswer")
		public String listReplyAnswer(
				@RequestParam int answer,
				Model model
				) throws Exception {
			
			List<TourReply> listReplyAnswer=service.replyAnswerList(answer);
			
			for(TourReply dto : listReplyAnswer) {
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
			}
			
			model.addAttribute("listReplyAnswer", listReplyAnswer);
			return "tour/tour/detailReplyAnswer";
		}
		
		
		// 댓글의 답글 개수 : AJAX-JSON
		@RequestMapping(value="/tour2/replyCount")
		@ResponseBody
		public Map<String, Object> countReplyAnswer(
				@RequestParam(value="answer") int answer
				) {
			
			int count=service.replyAnswerCount(answer);
			
			Map<String, Object> model=new HashMap<>();
			model.put("count", count);
			return model;
		}
		
		
		//댓글 및 댓글에 대한 리플 지우기
		@RequestMapping(value="/tour2/deleteReply")
		@ResponseBody
		public Map<String, Object> deleteReply(
				@RequestParam(value="replyNum") int replyNum,
				@RequestParam String mode,
				HttpSession session
				) {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
			
		Map<String, Object> map =new HashMap<>();
		
		map.put("userId", info.getUserId());
		map.put("mode", mode);
		map.put("replyNum", replyNum);
		String state ="true";
		
		try {
			service.deleteReply(map);
		} catch (Exception e) {
			e.printStackTrace();
			state = "false";
		}
		
		
		Map<String, Object> model =new HashMap<>();
		model.put("state", state);
		return model;
		}

		@RequestMapping(value = "/tour2/replyLike" )
		@ResponseBody
		public Map<String, Object> replyLike(
				@RequestParam int replyNum,
				HttpSession session) throws Exception {
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			 		
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("replyNum", replyNum);
			map.put("userId", info.getUserId());
			

			//좋아요를 했는지(1) 안했는지(0) 알기 위한 여부 체크 
			int checkreplyLike = service.checkReplyLike(map);
					
			if(checkreplyLike==0) {
				service.replyLike(map);			
			}else{
				service.replyLikeCancel(map);
			}
			
			Map<String, Object> model = new HashMap<>();
			model.put("checkreplyLike", checkreplyLike);
		

			return model;
		}
		
		@RequestMapping(value = "/tour2/deleteMyBookMark" )
		@ResponseBody
		public Map<String, Object> deleteMyBookMark(
				@RequestParam String deleteList,
				HttpSession session) throws Exception {
			
			SessionInfo info=(SessionInfo)session.getAttribute("member");
			
			ArrayList<Integer> deleteListArray  = new ArrayList<>();
			String[] temp = deleteList.split(",");
			
			
			for(String item : temp ) {
				deleteListArray.add(Integer.parseInt(item));
			}
		
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("deleteListArray", deleteListArray);
			map.put("userId", info.getUserId());
			map.put("mode", "deleteList");
			
			String state ="";
			
			try {
				service.disLikeTour(map);
			} catch (Exception e) {
				e.printStackTrace();
				state = "false";
			}
					
		
			Map<String, Object> model = new HashMap<>();
			
			model.put("state", state);

			return model;
		}
		
		

	

}
