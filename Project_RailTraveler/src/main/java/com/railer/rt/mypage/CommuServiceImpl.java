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
		int friendDataCount = 0 ;
		try {
			friendDataCount = dao.selectOne("mypage.commuDataCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return friendDataCount;
	}



}
