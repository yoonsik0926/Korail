package com.railer.rt.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.railer.rt.common.dao.CommonDAO;

@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Member loginMember(String userId) {
		Member dto=null;
		
		try {
			dto=dao.selectOne("member.loginMember", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public void updateLastLogin(String userId) throws Exception {
		try {
			dao.updateData("member.updateLastLogin", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	
	@Override
	public Member readMember(String userId) {
		Member dto=null;
		
		try {
			dto=dao.selectOne("member.readMember", userId);
			
			if(dto!=null) {
				if(dto.getEmail()!=null) {
					String [] s=dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if(dto.getTel()!=null) {
					String [] s=dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			if(dto.getEmail1() != null && dto.getEmail1().length()!=0 &&
					dto.getEmail2() != null && dto.getEmail2().length()!=0)
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			
			if(dto.getTel1() != null && dto.getTel1().length()!=0 &&
					dto.getTel2() != null && dto.getTel2().length()!=0 &&
							dto.getTel3() != null && dto.getTel3().length()!=0)
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			
			int userNum = dao.selectOne("member.memberSeq");
			dto.setUserNum(userNum);
			
			//회원정보 저장
			dao.insertData("member.insertMember1",userNum);
			dao.insertData("member.insertMember2",dto);
			
			//권한
			dto.setAuthority("ROLE_USER");
			dao.insertData("member.insertAuthority",dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			if(dto.getEmail1() != null && dto.getEmail1().length()!=0 &&
					dto.getEmail2() != null && dto.getEmail2().length()!=0)
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			
			if(dto.getTel1() != null && dto.getTel1().length()!=0 &&
					dto.getTel2() != null && dto.getTel2().length()!=0 &&
							dto.getTel3() != null && dto.getTel3().length()!=0)
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			
			dao.updateData("member.updateMember",dto);
		
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateEnabled(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("member.updateMemberEnabled",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}
	
	@Override
	public void deleteMember(String userId) throws Exception {
		try {
			dao.deleteData("member.deleteMember",userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public Member findId(Map<String, Object> map) throws Exception {
		Member dto = null;
		try {
			dto = dao.selectOne("member.findId",map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return dto;
	}

	@Override
	public void updateAuthority(Map<String, Object> map) throws Exception {
		try {
			dao.updateData("member.updateAuthority", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Member> listAuthority(String userId) {
		List<Member> list = null;
		try {
			list = dao.selectList("member.listAuthority",userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int checkFailureCount(String userId) {
		int result = 0;
		try {
			result = dao.selectOne("member.checkFailureCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateFailureCount(String userId) throws Exception {
		try {
			dao.updateData("member.updateFailureCount", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateFailureCountReset(String userId) throws Exception {
		try {
			dao.updateData("member.updateFailureCountReset", userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertMemberState(Member dto) throws Exception {
		try {
			dao.updateData("member.insertMemberState", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Member> userList(Map<String, Object> map) {
		List<Member> list = null;
		try {
			list = dao.selectList("member.totalList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int userCount(Map<String, Object> map) {
		int result =-1;
		try {
			result = dao.selectOne("member.totalUserCount",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	
	
}
