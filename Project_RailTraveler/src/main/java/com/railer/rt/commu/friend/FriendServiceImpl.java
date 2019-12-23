package com.railer.rt.commu.friend;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.railer.rt.common.FileManager;
import com.railer.rt.common.dao.CommonDAO;

@Service("friend.friendService")
public class FriendServiceImpl implements FriendService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public void insertFriend(Friend dto, String pathname) throws Exception {

		try {
			int seq = dao.selectOne("friend.seq");
			dto.setFriendNum(seq);
			
			dao.insertData("friend.insertFriend", dto);
			
			if(!dto.getUpload().isEmpty()) {
				for (MultipartFile mf : dto.getUpload()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) continue;
					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();
					
					dto.setOriginalFilename(originalFilename);
					dto.setSaveFilename(saveFilename);
					dto.setFileSize(fileSize);
					
					insertFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result =0;
		try {
			result = dao.selectOne("friend.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Friend> listFriend(Map<String, Object> map) {
		List<Friend> list = null;
		try {
			list = dao.selectList("friend.listFriend", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Friend> listFriendTop() {
		List<Friend> list = null;
		try {
			list = dao.selectList("friend.listFriendTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public void updateHitCount(int num) throws Exception {
		try {
			dao.selectOne("friend.updateHitCount", num);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	@Override
	public Friend readFriend(int num) {
		Friend dto = null;
		try {
			dto = dao.selectOne("friend.readFriend", num);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	@Override 
	public Friend preReadFriend(Map<String, Object> map) {
		Friend dto = null;
		try {
			dto = dao.selectOne("friend.preReadFriend", map);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	@Override
	public Friend nextReadFriend(Map<String, Object> map) {
		Friend dto = null;
		try {
			dto = dao.selectOne("friend.nextReadFriend", map);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	/**
	 * 업데이트 하면서 새로운 파일 업로드를 함께 한다.
	 * 이미 올린 파일은 삭제하거나 추가 할 수 밖에 없다. 파일 수정 불가
	 */
	@Override
	public void updateFriend(Friend dto, String pathname) throws Exception {
		try {
			dao.updateData("friend.updateFriend", dto);
			
			if(!dto.getUpload().isEmpty()) {
				for (MultipartFile mf : dto.getUpload()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null) continue;
					String originalFilename = mf.getOriginalFilename();
					long fileSize = mf.getSize();
					
					dto.setOriginalFilename(originalFilename);
					dto.setSaveFilename(saveFilename);
					dto.setFileSize(fileSize);
					
					insertFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteFriend(int num, String pathname) throws Exception {
		try {
			//파일 지우기
			List<Friend> list = listFile(num);
			if(list!=null) {
				for (Friend dto : list) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			//파일 테이블지우기
			Map<String , Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);

			//게시물지우기
			dao.deleteData("friend.deleteFriend", num);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 원래 안빼고 위의 insertFriend에서 가능...
	 */
	@Override
	public void insertFile(Friend dto) throws Exception {
		try {
			dao.insertData("friend.insertFriendFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Friend> listFile(int num) {
		List<Friend> list =null;
		try {
			list=dao.selectList("friend.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Friend readFile(int fileNum) {
		Friend dto = null;
		try {
			dto = dao.selectOne("friend.readFile", fileNum);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("friend.deleteFile", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
