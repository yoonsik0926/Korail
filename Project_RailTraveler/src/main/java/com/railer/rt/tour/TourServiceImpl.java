package com.railer.rt.tour;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;
@Service("tour.tourService")
public class TourServiceImpl implements TourService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Tour> listBoard(int tourcategoryNum) {
		List<Tour> list = null;
		
		try {
			list =dao.selectList("tour.tourList", tourcategoryNum);
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
	
	
	

}
