package org.pyj.dao;

import java.util.ArrayList;

import org.pyj.model.AttachFileDTO;
import org.pyj.model.BoardDTO;
import org.pyj.model.Criteria;

public interface BoardDao {
	// 게시판 글쓰기를 하기 위한 추상메서드
	public void BoardWrite(BoardDTO bdto);
	// 게시판 목록리스트를 하기 위한 추상메서드- 매개변수가 없다.(?,? 이런거 없었으므로 사용자로부터 받는게 없다는 뜻)
	// ArrayList이 배열이고 배열에 <BoardDTO>를 저장시켜라
	public ArrayList<BoardDTO> BoardList(Criteria cri);
	// 게시판 상세 내용+조회수 update
	public BoardDTO BoardDetail(int bno);
	public void BoardCntup(int bno);
	//게시판 글수정
	public void BoardModify(BoardDTO bdto);
	// 게시판 글삭제
	public void BoardRemove(int bno);
	// 게시판 목록 리스트에서 페이징 처리를 하기  위해서 필요한 전체건수.
	public int getTotalCount(Criteria cri);
	// 상세 내용 화면에 첨부파일 목록 리스트 조회
	public ArrayList<AttachFileDTO> attachList(int bno);
}
