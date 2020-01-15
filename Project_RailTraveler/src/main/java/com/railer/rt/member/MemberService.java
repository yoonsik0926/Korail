package com.railer.rt.member;

import java.util.List;
import java.util.Map;


public interface MemberService {
	public Member loginMember(String userId);
	public void updateLastLogin(String userId) throws Exception;
	public Member readMember(String userId);
	public void insertMember(Member dto) throws Exception;
	public void updateMember(Member dto) throws Exception;
	
	public void updateAuthority(Map<String, Object> map) throws Exception;
	public List<Member> listAuthority(String userId);
	
	public int checkFailureCount(String userId);
	public void updateFailureCount(String userId) throws Exception;
	public void updateFailureCountReset(String userId) throws Exception;
	public void updateEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(Member dto) throws Exception;
	
	public void deleteMember(String userId) throws Exception;
	public Member findId(Map<String, Object> map) throws Exception;
	
	public List<Member> userList(Map<String, Object> map);
	public int userCount(Map<String, Object> map);
}
