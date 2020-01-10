package com.railer.rt.mypage;

import java.util.List;
import java.util.Map;

public interface CommuService {
	public List<Commu> commuList(Map<String, Object> map) throws Exception;
	public int commuDataCount(Map<String, Object> map) throws Exception;
	
	public List<Commu> myCommuList(Map<String, Object> map) throws Exception;
	public int myCommuDataCount(Map<String, Object> map) throws Exception;
}
