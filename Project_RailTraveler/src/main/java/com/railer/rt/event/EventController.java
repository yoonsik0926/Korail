package com.railer.rt.event;

import java.net.URLDecoder;
import java.net.URLEncoder;
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

import com.railer.rt.common.MyUtil;

@Controller("event.eventController")
public class EventController {
	
	@Autowired 
	private EventService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/event/current")
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
       
        Map<String, Object> map = new HashMap<String, Object>();
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

        String query = "order="+order;
        String listUrl;
                
        if(keyword.length()!=0) {
        	query += "&condition=" +condition + 
        	         "&keyword=" + URLEncoder.encode(keyword, "utf-8");	
        }
        
    	listUrl = cp+"/event/current?"+query;
        
        String paging = myUtil.paging(current_page, total_page, listUrl);
        
        if(keyword.length()!=0)
			model.addAttribute("search", "search");
        model.addAttribute("list", list);
        model.addAttribute("page", current_page);
        model.addAttribute("total_page", total_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("paging", paging);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("order", order);
		
		
		return ".four.event.current.list";
	}

	@RequestMapping(value="/event/last")
	public String last(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		model.addAttribute("title", "지난 이벤트");
		return ".four.event.last.list";
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
			Model model) throws Exception {
		
		model.addAttribute("subMenu", "0");
		model.addAttribute("mode", "update");

		
		return ".four.event.current.created";
	}
		
	@RequestMapping(value="/event/created", method=RequestMethod.POST)
	public String createdSubmit(Event dto, HttpServletRequest req) throws Exception {
		try {
			service.insertEvent(dto);
		} catch (Exception e) {
		}
    	
		return "redirect:/event/current";
    }
	
	@RequestMapping(value="/event/update", method=RequestMethod.POST)
	public String updateSubmit(Event dto) throws Exception {
		try {
			service.updateEvent(dto);
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
	
}
