package org.pyj.service;

import java.util.ArrayList;

import org.pyj.model.AttachFileDTO;
import org.pyj.model.BoardDTO;
import org.pyj.model.Criteria;

public interface BoardService {
	// 설계도
	//게시판 글쓰기
	public void BoardWrite(BoardDTO bdto);
	//게시판 목록 리스트
	public ArrayList<BoardDTO> BoardList(Criteria cri);
	//게시판 목록 리스트에서 제목 클릭 시 상세 내용
	public BoardDTO BoardDetail(int bno);
	//게시판 수정
	public void BoardModify(BoardDTO bdto);
	//게시판 삭제
	public void BoardRemove(int bno);
	// 게시판 목록 리스트에서 페이징 처리를 하기  위해서 필요한 전체건수.
	public int getTotalCount(Criteria cri);
	// 상세 내용 화면에 첨부파일 목록 리스트 조회
	public ArrayList<AttachFileDTO> AttachList(int bno);
}
