package com.railer.rt.member;

public interface MemberService {
	public Member loginMember(String userId);
	public Member readMember(String userId);
	public void insertMember(Member dto) throws Exception;
	public void updateMember(Member dto) throws Exception;
	public void deleteMember(String userId) throws Exception;
}
