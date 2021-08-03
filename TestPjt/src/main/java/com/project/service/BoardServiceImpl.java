package com.project.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.dao.BoardDAO;
import com.project.util.FileUtils;
import com.project.vo.BoardVO;
import com.project.vo.MemberVO;
import com.project.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService {

	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	private BoardDAO dao;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardVO, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(boardVO);
		
		List<Map<String,Object>> list = fileUtils.parseInsertFileInfo(boardVO, mpRequest); 
		int size = list.size();
		for(int i=0; i<size; i++){ 
			dao.insertFile(list.get(i)); 
		}
	}
	
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		scri.setrStart(dao.listCount(scri));
		return dao.list(scri);
	}
	
	// 개시물 총 개수
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		
		return dao.listCount(scri);
	}
	
	// 페이지 스타트
	@Override
	public int rStart(SearchCriteria scri) throws Exception {
		
		return dao.rStart(scri);
	}
	
	// 게시물 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception {
		
		return dao.read(bno);
	}
	
	// 게시물 조회수
	@Override
	public int boardHit(int bno) throws Exception {
		
		return dao.boardHit(bno);
	}
	
	
	// 첨부파일 수정
		@Override
		public void update(BoardVO boardVO, String[] files, MultipartHttpServletRequest mpRequest) throws Exception {
			
			dao.update(boardVO);
			
			List<Map<String, Object>> list = fileUtils.parseUpdateFileInfo(boardVO, files, mpRequest);
			Map<String, Object> tempMap = null;
			int size = list.size();
			for(int i = 0; i<size; i++) {
				tempMap = list.get(i);
				if(tempMap.get("IS_NEW").equals("Y")) {
					dao.insertFile(tempMap);
				}else {
					dao.updateFile(tempMap);
				}
			}
		}

	// 게시물 목록 삭제
	@Override
	public void delete(String bno) throws Exception {
		
		dao.delete(bno);
	}
	
	// 회원탈퇴 + 게시물 삭제
	@Override
	public int boardDelete(MemberVO vo) {
		return dao.boardDelete(vo);
	}
	
	// 첨부파일 조회
	@Override
	public List<Map<String, Object>> selectFileList(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileList(bno);
	}
		
	// 첨부파일 다운로드
	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return dao.selectFileInfo(map);
	}

	
}