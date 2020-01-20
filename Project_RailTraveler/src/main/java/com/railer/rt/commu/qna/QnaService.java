package com.railer.rt.commu.qna;

import java.util.List;
import java.util.Map;

public interface QnaService {
	public void insertQna(Qna dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);

	public int reArticleCount(Map<String, Object> map) throws Exception;
	public List<Qna> listQna(Map<String, Object> map);
	public List<Qna> listReQna(Map<String, Object> map);
	public List<Qna> listQnaTop();
	
	public void updateHitCount(int num) throws Exception;
	public Qna readQna(Map<String, Object> readMap);
	public Qna preReadQna(Map<String, Object> map);
	public Qna nextReadQna(Map<String, Object> map);
	
	public void updateQna(Qna dto, String pathname) throws Exception;
	public void deleteQna(Map<String, Object> map, String pathname) throws Exception;
	
	public void insertFile(Qna dto) throws Exception;
	public List<Qna> listFile(int num);
	public List<File> listFile1(int num);
	public Qna readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;

	public void insertQnaBookmark(Map<String, Object> paramMap) throws Exception;
	public void deleteQnaBookmark(Map<String, Object> map) throws Exception;
	public int bookmarkCount(int friendNum) throws Exception ;
	
	
	
	public void insertQnaReply(QnaReply dto) throws Exception;
	public void updateQnaReply(QnaReply dto) throws Exception;
	public int replyCount(Map<String, Object> map) throws Exception;
	public List<QnaReply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	void updateEnable(Map<String, Object> map) throws Exception;
	
	public List<Qna> listMainQna();
}
