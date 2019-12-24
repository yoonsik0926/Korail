package com.railer.rt.info;

import java.io.File;
import java.util.ArrayList;
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

import com.railer.rt.common.FileManager;
import com.railer.rt.common.MyUtil;

@Controller("info.stationController")
public class StationController {
	@Autowired
	private StationService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
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
	
	@RequestMapping(value="station/modal")
	public String readStation(
			@RequestParam int staNum,
			@RequestParam String page,
			@RequestParam int locNum,
			Model model){
		
		Station dto = service.readStation(staNum);

		int count = service.countBenefit(staNum);
		
		if(count==0) {
			List<Station> beneList = new ArrayList<>();
			model.addAttribute("beneList", beneList);
		} else {
			List<Station> beneList = service.listBenefit(staNum);
			model.addAttribute("beneList", beneList);
		}	
		
		model.addAttribute("dto", dto);
		model.addAttribute("count", count);
		model.addAttribute("page",page);
		model.addAttribute("locNum",locNum);
		
		return "info/station/modal";
	}

	

	@RequestMapping(value="/station/created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception {
		
		List<Station> locList = service.listLocation();
		
		model.addAttribute("locList",locList);
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("mode","created");
		
		return ".four.info.station.created";
	}
	
	@RequestMapping(value="/station/created", method=RequestMethod.POST)
	public String createdSubmit(
			Station dto,
			HttpSession session) {

		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"resource"+File.separator+"images"+File.separator+"station";
		
		try {
			service.insertStation(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/station/info";
	}
	
	@RequestMapping(value="/station/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int staNum,
			@RequestParam String page,
			@RequestParam int locNum,
			HttpSession session,
			Model model) throws Exception {

		Station dto = service.readStation(staNum);
		if(dto == null) {
			return "redirect:/station/info?page="+page;
		}
		
		//지역 선택
		List<Station> locList = service.listLocation();
		model.addAttribute("locList",locList);
		
		model.addAttribute("dto",dto);
		model.addAttribute("page",page);
		model.addAttribute("mode","update");		
		
		model.addAttribute("subMenu", "1");
		
		return ".four.info.station.created";
	}
	
	@RequestMapping(value="/station/update", method=RequestMethod.POST)
	public String updateSubmit(
			Station dto,
			@RequestParam String page,
			@RequestParam int locNum,
			HttpSession session) {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"resource"+File.separator+"images"+File.separator+"station";
		
		try {
			service.updateStation(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/station/info?page="+page+"&locNum="+locNum;
	}
	
	@RequestMapping(value="/station/delete")
	public String deleteStation(
			@RequestParam int staNum,
			@RequestParam int locNum,
			@RequestParam String page,
			HttpSession session) throws Exception{
		
		String query = "page="+page+"&locNum="+locNum;
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"station";
		
		Map<String, Object> map = new HashMap<>();
		map.put("remove", "station");
		map.put("staNum", staNum);
		
		service.deleteBenefit(map);
		
		service.deleteStation(staNum, pathname);
		
		return "redirect:/station/info?"+query;
	}
	
	@RequestMapping(value="station/deleteFile")
	public String deleteFile(
			@RequestParam int staNum,
			@RequestParam int locNum,
			@RequestParam String page,
			HttpSession session) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"station";
		String query = "staNum="+staNum+"&locNum="+locNum+"&page="+page;
		
		Station dto = service.readStation(staNum);
		if(dto == null) {
			return "redirect:/station/info?page="+page+"&locNum="+locNum;
		}
		
		try {
			if(dto.getImageFilename()!=null) {
				fileManager.doFileDelete(dto.getImageFilename(),pathname);
				dto.setImageFilename("");
				service.updateStation(dto, pathname);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/station/update?"+query;
	}
	
	//역별 혜택
	@RequestMapping(value="/station/benefit/created", method=RequestMethod.GET)
	public String createdBenefitForm(
			@RequestParam int staNum,
			@RequestParam int locNum,
			Model model) throws Exception {
		
		List<Station> tourCategory = service.listTourCate();
		
		model.addAttribute("tourCategory",tourCategory);
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("mode","created");
		model.addAttribute("staNum",staNum);
		model.addAttribute("locNum",locNum);
		
		return ".four.info.station.benefit";
	}
	
	@RequestMapping(value="/station/benefit/created", method=RequestMethod.POST)
	public String createdBenefitSubmit(
			Station dto,
			@RequestParam int staNum,
			@RequestParam int cateNum,
			@RequestParam int locNum,
			@RequestParam String page,
			HttpSession session) {
		
		String query = "locNum="+locNum+"&page="+page;
		try {
			dto.setStaNum(staNum);
			dto.setCateNum(cateNum);
			service.insertBenefit(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/station/info?"+query;
	}
	
	@RequestMapping(value="/station/benefit/delete")
	public String deleteBenefit(
			@RequestParam int beneNum,
			@RequestParam int locNum,
			@RequestParam String page,
			HttpSession session) throws Exception{
		
		String query = "locNum="+locNum+"&page="+page;
		
		Map<String, Object> map = new HashMap<>();
		map.put("beneNum", beneNum);
		
		service.deleteBenefit(map);
		
		return "redirect:/station/info?"+query;
	}
	
	@RequestMapping(value="/station/benefit/update", method=RequestMethod.GET)
	public String updateBenefitForm(
			@RequestParam int staNum,
			@RequestParam int beneNum,
			@RequestParam String page,
			@RequestParam int locNum,
			HttpSession session,
			Model model) throws Exception {

		Station dto = service.readBenefit(beneNum);
		
		if(dto == null) {
			return "redirect:/station/info?locNum="+locNum+"&page="+page;
		}
		
		List<Station> tourCategory = service.listTourCate();
		model.addAttribute("tourCategory",tourCategory);
		
		model.addAttribute("dto",dto);
		model.addAttribute("page",page);
		model.addAttribute("mode","update");
		model.addAttribute("beneNum",beneNum);
		model.addAttribute("locNum",locNum);
		model.addAttribute("staNum",staNum);
			
		model.addAttribute("subMenu", "1");
		
		return ".four.info.station.benefit";
	}
	
	@RequestMapping(value="/station/benefit/update", method=RequestMethod.POST)
	public String updateBenefitSubmit(
			Station dto,
			@RequestParam int staNum,
			@RequestParam int beneNum,
			@RequestParam int cateNum,
			@RequestParam String page,
			@RequestParam int locNum) {
	
		try {
			dto.setStaNum(staNum);
			dto.setCateNum(cateNum);
			service.updateBenefit(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/station/info?page="+page+"&locNum="+locNum;
	}
	
	
}
