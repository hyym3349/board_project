package com.project.dao;

import java.util.List;
import java.util.Map;

import com.project.vo.BoardVO;
import com.project.vo.MemberVO;
import com.project.vo.SearchCriteria;


public interface BoardDAO {

	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	// 게시물 목록 조회
	public List<BoardVO> list(SearchCriteria scri) throws Exception;
	
	// 게시물 총 개수
	public int listCount(SearchCriteria scri) throws Exception;
	
	// 페이지 스타트
	public int rStart(SearchCriteria scri) throws Exception;
	
	// 게시물 조회
	public BoardVO read(int bno) throws Exception;
	
	// 게시물 수정
	public void update(BoardVO boardVO) throws Exception;
	
	// 게시물 선택삭제
	public void delete(String bno) throws Exception;
	
	// 게시판 조회수
	public int boardHit(int bno) throws Exception;

	// 회원탈퇴 + 게시물 삭제
	public int boardDelete(MemberVO vo);

	// 첨부파일 업로드
	public void insertFile(Map<String, Object> map);
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int bno) throws Exception;
	
	// 첨부파일 다운
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
}