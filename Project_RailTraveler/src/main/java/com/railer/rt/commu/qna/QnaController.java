package com.railer.rt.commu.qna;

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
import com.railer.rt.commu.qna.Qna;
import com.railer.rt.member.SessionInfo;

@Controller("commu.qna.qnaController")
public class QnaController {

	@Autowired
	QnaService service;

	@Autowired
	private FileManager fileManager;

	@Autowired
	private MyUtil util;
	
	@RequestMapping(value="/qna/qna")
	public String list(@RequestParam(name = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String condition,
			@RequestParam(defaultValue = "all") String category,
			@RequestParam(defaultValue = "0") String answer,
			@RequestParam(defaultValue = "") String keyword,
			HttpServletRequest req, Model model , HttpSession session) throws Exception {
				String cp = req.getContextPath();
				SessionInfo info = (SessionInfo) session.getAttribute("member");
		int rows = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			keyword = URLDecoder.decode(keyword, "UTF-8");
		}

		Map<String, Object> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("category", category);
 
		dataCount = service.dataCount(map);
		total_page = util.pageCount(rows, dataCount);

		// 다른사람이 자료를 삭제해서 총 페이지가 줄어든 경우
		if (total_page < current_page) {
			current_page = total_page;
		}

		List<Qna> noticeList = null;
		noticeList = service.listQnaTop();
		
		// 전체 페이지 수 구하기, 리스트에 출력할 데이터를 가져오기
				int offset = (current_page - 1) * rows;
				if (offset < 0) {
					offset = 0; 
				}
				map.put("offset", offset);
				map.put("rows", rows);
		
				// 글 리스트 
				List<Qna> list = service.listQna(map);

				// 리스트의 번호
				Date endDate = new Date();
				long gap;	// 최근 게시물 표시
				int listNum, n = 0;
				for (Qna dto : list) {
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
				
				//공지사항 맥이기
				for (Qna dto : noticeList) {

					SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					Date beginDate = formatter.parse(dto.getCreated());
					// 날짜 차이 (시간)
					gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
					dto.setGap(gap);
					dto.setCreated(dto.getCreated().substring(0, 10));
				}
				

				String query = "";
				String listUrl;
				String articleUrl;
				if (keyword.length() != 0) {
					query = "condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
				} 
				if (!category.equals("all")) {
					if (query.length() != 0) {
						query+="&";
					}
					query = "category=" + URLEncoder.encode(category, "UTF-8");
				}
				
				listUrl = cp + "/qna/qna";
				articleUrl = cp + "/qna/article?page=" + current_page;

				if (query.length() != 0) {
					listUrl = listUrl + "?" + query;
					articleUrl = articleUrl + "&" + query;
				}
 
				String paging = util.paging(current_page, total_page, listUrl);

				if (keyword.length() != 0)
					model.addAttribute("search", "search");
				model.addAttribute("noticeList", noticeList);
				model.addAttribute("list", list);
				model.addAttribute("articleUrl", articleUrl);
				model.addAttribute("page", current_page);
				model.addAttribute("dataCount", dataCount);
				model.addAttribute("paging", paging);
				model.addAttribute("category", category);
				model.addAttribute("condition", condition);
				model.addAttribute("keyword", keyword);

		model.addAttribute("subMenu", "1");
		return ".four.commu.qna.qna";
	}
	@RequestMapping(value="/qna/created")
	public String createdForm(Model model) throws Exception {
		
		model.addAttribute("subMenu", "1");
		model.addAttribute("mode", "created");
		return ".four.commu.qna.created";
	}
	@RequestMapping(value = "/qna/created", method = RequestMethod.POST)
	public String createdSubmit(Qna	dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "qna";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.insertQna(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/qna/qna";
	}
	
	@RequestMapping(value="/qna/createdReArticle")
	public String createdReArticleForm(@RequestParam int qnaNum, @RequestParam String categoryNum, @RequestParam String categoryName, @RequestParam(defaultValue = "1") String page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "all") String category, @RequestParam(defaultValue = "") String keyword,
			HttpServletResponse resp, Model model, HttpSession session) throws Exception {
		
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		if (! category.equals("all")) {
			query = "&category=" + URLEncoder.encode(category, "UTF-8");
		}
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> readMap = new HashMap<String, Object>();
		readMap.put("userId", info.getUserId());
		readMap.put("qnaNum", qnaNum);
		
		Qna dto = null;
		dto = service.readQna(readMap);
		System.out.println(dto.toString());
		System.out.println(dto.toString());
		System.out.println(dto.toString());
		System.out.println(dto.toString());
		System.out.println(dto.toString());
		System.out.println(dto.toString());
		List<Qna> listFile=service.listFile(qnaNum);
		
		model.addAttribute("listFile", listFile);
		model.addAttribute("dto", dto);
		model.addAttribute("query", query);
		model.addAttribute("subMenu", "1");
		model.addAttribute("mode", "reArticle");
		return ".four.commu.qna.created";
	}
	
	@RequestMapping(value = "/qna/reArticle", method = RequestMethod.POST)
	public String createdReArticleSubmit(Qna	dto, HttpSession session, String pageNo, Model model) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "qna";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.insertQna(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("qnaNum", dto.getAnswer());
		return "redirect:/qna/article?qnaNum="+dto.getAnswer();
	}
	
	@RequestMapping(value="/qna/article")
	public String article(@RequestParam int qnaNum, @RequestParam(defaultValue = "1") String page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "all") String category, @RequestParam(defaultValue = "") String keyword,
			@CookieValue(defaultValue = "0") int cnum, HttpServletResponse resp, Model model, HttpSession session) throws Exception {
 
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}
		if (! category.equals("all")) {
			query = "&category=" + URLEncoder.encode(category, "UTF-8");
		}

		// 조회수 증가 및 해당 레코드 가져 오기
		if (qnaNum != cnum) {
			service.updateHitCount(qnaNum);

			Cookie ck = new Cookie("cnum", Integer.toString(qnaNum));
			resp.addCookie(ck);
		}
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId;
		if(info==null) {
			userId= "x";
		}else {
			userId= info.getUserId();
		}
		Map<String, Object> readMap = new HashMap<String, Object>();
		readMap.put("userId", userId);
		readMap.put("qnaNum", qnaNum);
		
		Qna dto = service.readQna(readMap);
		
		if (dto == null) {
			return "redirect:/qna/qna?" + query;
		}

		if(dto.getUserId().equals("admin")) {
			List<Qna> noticeList = null;
			noticeList = service.listQnaTop();

			model.addAttribute("noticeList", noticeList);
		}
		
		int rows=5;
		int total_page=0;
		int dataCount=0;
		int current_page = Integer.parseInt("1");
		Map<String, Object> map1=new HashMap<>();
		map1.put("qnaNum", qnaNum);
		map1.put("category", category);
		
		dataCount=service.reArticleCount(map1);
		total_page = util.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page=total_page;
		
		int offset = (current_page-1) * rows;
		if(offset < 0) offset = 0;
		map1.put("offset", offset);
		map1.put("answer", qnaNum);
		map1.put("rows", rows);
		map1.put("userId", userId);
		List<Qna> listReArticle=service.listReQna(map1);
		
		// AJAX 용 페이징
		String paging=util.pagingMethod(current_page, total_page, "listReArticle");
		List<Qna> files = service.listFile(qnaNum);
		
		for (Qna qna : listReArticle) {
			List<com.railer.rt.commu.qna.File> listFs  = service.listFile1(qna.getQnaNum());
			if(!listFs.isEmpty()) {
				qna.setFiles(listFs);
			}
		}
		int reArticleSize=0;
		if(listReArticle != null) {
			reArticleSize = listReArticle.size();
		}
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("qnaNum", qnaNum);

		Qna preReadDto = service.preReadQna(map);
		Qna nextReadDto = service.nextReadQna(map);
		
		model.addAttribute("listReArticle", listReArticle);
		model.addAttribute("reArticleCount", dataCount);
		
		model.addAttribute("reArticleSize", reArticleSize);
		model.addAttribute("dto", dto);
		model.addAttribute("files", files);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		model.addAttribute("subMenu", "1");
		
		return ".four.commu.qna.article";
	}
	

	// 댓글 및 댓글의 답글 등록 : AJAX-JSON
	@RequestMapping(value="/qna/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			QnaReply dto, 
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";

		int rows=5;
		int total_page=0;
		int dataCount=0;
		
		int current_page = 1;
		
		try {
			
			dto.setUserId(info.getUserId());
			service.insertQnaReply(dto);
			
			Map<String, Object> map=new HashMap<>();
			map.put("qnaNum", dto.getQnaNum());
			 
			dataCount=service.replyCount(map);
			total_page = util.pageCount(rows, dataCount);
			if(current_page>total_page)
				current_page=total_page;
			
		} catch (Exception e) { 
			state="false";
		} 
		   
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("total_page", total_page);
		model.put("pageNo", current_page);
		return model;
	} 
	
	// 채택하기 : AJAX-JSON
	@RequestMapping(value="/qna/updateEnable")
	public String updateEnable(
			@RequestParam int enable, @RequestParam int qnaNum,
			HttpSession session
			) {
		 
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("qnaNum", qnaNum);
			map.put("enable", enable);
			
			service.updateEnable(map);
		} catch (Exception e) { 
			state="false";
		} 
		
		return "forward:/qna/article?qnaNum"+qnaNum;
	} 
	 
	
	// 댓글 리스트 : AJAX-TEXT
			@RequestMapping(value="/qna/listReply")
			public String listReply(
					@RequestParam int qnaNum, @RequestParam String userId,
					@RequestParam(value="pageNo", defaultValue="1") int current_page,
					Model model
					) throws Exception {
				
				int rows=5;
				int total_page=0;
				int dataCount=0;
				
				Map<String, Object> map=new HashMap<>();
				map.put("qnaNum", qnaNum);
				
				dataCount=service.replyCount(map);
				total_page = util.pageCount(rows, dataCount);
				if(current_page>total_page)
					current_page=total_page;
				 
		        int offset = (current_page-1) * rows;
				if(offset < 0) offset = 0;
		        map.put("offset", offset);
		        map.put("rows", rows);
				List<QnaReply> listReply=service.listReply(map);
				for(QnaReply dto : listReply) {
					dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
//					System.out.println(dto.toString());
				}
				   
				// AJAX 용 페이징
				String paging=util.pagingMethod(current_page, total_page, "listPage",qnaNum);
				
				// 포워딩할 jsp로 넘길 데이터 
				model.addAttribute("qnaNum", qnaNum);
				model.addAttribute("writer", userId);
				model.addAttribute("listReply", listReply);
				model.addAttribute("pageNo", current_page);
				model.addAttribute("replyCount", dataCount);
				model.addAttribute("total_page", total_page);
				model.addAttribute("paging", paging);
				
				return "commu/qna/listReply";
				
			}
			
			// 답글 리스트 : AJAX-TEXT
			@RequestMapping(value="/qna/listReArticle")
			public String listReArticle(
					@RequestParam int qnaNum, @RequestParam String userId, @RequestParam String category,
					@RequestParam(value="pageNo", defaultValue="1") int current_page,
					Model model
					) throws Exception {
				
				int rows=5;
				int total_page=0;
				int dataCount=0;
				
				Map<String, Object> map=new HashMap<>();
				map.put("qnaNum", qnaNum);
				map.put("category", category);
				
				dataCount=service.reArticleCount(map);
				total_page = util.pageCount(rows, dataCount);
				if(current_page>total_page)
					current_page=total_page;
				
				int offset = (current_page-1) * rows;
				if(offset < 0) offset = 0;
				map.put("offset", offset);
				map.put("answer", qnaNum);
				map.put("rows", rows);
				List<Qna> listReArticle=service.listQna(map);
				
				// AJAX 용 페이징
				String paging=util.pagingMethod(current_page, total_page, "listReArticle");
				
				// 포워딩할 jsp로 넘길 데이터 
				model.addAttribute("writer", userId);
				model.addAttribute("listReArticle", listReArticle);
				model.addAttribute("reArticleCount", dataCount);
				
				return "commu/qna/listReArticle";
				
			}
			
			@RequestMapping(value="/qna/delete")
			public String delete(
					@RequestParam int qnaNum,
					@RequestParam String page,
					@RequestParam(defaultValue="all") String condition,
					@RequestParam(defaultValue="") String keyword,
					HttpSession session) throws Exception {
				SessionInfo info=(SessionInfo)session.getAttribute("member");
				
				keyword = URLDecoder.decode(keyword, "utf-8");
				String query="page="+page;
				if(keyword.length()!=0) {
					query+="&condition="+condition+"&keyword="+URLEncoder.encode(keyword, "UTF-8");
				} 
				
				String root=session.getServletContext().getRealPath("/");
				String pathname=root+"uploads"+File.separator+"qna";
				
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("userId", info.getUserId());
				map.put("qnaNum", qnaNum);
				service.deleteQna(map, pathname);
				
				return "redirect:/qna/qna?"+query;
			}
			
			@RequestMapping(value="/qna/updateReArticle")
			public String updateReArticleForm(@RequestParam int qnaNum, @RequestParam String categoryNum, @RequestParam String categoryName, @RequestParam(defaultValue = "1") String page,
					@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "all") String category, @RequestParam(defaultValue = "") String keyword,
					HttpServletResponse resp, Model model, HttpSession session) throws Exception {
				
				
				keyword = URLDecoder.decode(keyword, "utf-8");

				String query = "page=" + page;
				if (keyword.length() != 0) {
					query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
				}
				if (! category.equals("all")) {
					query = "&category=" + URLEncoder.encode(category, "UTF-8");
				}
				
				SessionInfo info = (SessionInfo) session.getAttribute("member");
				String userId;
				if(info==null) {
					return "redirect:/qna/article?qnaNum="+qnaNum;
				}else {
					userId= info.getUserId();
				}
				
				Map<String, Object> readMap = new HashMap<String, Object>();
				readMap.put("userId", userId);
				readMap.put("qnaNum", qnaNum);
				
				Qna dto = service.readQna(readMap);
				System.out.println(dto.toString());
				List<Qna> listFile=service.listFile(qnaNum);
				
				model.addAttribute("listFile", listFile);
				model.addAttribute("qnaNum", qnaNum);
				model.addAttribute("categoryName", categoryName);
				model.addAttribute("categoryNum", categoryNum);
				model.addAttribute("query", query);
				model.addAttribute("dto", dto);
				model.addAttribute("subMenu", "1");
				model.addAttribute("mode", "reArticleUpdate");
				return ".four.commu.qna.created";
			}
			
			@RequestMapping(value = "/qna/reArticleUpdate", method = RequestMethod.POST)
			public String updateReArticleSubmit(Qna dto, HttpSession session, String pageNo, Model model) throws Exception {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "qna";
				SessionInfo info = (SessionInfo) session.getAttribute("member");
				try {
					dto.setUserId(info.getUserId());
					service.insertQna(dto, pathname);
				} catch (Exception e) {
					e.printStackTrace();
				}

				model.addAttribute("qnaNum", dto.getAnswer());
				return "redirect:/qna/article?qnaNum="+dto.getAnswer();
			}
			
			@RequestMapping(value="/qna/update", method=RequestMethod.GET)
			public String updateForm(
					@RequestParam int qnaNum,
					@RequestParam String page,
					HttpSession session,
					Model model) throws Exception {
				SessionInfo info=(SessionInfo)session.getAttribute("member");
				
				Map<String, Object> readMap = new HashMap<String, Object>();
				readMap.put("userId", info.getUserId());
				readMap.put("qnaNum", qnaNum);
				
				Qna dto = null;
				dto = service.readQna(readMap);
				System.out.println(dto.toString());
				List<Qna> listFile=service.listFile(qnaNum);
				
				if(dto==null) {
					return "redirect:/qna/qna?page="+page;
				}

				if(! info.getUserId().equals(dto.getUserId())) {
					return "redirect:/qna/qna?page="+page;
				}
				model.addAttribute("listFile", listFile);
				model.addAttribute("dto", dto);
				model.addAttribute("mode", "update");
				model.addAttribute("page", page);
				model.addAttribute("subMenu", "3");
				return ".four.commu.qna.created";
			}
			
			@RequestMapping(value="/qna/update", method=RequestMethod.POST)
			public String updateSubmit(
					Qna dto, 
					@RequestParam String page,
					HttpSession session) throws Exception {
				
				String root=session.getServletContext().getRealPath("/");
				String pathname=root+"uploads"+File.separator+"qna";		

				try {
					service.updateQna(dto, pathname);		
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				return "redirect:/qna/article?qnaNum="+dto.getQnaNum()+"&page="+page;
			} 
			
			@RequestMapping(value="/qna/download")
			public void download(
					@RequestParam int qnaFileNum,
					HttpServletResponse resp,
					HttpSession session) throws Exception {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "qna";

				boolean b = false; 
				
				Qna dto = service.readFile(qnaFileNum);
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

			@RequestMapping(value="/qna/zipDownload")
			public void zipdownload(
					@RequestParam int qnaNum,
					HttpServletResponse resp,
					HttpSession session) throws Exception {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "qna";

				boolean b = false;
				
				List<Qna> listFile = service.listFile(qnaNum);
				if(listFile.size()>0) {
					String []sources = new String[listFile.size()];
					String []originals = new String[listFile.size()];
					String zipFilename = qnaNum+".zip";
					
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
			
			
			// 댓글의 좋아요/싫어요 추가 : AJAX-JSON
			@RequestMapping(value = "/qna/insertQnaBookmark", method = RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> insertQnaBookmark(@RequestParam Map<String, Object> paramMap, HttpSession session) {
				String state = "true";

				SessionInfo info = (SessionInfo) session.getAttribute("member");
				Map<String, Object> model = new HashMap<>();

				try {
					paramMap.put("userId", info.getUserId());
					service.insertQnaBookmark(paramMap);
				} catch (Exception e) {
					state = "false";
				}
				int qnaNum = Integer.parseInt((String) paramMap.get("qnaNum"));
				int bookmarkCount = 0;
				try {
					bookmarkCount = service.bookmarkCount(qnaNum);
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				model.put("bookmarkCount", bookmarkCount);
				model.put("state", state);
				return model;
			}

			
			// 댓글의 좋아요/싫어요 추가 : AJAX-JSON
			@RequestMapping(value = "/qna/deleteQnaBookmark", method = RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> deleteQnaBookmark(@RequestParam Map<String, Object> paramMap, HttpSession session) {
				String state = "true";

				SessionInfo info = (SessionInfo) session.getAttribute("member");
				Map<String, Object> model = new HashMap<>();

				try {
					paramMap.put("userId", info.getUserId());
					service.deleteQnaBookmark(paramMap);
				} catch (Exception e) {
					state = "false";
				}
				int qnaNum = Integer.parseInt((String) paramMap.get("qnaNum"));
				int bookmarkCount = 0;
				try {
					bookmarkCount = service.bookmarkCount(qnaNum);
				} catch (NumberFormatException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				model.put("bookmarkCount", bookmarkCount);
				model.put("state", state);
				return model;
			}
			
			// 파일목록 : AJAX-JSON
			@RequestMapping(value = "/qna/listFile", method = RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> listFile(@RequestParam int qnaNum, HttpSession session) {
				String state = "true";

				Map<String, Object> model = new HashMap<>();
				List<Qna> files=null;;
				try {
					files = service.listFile(qnaNum);
				} catch (Exception e) {
					state = "false";
				}
				model.put("files", files);
				model.put("state", state);
				return model;
			}				
			@RequestMapping(value="/qna/deleteFile", method=RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> deleteFile(
					@RequestParam int qnaFileNum,
					HttpServletResponse resp,
					HttpSession session) throws Exception {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "qna";
				
				Qna dto=service.readFile(qnaFileNum);
				if(dto!=null) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
				
				Map<String, Object> model = new HashMap<>(); 
				try {
					Map<String, Object> map=new HashMap<String, Object>();
					map.put("field", "qnaFileNum");
					map.put("num", qnaFileNum);
					service.deleteFile(map);
					model.put("state", "true");
				} catch (Exception e) {
					model.put("state", "false");
				}
				
				return model;
			}
}
