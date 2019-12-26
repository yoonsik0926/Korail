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
			HttpServletRequest req) {
		
		String cp = req.getContextPath();
		
		int items = 12;
		int total_page = 0;
		int dataCount = 0;
		
		String title = "수도권";
		if(locName.equals("sudo")) {
			locNum =1;
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
		map.put("name", 0);
		
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
		
		
		String articleUrl = cp+"/tour/detail?cateNum="+cateNum+"&page="+current_page+"&subTitle=sudo";
		

        
/*        if(query.length()!=0) {
        	listUrl = cp+"/sbbs/list?" + query;
        	articleUrl = cp+"/sbbs/article?page=" + current_page + "&"+ query;
        	listUrl +="&"+query;
        	articleUrl+= "&"+query;
        }*/
      
		
		
        String paging = myUtil.paging(current_page, total_page, listUrl);
		
		// 큰 카테고리의 정보를 가져온다.
        
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
		map.put("name", 1);
		
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
        
        
        model.addAttribute("imagelist", imagelist);
        model.addAttribute("bloglist", bloglist);
		model.addAttribute("vo",vo);
		return ".four.tour.tour.detail";
	}
	
	@RequestMapping(value = "/tour/myBookMark")
	public String myBookMark(Model model,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpServletRequest req,
			HttpSession session) {
		
		
		
		//String cp = req.getContextPath();
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String userId = info.getUserId();
		
		if(userId== null) {
			return "redirect:/member/login";
		}
		
		int items = 7;
		int total_page = 0;
		int dataCount = 0;
		
	
		Map<String, Object> map = new HashMap<>();

		map.put("name", 10);
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
		
		//String articleUrl = cp+"/tour/detail?page="+current_page+"&subTitle="+subTitle+"&cateNum="+cateNum;
		model.addAttribute("current_page", current_page);
		model.addAttribute("list", myBookMarkList);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount",dataCount);
		//model.addAttribute("articleUrl", articleUrl);

		return "tour/tour/myBookMarkList";
	}
	 

	
	
	

}
