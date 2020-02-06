package com.railer.rt.commu.notice;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.railer.rt.common.FileManager;
import com.railer.rt.common.MyUtil;
import com.railer.rt.member.SessionInfo;

@Controller("commu.notice.noticeController")
public class NoticeController {
	
	@Autowired
	NoticeServiceImpl service;
	
	@Autowired
	private FileManager fileManager;

	@Autowired
	private MyUtil util;

	
	/**
	 * 공지사항 목록
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/notice/notice")
	public String list(@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req, Model model) throws Exception {

		String cp = req.getContextPath();

		int rows = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);

		dataCount = service.dataCount(map);
		total_page = util.pageCount(rows, dataCount);

		// 다른사람이 자료를 삭제해서 총 페이지가 줄어든 경우
		if (total_page < current_page) {
			current_page = total_page;
		}
		

		// 전체 페이지 수 구하기, 리스트에 출력할 데이터를 가져오기
		int offset = (current_page - 1) * rows;
		if (offset < 0) {
			offset = 0;
		}
		map.put("offset", offset);
		map.put("rows", rows);

		// 글 리스트
		List<Notice> list = service.listNotice(map);

		// 리스트의 번호
		Date endDate = new Date();
		long gap;
		int listNum, n = 0;
		try {
		for (Notice dto : list) {
			listNum = dataCount - (offset + n);
			dto.setListNum(listNum);

			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date beginDate = formatter.parse(dto.getCreated());
			// 날짜 차이 (시간)
			gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
			dto.setGap(gap);
			dto.setCreated(dto.getCreated().substring(0, 10));
			n++;
		}
		}catch (Exception e) {
			// TODO: handle exception
		}
		String query = "";
		String listUrl;
		String articleUrl;
		if (keyword.length() != 0) {
			query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");

		}
		listUrl = cp + "/notice/notice";
		articleUrl = cp + "/notice/article?page=" + current_page;

		if (query.length() != 0) {
			listUrl = listUrl + "?" + query;
			articleUrl = articleUrl + "&" + query;
		}
 
		String paging = util.paging(current_page, total_page, listUrl);

		if(keyword.length()!=0)
			model.addAttribute("search", "search");
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);

		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("subMenu", "0");

		return ".four.commu.notice.notice";
	}
	
	@RequestMapping(value="/notice/created", method = RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		model.addAttribute("subMenu", "0");
		model.addAttribute("mode", "created");
		return ".four.commu.notice.created";
	}
	
	@RequestMapping(value = "/notice/created", method = RequestMethod.POST)
	public String createdSubmit(Notice dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.insertNotice(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/notice/notice";
	}
	
	@RequestMapping(value="/notice/article", method=RequestMethod.GET)
	public String article(@RequestParam int noticeNum,
            @RequestParam(defaultValue="1") String page,
            @RequestParam(defaultValue="all") String condition,
            @RequestParam(defaultValue="") String keyword,
            @CookieValue(defaultValue="0") int cnum,
            HttpServletResponse resp,
            Model model) throws Exception {
		
		   keyword = URLDecoder.decode(keyword, "utf-8");
		      
		      String query="page="+page;
		      if(keyword.length()!=0) {
		         query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
		      }

		      // 조회수 증가 및 해당 레코드 가져 오기
		      if(noticeNum!=cnum) {
		         service.updateHitCount(noticeNum);
		         
		         Cookie ck=new Cookie("cnum", Integer.toString(noticeNum));
		         resp.addCookie(ck);
		      }
		      
		      Notice dto = service.readNotice(noticeNum);
		
		      if(dto==null) {
		    	  return "redirect:/notice/notice?"+query;
		      }
		      
		      List<Notice> files = service.listFile(noticeNum);
		
		      // 이전 글, 다음 글
		      Map<String, Object> map = new HashMap<String, Object>();
		      map.put("condition", condition);
		      map.put("keyword", keyword);
		      map.put("noticeNum", noticeNum);

		      Notice preReadDto = service.preReadNotice(map);
		      Notice nextReadDto = service.nextReadNotice(map);
		      model.addAttribute("dto", dto);
		      model.addAttribute("files", files);
		      model.addAttribute("preReadDto", preReadDto);
		      model.addAttribute("nextReadDto", nextReadDto);
		      model.addAttribute("page", page);
		      model.addAttribute("query", query);
		      
		model.addAttribute("subMenu", "0");
		
		return ".four.commu.notice.article";
	}
	
	@RequestMapping(value="/notice/download")
	public void download(
			@RequestParam int noticeFileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";

		boolean b = false; 
		
		Notice dto = service.readFile(noticeFileNum);
		if(dto!=null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			  
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
		}
		
		if (!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}

	@RequestMapping(value="/notice/zipDownload")
	public void zipdownload(
			@RequestParam int noticeNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";

		boolean b = false;
		
		List<Notice> listFile = service.listFile(noticeNum);
		if(listFile.size()>0) {
			String []sources = new String[listFile.size()];
			String []originals = new String[listFile.size()];
			String zipFilename = noticeNum+".zip";
			
			for(int idx = 0; idx<listFile.size(); idx++) {
				sources[idx] = pathname+File.separator+listFile.get(idx).getSaveFilename();
				originals[idx] = File.separator+listFile.get(idx).getOriginalFilename();
			}
			
			b = fileManager.doZipFileDownload(sources, originals, zipFilename, resp);
		}
		
		if (!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	@RequestMapping(value = "/notice/delete", method = RequestMethod.GET)
	public String delete(@RequestParam int noticeNum, @RequestParam String page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			@CookieValue(defaultValue = "0") int cnum, HttpSession session, Model model) throws Exception {

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "utf-8");
		}
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Notice dto = service.readNotice(noticeNum);
		if(dto!=null && (dto.getUserId().equals(info.getUserId())) || (dto.getUserId().equals("admin") ) ) {
			service.deleteNotice(noticeNum, pathname);
		}
		return "redirect:/notice/notice?"+query;
	}
	
	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int noticeNum,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Notice dto = service.readNotice(noticeNum);

		List<Notice> listFile=service.listFile(noticeNum);
		
		if(dto==null) {
			return "redirect:/notice/notice?page="+page;
		}

		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/notice/notice?page="+page;
		}
		model.addAttribute("listFile", listFile);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("subMenu", "1");
		return ".four.commu.notice.created";
	}

	
	@RequestMapping(value = "/notice/update", method = RequestMethod.POST)
	public String updateSubmit(Notice dto, @RequestParam String page, HttpServletRequest req, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		
		service.updateNotice(dto, pathname);

		return "redirect:/notice/notice?page="+page;
	}
	
	@RequestMapping(value = "/notice/deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int fileNum, HttpSession session
			)throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "notice";
		String state ="false";
		Notice dto= service.readFile(fileNum);
		
		if(dto!=null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			Map<String, Object> map = new HashMap<>();
			map.put("field", "fileNum");
			map.put("num", fileNum);
			
			try {
				service.deleteFile(map);
				state="true";
			} catch (Exception e) {
			}
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
}
