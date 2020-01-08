package com.railer.rt.commu.board;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public void insertBoard(Board dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Board> listBoard(Map<String, Object> map);
	public List<Board> listBoardTop();
	
	public void updateHitCount(int num) throws Exception;
	public Board readBoard(Map<String, Object> readMap);
	public Board preReadBoard(Map<String, Object> map);
	public Board nextReadBoard(Map<String, Object> map);
	
//	public void updateBoard(Board dto, String pathname) throws Exception;
//	public void deleteBoard(Map<String, Object> map, String pathname) throws Exception;
	
	public void insertFile(Board dto) throws Exception;
	public List<Board> listFile(int num);
	public Board readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;

//	public void insertBoardBookmark(Map<String, Object> paramMap) throws Exception;
//	public void deleteBoardBookmark(Map<String, Object> map) throws Exception;
//	public int bookmarkCount(int friendNum) throws Exception ;
//	
//	
//	
//	public void insertBoardReply(BoardReply dto) throws Exception;
//	public int replyCount(Map<String, Object> map) throws Exception;
//	public List<BoardReply> listReply(Map<String, Object> map);
//	public void deleteReply(Map<String, Object> map) throws Exception;
}
