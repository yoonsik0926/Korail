package com.railer.rt.commu.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.railer.rt.common.FileManager;
import com.railer.rt.common.dao.CommonDAO;

@Service("board.boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private CommonDAO dao;

	@Autowired
	private FileManager fileManager;

	@Override
	public void insertBoard(Board dto, String pathname) throws Exception {

		try {
			int seq = dao.selectOne("board.seq");
			dto.setBoardNum(seq);

			dao.insertData("board.insertBoard", dto);

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
			result = dao.selectOne("board.dataCount", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list = null;
		try {
			list = dao.selectList("board.listBoard", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Board> listBoardTop() {
		List<Board> list = null;
		try {
			list = dao.selectList("board.listBoardTop");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateHitCount(int num) throws Exception {
		try {
			dao.updateData("board.updateHitCount", num);
		} catch (Exception e) {
			// TODO: handle exception
		}

	}

	@Override
	public Board readBoard(Map<String, Object> readMap) {
		Board dto = null;
		try {
			dto = dao.selectOne("board.readBoard", readMap);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.selectOne("board.preReadBoard", map);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.selectOne("board.nextReadBoard", map);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	/**
	 * 업데이트 하면서 새로운 파일 업로드를 함께 한다. 이미 올린 파일은 삭제하거나 추가 할 수 밖에 없다. 파일 수정 불가
	 */
	@Override
	public void updateBoard(Board dto, String pathname) throws Exception {
		try {
			dao.updateData("board.updateBoard", dto);

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
	public void deleteBoard(Map<String, Object> datamap, String pathname) throws Exception {
		try {
			String snum = String.valueOf(datamap.get("boardNum"));
			int num = Integer.parseInt(snum);
			// 파일 지우기
			List<Board> list = listFile(num);
			if (list != null) {
				for (Board dto : list) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			// 파일 테이블지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "boardNum");
			map.put("num", num);
			deleteFile(map);

			// 게시물지우기
			dao.updateData("board.deleteBoard", datamap);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void deleteBoardAD(Map<String, Object> datamap, String pathname) throws Exception {
		try {
			String snum = String.valueOf(datamap.get("boardNum"));
			int num = Integer.parseInt(snum);
			// 파일 지우기
			List<Board> list = listFile(num);
			if (list != null) {
				for (Board dto : list) {
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			// 파일 테이블지우기
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "boardNum");
			map.put("num", num);
			deleteFile(map);
			
			// 게시물지우기
			dao.deleteData("board.deleteBoardAD", datamap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 원래 안빼고 위의 insertBoard에서 가능...
	 */
	@Override
	public void insertFile(Board dto) throws Exception {
		try {
			dao.insertData("board.insertBoardFile", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Board> listFile(int num) {
		List<Board> list = null;
		try {
			list = dao.selectList("board.listFile", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Board readFile(int boardFileNum) {
		Board dto = null;
		try {
			dto = dao.selectOne("board.readFile", boardFileNum);
		} catch (Exception e) {
			// TODO: handle exception
		}

		return dto;
	}

	@Override
	public void deleteFile(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("board.deleteFile", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	@Override
	public void insertBoardBookmark(Map<String, Object> map) throws Exception {
		try {
			dao.insertData("board.insertBoardBookmark", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<Board> listBoardBookmark(int num) {
		List<Board> list = null;
		try {
			list = dao.selectList("board.listBoardBookmark", num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteBoardBookmark(Map<String, Object> map) throws Exception {
		try {
			dao.deleteData("board.deleteBoardBookmark", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int bookmarkCount(int boardNum) throws Exception {
		int cnt = 0;
		try {
			cnt = dao.selectOne("board.bookmarkCount", boardNum);
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
	public void insertBoardReply(BoardReply dto) throws Exception {
		try {
			dao.insertData("board.insertReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 댓글 수정
	 */
	@Override
	public void updateBoardReply(BoardReply dto) throws Exception {
		try {
			dao.updateData("board.updateReply", dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception{
		try {
			dao.updateData("board.deleteReply", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public int replyCount(Map<String, Object> map) throws Exception {
		int count = 0;
		try {
			count = dao.selectOne("board.replyCount", map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return count;
	}
	
	@Override
	public List<BoardReply> listReply(Map<String, Object> map) {
		List<BoardReply> list=null;
		try {
			list=dao.selectList("board.listReply", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Board> listMainBoard() {
		List<Board> list = null;
		try {
			list = dao.selectList("board.listMainBoard");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
