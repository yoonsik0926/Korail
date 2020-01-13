package com.railer.rt.commu.qna;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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
import com.railer.rt.commu.board.Board;
import com.railer.rt.commu.board.BoardService;
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
			@RequestParam(defaultValue = "") String keyword,
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
					query = "&condition=" + condition + "&keyword=" + URLEncoder.encode(keyword, "UTF-8");
				} 
				if (!category.equals("all")) {
					query = "&category=" + URLEncoder.encode(category, "UTF-8");
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

System.out.println(category);
System.out.println(category);
System.out.println(category);
System.out.println(category);
System.out.println(category);
System.out.println(category);
System.out.println(category);

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
	public String createdSubmit(Qna	 dto, HttpSession session) throws Exception {
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
	@RequestMapping(value="/qna/article")
	public String article(Model model) throws Exception {
		model.addAttribute("subMenu", "1");
		
		return ".four.commu.qna.article";
	}
}
