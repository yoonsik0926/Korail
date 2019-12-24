package com.railer.rt.info;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.FileManager;
import com.railer.rt.common.dao.CommonDAO;

@Service("station.stationService")
public class StationServiceImpl implements StationService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public List<Station> listLocation() {
		List<Station> locList = null;
		try {
			locList = dao.selectList("station.listLocation");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return locList;
	}

	@Override
	public List<Station> listStation(Map<String, Object> map) {
		List<Station> staList = null;
		try {
			staList = dao.selectList("station.listStation", map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return staList;
	}

	@Override
	public Station readStation(int staNum) {
		Station dto = null;
		try {
			dto = dao.selectOne("station.readStation", staNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public List<Station> listBenefit(int staNum) {
		List<Station> beneList = null;
		try {
			beneList = dao.selectList("station.listBenefit", staNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return beneList;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int dataCount = 0;
		try {
			dataCount = dao.selectOne("station.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount;
	}

	@Override
	public int countBenefit(int staNum) {
		int result = 0;
		try {
			result = dao.selectOne("station.countBenefit", staNum);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public List<Station> listTourCate() {
		List<Station> tourCategory = null;
		try {
			tourCategory = dao.selectList("station.listTourCate");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return tourCategory;
	}

	@Override
	public void insertStation(Station dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if (saveFilename != null) {
				dto.setImageFilename(saveFilename);
			}
			dao.insertData("station.insertStation", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteStation(int staNum, String pathname) throws Exception {
		try {
			Station dto = readStation(staNum);
			if (dto == null) {
				return;
			}
			fileManager.doFileDelete(dto.getImageFilename(), pathname);
			dao.deleteData("station.deleteStation", staNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteBenefit(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("station.deleteBenefit", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void updateStation(Station dto, String pathname) throws Exception {
		try {
			
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			
			if(saveFilename != null) {
				if(dto.getImageFilename()!=null && dto.getImageFilename().length()!=0)
					fileManager.doFileDelete(dto.getImageFilename(), pathname);
				dto.setImageFilename(saveFilename);
			}
			
			dao.updateData("station.updateStation", dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void insertBenefit(Station dto) throws Exception {
		try {
			dao.insertData("station.insertBenefit",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateBenefit(Station dto) throws Exception {
		try {
			dao.updateData("station.updateBenefit",dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Station readBenefit(int beneNum) {
		Station dto = null;
		try {
			dto = dao.selectOne("station.readBenefit",beneNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
