package com.railer.rt.info;

import java.util.ArrayList;
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

@Controller("info.stationController")
public class StationController {
	@Autowired
	private StationService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/station/info")
	public String info(
			Model model,
			@RequestParam(value="page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue="0") int locNum,
			HttpServletRequest req) throws Exception {
		
		String cp = req.getContextPath();
		
		int rows = 9;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("locNum", locNum);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		if(total_page<current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page -1 )*rows;
		if (offset <0)
			offset = 0;
		
		map.put("locNum", locNum);
		map.put("offset", offset);
		map.put("rows", rows);
		
		List<Station> staList = service.listStation(map);
		
		String listUrl = cp + "/station/info?locNum="+locNum;
		
		String paging = myUtil.paging(current_page, total_page,listUrl);
		
		List<Station> locList = service.listLocation();
		
		model.addAttribute("locNum", locNum);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		model.addAttribute("staList",staList);
		model.addAttribute("locList",locList);
		
		model.addAttribute("subMenu", "1");
		
		return ".four.info.station.info";
	}
	
	@RequestMapping(value="station/modal", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> readStation(
			@RequestParam int staNum){
		
		Station dto = service.readStation(staNum);
		
		Map<String, Object> model = new HashMap<>();
		model.put("dto", dto);
		
		
		int count = service.countBenefit(staNum);
		if(count==0) {
			List<Station> beneList = new ArrayList<>();
			model.put("beneList", beneList);
		} else {
			List<Station> beneList = service.listBenefit(staNum);
			model.put("beneList", beneList);
		}	
		
		
		return model;
	}

	

	@RequestMapping(value="/station/created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception {
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("mode","created");
		
		
		return ".four.info.station.created";
	}
	
	public String createdSubmit() {
		
		return "redirect:/station/info";
	}
	
	@RequestMapping(value="/station/update", method=RequestMethod.GET)
	public String updateForm(
			Model model) throws Exception {
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("mode", "update");

		
		return ".four.info.station.created";
	}
}
