package org.pyj.service;

import java.util.ArrayList;

import org.pyj.dao.ReplyDao;
import org.pyj.model.ReplyDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service  
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	ReplyDao rdao;
	// 댓글 쓰기
	public int add(ReplyDTO rdto) {
		return rdao.add(rdto);
	}
	// 댓글 목록 리스트
	public ArrayList<ReplyDTO> list(int bno){
		return rdao.list(bno);
	}
	//댓글목록리스트를 클릭한 후 띄워지는 모달창에 select된 결과 뿌리기
			//리턴타입
	public ReplyDTO detail(int rno) {
		return rdao.detail(rno);
	}
	//댓글 내용이 수정되는 update
		public int modify(ReplyDTO rdto) {
			return rdao.modify(rdto);
		}
		// 댓글내용이 삭제되는 delete
		public int remove(int rno) {
			return rdao.remove(rno);
			
		}
}
