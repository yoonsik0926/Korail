package com.railer.rt.main;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.railer.rt.commu.board.Board;
import com.railer.rt.commu.board.BoardService;
import com.railer.rt.commu.friend.Friend;
import com.railer.rt.commu.friend.FriendService;
import com.railer.rt.commu.notice.Notice;
import com.railer.rt.commu.notice.NoticeService;
import com.railer.rt.commu.qna.Qna;
import com.railer.rt.commu.qna.QnaService;
import com.railer.rt.plan.Plan;
import com.railer.rt.plan.PlanService;

@Controller("mainController")
public class MainController {
	@Autowired
	private PlanService planService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private FriendService friendService;
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String method(Model model) {
		
		List<Plan> planList = null;
		try {
			planList = planService.mainListPlan();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Plan> fplanList = null;
		try {
			fplanList = planService.mainFriendPlanList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Notice> noticeList = null;
		try {
			noticeList = noticeService.listMainNotice();
			// 리스트의 번호
			Date endDate = new Date();
			long gap;
			for (Notice dto : noticeList) {

				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date beginDate = formatter.parse(dto.getCreated());
				// 날짜 차이 (시간)
				gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
				dto.setGap(gap);
				dto.setCreated(dto.getCreated().substring(0, 10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Board> boardList = null;
		try {
			boardList = boardService.listMainBoard();
			// 리스트의 번호
			Date endDate = new Date();
			long gap;
			for (Board dto : boardList) {

				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date beginDate = formatter.parse(dto.getCreated());
				// 날짜 차이 (시간)
				gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
				dto.setGap(gap);
				dto.setCreated(dto.getCreated().substring(0, 10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		List<Qna> qnaList = null;
		try {
			qnaList = qnaService.listMainQna();
			// 리스트의 번호
			Date endDate = new Date();
			long gap;
			for (Qna dto : qnaList) {

				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date beginDate = formatter.parse(dto.getCreated());
				// 날짜 차이 (시간)
				gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
				dto.setGap(gap);
				dto.setCreated(dto.getCreated().substring(0, 10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		List<Friend> friendList = null;
		try {
			friendList = friendService.listMainFriend();
			// 리스트의 번호
			Date endDate = new Date();
			long gap;
			for (Friend dto : friendList) {

				SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date beginDate = formatter.parse(dto.getCreated());
				// 날짜 차이 (시간)
				gap = (endDate.getTime() - beginDate.getTime()) / (60 * 60 * 1000);
				dto.setGap(gap);
				dto.setCreated(dto.getCreated().substring(0, 10));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("planList",planList);
		model.addAttribute("fplanList",fplanList);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("boardList",boardList);
		model.addAttribute("qnaList",qnaList);
		model.addAttribute("friendList",friendList);
		return ".mainLayout";
	}
}
