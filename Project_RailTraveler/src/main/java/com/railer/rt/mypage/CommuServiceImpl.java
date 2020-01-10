package com.railer.rt.mypage;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;

@Service("mypage.commuService")
public class CommuServiceImpl implements CommuService{
	@Autowired
	private CommonDAO dao; 
	
	@Override
	public List<Commu> commuList(Map<String, Object> map) throws Exception {
		List<Commu> listFriend = null;
		try {
			listFriend = dao.selectList("mypage.commuList",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listFriend;
	}

	@Override
	public int commuDataCount(Map<String, Object> map) throws Exception {
		int friendDataCount = -100 ;
		try {
			friendDataCount = dao.selectOne("mypage.commuDataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return friendDataCount;
	}

	@Override
	public List<Commu> myCommuList(Map<String, Object> map) throws Exception {
		List<Commu> list = null;
		try {
			list = dao.selectList("mypage.listMyCommu",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int myCommuDataCount(Map<String, Object> map) throws Exception {
		int dataCount = 0;
		try {
			dataCount = dao.selectOne("mypage.myCommuDataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount;
	}



}
