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

}
