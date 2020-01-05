package com.railer.rt.mypage;

import java.util.List;
import java.util.Map;

public interface StampService {
	public List<Stamp> listStamp(String userId) throws Exception;
	public Stamp readStamp(Map<String, Object> map) throws Exception;
	public int dataCount(Map<String, Object> map) throws Exception;
}
