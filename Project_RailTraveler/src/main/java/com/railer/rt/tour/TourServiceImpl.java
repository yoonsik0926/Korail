package com.railer.rt.tour;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;

@Service("tour.tourService")
public class TourServiceImpl implements TourService {

	@Autowired
	private CommonDAO dao;

	@Override
	public List<Tour> listBoard(Map<String, Object> map) {
		List<Tour> list = null;

		try {
			list = dao.selectList("tour.tourList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Tour> tourCategoryList() {
		List<Tour> list = null;

		try {
			list = dao.selectList("tour.tourCategoryList");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {

			result = dao.selectOne("tour.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Tour> localStation(int locNum) {
		List<Tour> list = null;

		try {
			list = dao.selectList("tour.localStation", locNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Tour> detailTourCategory(Map<String, Object> map) {
		List<Tour> list = null;

		try {
			list = dao.selectList("tour.detailTourCategory", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<Tour> detailTourList(Map<String, Object> map) {

		List<Tour> list = null;

		try {
			list = dao.selectList("tour.detailTourList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public void likeTour(Map<String, Object> map) {

		try {
			dao.updateData("tour.likeTour", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void disLikeTour(Map<String, Object> map) {

		try {
			dao.updateData("tour.cancelLikeTour", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public int likeCheck(Map<String, Object> map) {
		int result = -1;

		try {
			result = dao.selectOne("tour.checkLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Tour> initLikeMark(Map<String, Object> map) {
		List<Tour> list = null;

		try {
			list = dao.selectList("tour.initLikeMark", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<Tour> hitContentList(Map<String, Object> map) {
		List<Tour> list = null;

		try {
			list = dao.selectList("tour.hitContentList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public Tour readDetailTour(int tourNum) {
		Tour dto = null;
		try {
			dto = dao.selectOne("tour.readDetailTour", tourNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Tour> myBookMark(Map<String, Object> map) {
		List<Tour> list = null;

		try {
			list = dao.selectList("tour.tourList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int myBookMarkCount(Map<String, Object> map) {
		int result = 0;
		try {

			result = dao.selectOne("tour.myBookMarkCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
		
		
	
	}

	@Override
	public void insertReply(TourReply dto) {
		try {
			dao.insertData("tour.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int replyCount(int tourNum) {
		int result = 0;
		
		try {
			result = dao.selectOne("tour.replyCount", tourNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<TourReply> replylist(Map<String, Object> map) {
		List<TourReply> list = null;
		
		try {
			list = dao.selectList("tour.replylist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return list;
	}

	@Override
	public int replyAnswerCount(int replyNum) {
		int result =0;
		
		try {
			result = dao.selectOne("tour.replyAnswerCount", replyNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<TourReply> replyAnswerList(int answer) {
		List<TourReply> list = null;
		
		try {
			list = dao.selectList("tour.listReplyAnswer", answer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteReply(Map<String, Object> map) {
		
		try {
/*			dao.deleteData("tour.deleteReplyLike", map);
						
			dao.deleteData("tour.deleteReply", map);*/
			
			dao.updateData("tour.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void replyLike(Map<String, Object> map) {
		
		
		try {
			dao.insertData("tour.replyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void replyLikeCancel(Map<String, Object> map) {
		try {
			dao.deleteData("tour.replyLikeCancel", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int checkReplyLike(Map<String, Object> map) {
		int result =0;
		
		try {
			result = dao.selectOne("tour.checkReplyLike", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Tour readAddress(Map<String, Object> map) {
		Tour dto = null;
		try {
			dto = dao.selectOne("tour.readAddress", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
