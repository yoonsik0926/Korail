package com.railer.rt.commu.board;

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
import com.railer.rt.commu.board.Board;
import com.railer.rt.commu.board.BoardReply;
import com.railer.rt.commu.board.BoardServiceImpl;
import com.railer.rt.member.SessionInfo;

@Controller("commu.board.boardController")
public class BoardController {
	
	@Autowired
	BoardService service;

	@Autowired
	private FileManager fileManager;

	@Autowired
	private MyUtil util;
	
	
	@RequestMapping(value="/board/board")
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

		List<Board> noticeList = null;
		noticeList = service.listBoardTop();
		
		// 전체 페이지 수 구하기, 리스트에 출력할 데이터를 가져오기
				int offset = (current_page - 1) * rows;
				if (offset < 0) {
					offset = 0; 
				}
				map.put("offset", offset);
				map.put("rows", rows);
		
				// 글 리스트 
				List<Board> list = service.listBoard(map);

				// 리스트의 번호
				Date endDate = new Date();
				long gap;	// 최근 게시물 표시
				int listNum, n = 0;
				for (Board dto : list) {
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
				for (Board dto : noticeList) {

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
				listUrl = cp + "/board/board";
				articleUrl = cp + "/board/article?page=" + current_page;

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

				model.addAttribute("condition", condition);
				model.addAttribute("keyword", keyword);
				
		model.addAttribute("subMenu", "2");
		return ".four.commu.board.board";
	}
	@RequestMapping(value="/board/created")
	public String createdForm(Model model) throws Exception {
		model.addAttribute("subMenu", "2");
		model.addAttribute("mode", "created");
		return ".four.commu.board.created";
	}
	  

	@RequestMapping(value = "/board/created", method = RequestMethod.POST)
	public String createdSubmit(Board	 dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "board";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		try {
			dto.setUserId(info.getUserId());
			service.insertBoard(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/board";
	}
	
	
	@RequestMapping(value="/board/article", method = RequestMethod.GET)
	public String article(@RequestParam int boardNum, @RequestParam(defaultValue = "1") String page,
			@RequestParam(defaultValue = "all") String condition, @RequestParam(defaultValue = "") String keyword,
			@CookieValue(defaultValue = "0") int cnum, HttpServletResponse resp, Model model, HttpSession session) throws Exception {
 
		keyword = URLDecoder.decode(keyword, "utf-8");

		String query = "page=" + page;
		if (keyword.length() != 0) {
			query += "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
		}

		// 조회수 증가 및 해당 레코드 가져 오기
		if (boardNum != cnum) {
			service.updateHitCount(boardNum);

			Cookie ck = new Cookie("cnum", Integer.toString(boardNum));
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
		readMap.put("boardNum", boardNum);
		
		Board dto = service.readBoard(readMap);

		if (dto == null) {
			return "redirect:/board/board?" + query;
		}

		if(dto.getUserId().equals("admin")) {
			List<Board> noticeList = null;
			noticeList = service.listBoardTop();

			model.addAttribute("noticeList", noticeList);
		}
		List<Board> files = service.listFile(boardNum);

		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("boardNum", boardNum);

		Board preReadDto = service.preReadBoard(map);
		Board nextReadDto = service.nextReadBoard(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("files", files);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		model.addAttribute("subMenu", "2");
		
		return ".four.commu.board.article";
	}
	
	// 댓글의 좋아요/싫어요 추가 : AJAX-JSON
		@RequestMapping(value = "/board/insertBoardBookmark", method = RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertBoardBookmark(@RequestParam Map<String, Object> paramMap, HttpSession session) {
			String state = "true";

			SessionInfo info = (SessionInfo) session.getAttribute("member");
			Map<String, Object> model = new HashMap<>();

			try {
				paramMap.put("userId", info.getUserId());
				service.insertBoardBookmark(paramMap);
			} catch (Exception e) {
				state = "false";
			}
			int boardNum = Integer.parseInt((String) paramMap.get("boardNum"));
			int bookmarkCount = 0;
			try {
				bookmarkCount = service.bookmarkCount(boardNum);
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
			@RequestMapping(value = "/board/deleteBoardBookmark", method = RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> deleteBoardBookmark(@RequestParam Map<String, Object> paramMap, HttpSession session) {
				String state = "true";

				SessionInfo info = (SessionInfo) session.getAttribute("member");
				Map<String, Object> model = new HashMap<>();

				try {
					paramMap.put("userId", info.getUserId());
					service.deleteBoardBookmark(paramMap);
				} catch (Exception e) {
					state = "false";
				}
				int boardNum = Integer.parseInt((String) paramMap.get("boardNum"));
				int bookmarkCount = 0;
				try {
					bookmarkCount = service.bookmarkCount(boardNum);
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
			
			// 댓글 및 댓글의 답글 등록 : AJAX-JSON
			@RequestMapping(value="/board/insertReply", method=RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> insertReply(
					BoardReply dto, 
					@RequestParam(value="pageNo", defaultValue="1") int current_page,
					HttpSession session
					) {
				SessionInfo info=(SessionInfo)session.getAttribute("member");
				String state="true";

				int rows=5;
				int total_page=0;
				int dataCount=0;
				
				try {
					
					dto.setUserId(info.getUserId());
					service.insertBoardReply(dto);
					
					Map<String, Object> map=new HashMap<>();
					map.put("boardNum", dto.getBoardNum());
					 
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
			 
			
			// 댓글 및 댓글의 답글 등록 : AJAX-JSON
			@RequestMapping(value="/board/updateReply", method=RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> updateReply(
					BoardReply dto, 
					@RequestParam(value="pageNo", defaultValue="1") int current_page,
					HttpSession session
					) {
				SessionInfo info=(SessionInfo)session.getAttribute("member");
				String state="true";

				int rows=5;
				int total_page=0;
				int dataCount=0;
				
				try {
					
					dto.setUserId(info.getUserId());
					service.updateBoardReply(dto);
					
					Map<String, Object> map=new HashMap<>();
					map.put("boardNum", dto.getBoardNum());
					 
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
						
			// 댓글 및 댓글의 답글 삭제 : AJAX-JSON
			@RequestMapping(value="/board/deleteReply", method=RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> deleteReply(
					@RequestParam Map<String, Object> paramMap,
					@RequestParam(value="pageNo", defaultValue="1") int current_page,
					HttpSession session
					) {
				SessionInfo info=(SessionInfo)session.getAttribute("member");
				String state="true";
				String userId = info.getUserId();
				paramMap.put("userId", userId);
				try {
					service.deleteReply(paramMap);
				} catch (Exception e) {
					state="false";
				}
				
				Map<String, Object> map = new HashMap<>();
				map.put("state", state);
				map.put("pageNo", current_page);
				return map;
			}
			  
			// 댓글 리스트 : AJAX-TEXT
			@RequestMapping(value="/board/listReply")
			public String listReply(
					@RequestParam int boardNum,@RequestParam String userId,
					@RequestParam(value="pageNo", defaultValue="1") int current_page,
					Model model
					) throws Exception {
				
				int rows=5;
				int total_page=0;
				int dataCount=0;
				
				Map<String, Object> map=new HashMap<>();
				map.put("boardNum", boardNum);
				 
				dataCount=service.replyCount(map);
				total_page = util.pageCount(rows, dataCount);
				if(current_page>total_page)
					current_page=total_page;
				 
		        int offset = (current_page-1) * rows;
				if(offset < 0) offset = 0;
		        map.put("offset", offset);
		        map.put("rows", rows);
				List<BoardReply> listReply=service.listReply(map);
				for(BoardReply dto : listReply) {
					dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
//					System.out.println(dto.toString());
				}
				   
				// AJAX 용 페이징
				String paging=util.pagingMethod(current_page, total_page, "listPage");
				
				// 포워딩할 jsp로 넘길 데이터 
				model.addAttribute("writer", userId);
				model.addAttribute("listReply", listReply);
				model.addAttribute("pageNo", current_page);
				model.addAttribute("replyCount", dataCount);
				model.addAttribute("total_page", total_page);
				model.addAttribute("paging", paging);
				
				return "commu/board/listReply";
				
			}
			
			
			
			
			@RequestMapping(value="/board/update", method=RequestMethod.GET)
			public String updateForm(
					@RequestParam int boardNum,
					@RequestParam String page,
					HttpSession session,
					Model model) throws Exception {
				SessionInfo info=(SessionInfo)session.getAttribute("member");
				
				Map<String, Object> readMap = new HashMap<String, Object>();
				readMap.put("userId", info.getUserId());
				readMap.put("boardNum", boardNum);
				
				Board dto = service.readBoard(readMap);
				

				List<Board> listFile=service.listFile(boardNum);
		
				
				if(dto==null) {
					return "redirect:/board/board?page="+page;
				}

				if(! info.getUserId().equals(dto.getUserId())) {
					return "redirect:/board/board?page="+page;
				}
				model.addAttribute("listFile", listFile);
				model.addAttribute("dto", dto);
				model.addAttribute("mode", "update");
				model.addAttribute("page", page);
				model.addAttribute("subMenu", "3");
				return ".four.commu.board.created";
			}

			@RequestMapping(value="/board/update", method=RequestMethod.POST)
			public String updateSubmit(
					Board dto, 
					@RequestParam String page,
					HttpSession session) throws Exception {
				
				String root=session.getServletContext().getRealPath("/");
				String pathname=root+"uploads"+File.separator+"board";		

				try {
					service.updateBoard(dto, pathname);		
				} catch (Exception e) {
				}
				
				return "redirect:/board/board?page="+page;
			} 
			
			@RequestMapping(value="/board/delete")
			public String delete(
					@RequestParam int boardNum,
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
				String pathname=root+"uploads"+File.separator+"board";
				
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("userId", info.getUserId());
				map.put("boardNum", boardNum);
				
				service.deleteBoard(map, pathname);
				
				return "redirect:/board/board?"+query;
			}
			
			@RequestMapping(value="/board/download")
			public void download(
					@RequestParam int boardFileNum,
					HttpServletResponse resp,
					HttpSession session) throws Exception {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "board";

				boolean b = false; 
				
				Board dto = service.readFile(boardFileNum);
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

			@RequestMapping(value="/board/zipDownload")
			public void zipdownload(
					@RequestParam int boardNum,
					HttpServletResponse resp,
					HttpSession session) throws Exception {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "board";

				boolean b = false;
				
				List<Board> listFile = service.listFile(boardNum);
				if(listFile.size()>0) {
					String []sources = new String[listFile.size()];
					String []originals = new String[listFile.size()];
					String zipFilename = boardNum+".zip";
					
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
			
			
			
			
			
			
			@RequestMapping(value="/board/deleteFile", method=RequestMethod.POST)
			@ResponseBody
			public Map<String, Object> deleteFile(
					@RequestParam int boardFileNum,
					HttpServletResponse resp,
					HttpSession session) throws Exception {
				String root = session.getServletContext().getRealPath("/");
				String pathname = root + "uploads" + File.separator + "board";
				
				Board dto=service.readFile(boardFileNum);
				if(dto!=null) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
				
				Map<String, Object> model = new HashMap<>(); 
				try {
					Map<String, Object> map=new HashMap<String, Object>();
					map.put("field", "boardFileNum");
					map.put("num", boardFileNum);
					service.deleteFile(map);
					model.put("state", "true");
				} catch (Exception e) {
					model.put("state", "false");
				}
				
				return model;
			}
}
