package org.pyj.dao;

import java.util.ArrayList;

import org.pyj.model.ReplyDTO;

public interface ReplyDao {
	// 댓글쓰기
	public int add(ReplyDTO rdto);
	// 댓글 목록 리스트
	public ArrayList<ReplyDTO> list(int bno);
	//댓글목록리스트를 클릭한 후 띄워지는 모달창에 select된 결과 뿌리기
	public ReplyDTO detail(int rno);
	//댓글 내용이 수정되는 update
	public int modify(ReplyDTO rdto);
	// 댓글내용이 삭제되는 delete
	public int remove(int rno);
}
