package com.railer.rt.commu.friend;

import java.util.List;
import java.util.Map;

public interface FriendService {
	public void insertFriend(Friend dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Friend> listFriend(Map<String, Object> map);
	public List<Friend> listFriendTop();
	
	public void updateHitCount(int num) throws Exception;
	public Friend readFriend(int num);
	public Friend preReadFriend(Map<String, Object> map);
	public Friend nextReadFriend(Map<String, Object> map);
	
	public void updateFriend(Friend dto, String pathname) throws Exception;
	public void deleteFriend(int num, String pathname) throws Exception;
	
	public void insertFile(Friend dto) throws Exception;
	public List<Friend> listFile(int num);
	public Friend readFile(int fileNum);
	public void deleteFile(Map<String, Object> map) throws Exception;

	public void insertFriendBookmark(Map<String, Object> paramMap) throws Exception;
	public int bookmarkCount(int friendNum) throws Exception ;
}
