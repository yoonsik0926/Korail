package com.railer.rt.singo;

import java.util.List;
import java.util.Map;

public interface SingoService {
	
	public void insertSingo(Singo dto);
	public int singoCount(String targetId);
	public List<Singo> singoList(Map<String,Object> map);
	public String findTargetId(int targetNo);
}
