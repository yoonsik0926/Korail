package com.railer.rt.event;
import java.io.File;
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

import com.railer.rt.common.MyUtil;

@Controller("event.eventController")
public class EventController {
	
	@Autowired 
	private EventService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value= {"/event/current", "/event/last"})
	public String current(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(defaultValue="0") int order,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
   	    
		int rows = 6;
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "utf-8");
		}

		String mode="current";
        if(req.getRequestURI().indexOf("/event/current")==-1) {
        	 mode="last";
        }
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("mode", mode);
        map.put("order", order);
        map.put("condition", condition);
        map.put("keyword", keyword);
        
                
        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows,  dataCount) ;
       
        if(total_page < current_page) 
            current_page = total_page;
      
        int offset=(current_page-1)*rows;
		if(offset<0) offset=0; 
		map.put("offset", offset);
		map.put("rows", rows);

        List<Event> list = service.listEvent(map);
        
        int listNum, n = 0;
        for(Event dto : list) {
            listNum = dataCount - (offset + n);
            dto.setListNum(listNum);
            n++;
        }

        String query = "order="+order+"&mode="+mode;
        String listUrl;
        
        if(keyword.length()!=0) {
        	query += "&condition=" +condition + 
        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        listUrl = cp+"/event/"+mode+"?"+query;
        
        //이부분 추가했씁니다.
        String articleUrl = cp+"/event/article?"+query+"&page="+current_page;	
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
        
        if(keyword.length()!=0)
			model.addAttribute("search", "search");
        
        model.addAttribute("subMenu", mode.equals("current")?0:1);
        
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("total_page", total_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("order", order);
		model.addAttribute("mode", mode);
		
		//이부분 추가했씁니다.
		model.addAttribute("articleUrl", articleUrl);
		return ".four.event.current.list";
	}
	
	@RequestMapping(value="/event/created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception {
		
		model.addAttribute("subMenu", "0");
		model.addAttribute("mode","created");
				
		return ".four.event.current.created";
	}
	
	@RequestMapping(value="/event/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int eventNum,
			Model model) throws Exception {
		
		Event dto = service.readEvent(eventNum);
		if(dto==null) {
			return "redirect:/event/current";
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("subMenu", "0");
		model.addAttribute("mode", "update");
		
		return ".four.event.current.created";
	}
		
	@RequestMapping(value="/event/created", method=RequestMethod.POST)
	public String createdSubmit(Event dto
			,HttpServletRequest req
			,HttpSession session) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String path=root+"uploads"+File.separator+"event";
		
		try {
			service.insertEvent(dto, path);
		} catch (Exception e) {
		}
    	
		return "redirect:/event/current";
    }
	
	@RequestMapping(value="/event/update", method=RequestMethod.POST)
	public String updateSubmit(Event dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
			String root=session.getServletContext().getRealPath("/");
			String pathname=root+"uploads"+File.separator+"event";
		
		try {
			service.updateEvent(dto, pathname);
		} catch (Exception e) {
		}
    	
		return "redirect:/event/current";
    }
	
	@RequestMapping(value="/event/delete")
	public String delete(
				@RequestParam int eventNum,
				@RequestParam(defaultValue="all") String condition,
				@RequestParam(defaultValue="") String keyword
			) throws Exception {

		keyword = URLDecoder.decode(keyword, "utf-8");
						
		try {
			service.deleteEvent(eventNum);
		} catch (Exception e) {
		}

		return "redirect:/event/current";
    }
	
	@RequestMapping(value="/event/article")
	public String article(
			@RequestParam int eventNum,
			@RequestParam (defaultValue="1")String page,
			@RequestParam(defaultValue="all") String condition,
			@RequestParam(defaultValue="") String keyword,
			@RequestParam(defaultValue="0") int order,
			@RequestParam String mode,
			Model model) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");
		
		String query="page="+page+"&order="+order+"&mode="+mode;
		if(keyword.length()!=0) {
			query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		}
		
		service.updateHitCount(eventNum);

		Event dto = service.readEvent(eventNum);
		if (dto == null)
			return "redirect:/event/"+mode+"?"+query;
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("eventNum", eventNum);
		map.put("order", order);
		map.put("mode", mode);
		map.put("eDate", dto.getEdate());
		
		Event preReadDto = service.preReadEvent(map);
		Event nextReadDto = service.nextReadEvent(map);
		
		model.addAttribute("subMenu", mode.equals("current")?0:1);
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		model.addAttribute("mode", mode);
		model.addAttribute("order", order);
				
		return ".four.event.current.article";
	}
}
