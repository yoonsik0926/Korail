package com.railer.rt.tour;

import java.util.List;


public interface TourService {
	public List<Tour> listBoard(int tourcategoryNum);
	public List<Tour> tourCategoryList();
}
