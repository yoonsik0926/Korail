package com.railer.rt.commu.qna;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.railer.rt.common.FileManager;
import com.railer.rt.common.dao.CommonDAO;

@Service("qna.qnaService")
public class QnaServiceImpl implements QnaService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public void insertQna(Qna dto, String pathname) throws Exception {

		try {
			int seq = dao.selectOne("qna.seq");
			dto.setQnaNum(seq);

			dao.insertData("qna.insertQna", dto);

			if (!dto.getUpload().isEmpty()) {
				for (MultipartFile mf : dto.getUpload()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null)
						continue;
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
		int result = 0;
		try {
			result = dao.selectOne("qna.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int reArticleCount(Map<String, Object> map) throws Exception {
		int count = 0;
		try {
			count = dao.selectOne("qna.reArticleCount", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return count;
	}
	@Override
	public List<Qna> listQna(Map<String, Object> map) {
		List<Qna> list = null;
		try {
			list = dao.selectList("qna.listQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Qna> listReQna(Map<String, Object> map) {
		List<Qna> list = null;
		try {
			list = dao.selectList("qna.listReQna", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Qna> listQnaTop() {
		List<Qna> list = null;
		try {
			list = dao.selectList("qna.listQnaTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		try {
			dao.updateData("qna.updateHitCount", num);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	@Override
	public Qna readQna(Map<String, Object> readMap) {
		Qna dto = null;
		try {
			dto = dao.selectOne("qna.readQna", readMap);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	@Override
	public Qna preReadQna(Map<String, Object> map) {
		Qna dto = null;
		try {
			dto = dao.selectOne("qna.preReadQna", map);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	@Override
	public Qna nextReadQna(Map<String, Object> map) {
		Qna dto = null;
		try {
			dto = dao.selectOne("qna.nextReadQna", map);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	/**
	 * 업데이트 하면서 새로운 파일 업로드를 함께 한다. 이미 올린 파일은 삭제하거나 추가 할 수 밖에 없다. 파일 수정 불가
	 */
	@Override
	public void updateQna(Qna dto, String pathname) throws Exception {
		try {
			dao.updateData("qna.updateQna", dto);

			if (!dto.getUpload().isEmpty()) {
				for (MultipartFile mf : dto.getUpload()) {
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if (saveFilename == null)
						continue;
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
	public void deleteQna(Map<String, Object> datamap, String pathname) throws Exception {
		try {
			String snum = String.valueOf(datamap.get("qnaNum"));
			int num = Integer.parseInt(snum);
			// 파일 지우기
			List<Qna> list = listFile(num);
			if (list != null) {
				for (Qna dto : list) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			// 파일 테이블지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "qnaNum");
			map.put("num", num);
			deleteFile(map);

			// 게시물지우기
			dao.updateData("qna.deleteQna", datamap);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 원래 안빼고 위의 insertQna에서 가능...
	 */
	@Override
	public void insertFile(Qna dto) throws Exception {
		try {
			dao.insertData("qna.insertQnaFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Qna> listFile(int num) {
		List<Qna> list = null;
		try {
			list = dao.selectList("qna.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Qna readFile(int qnaFileNum) {
		Qna dto = null;
		try {
			dto = dao.selectOne("qna.readFile", qnaFileNum);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("qna.deleteFile", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public void insertQnaBookmark(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("qna.insertQnaBookmark", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteQnaBookmark(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("qna.deleteQnaBookmark", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int bookmarkCount(int qnaNum) throws Exception {
		int cnt = 0;
		try {
			cnt = dao.selectOne("qna.bookmarkCount", qnaNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return cnt;
	}

	/**
	 * 댓글 등록
	 */
	@Override
	public void insertQnaReply(QnaReply dto) throws Exception {
		try {
			dao.insertData("qna.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 댓글 수정
	 */
	@Override
	public void updateQnaReply(QnaReply dto) throws Exception {
		try {
			dao.updateData("qna.updateReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception{
		try {
			dao.updateData("qna.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public int replyCount(Map<String, Object> map) throws Exception {
		int count = 0;
		try {
			count = dao.selectOne("qna.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return count;
	}
	
	@Override
	public List<QnaReply> listReply(Map<String, Object> map) {
		List<QnaReply> list=null;
		try {
			list=dao.selectList("qna.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public void updateEnable(Map<String, Object> map) throws Exception{
		try {
			dao.updateData("qna.updateEnable", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
