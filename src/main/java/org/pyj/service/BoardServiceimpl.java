package org.pyj.service;

import java.util.ArrayList;

import org.pyj.dao.BoardAttachDao;
import org.pyj.dao.BoardDao;
import org.pyj.model.AttachFileDTO;
import org.pyj.model.BoardDTO;
import org.pyj.model.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceimpl implements BoardService{
	@Autowired
	BoardDao bdao;
	
	@Autowired
	BoardAttachDao attachdao;
	public void BoardWrite(BoardDTO bdto) {
		
		//로직
		bdao.BoardWrite(bdto);
		// 파일 첨부가 없으면 아래 로직은 실행하지 마세요!
		if(bdto.getAttach()==null) {
			return;
		}
		bdto.getAttach().forEach(attach->{
			// BoardDTO에 있는 bno를 가져와서 AttachFileDTO에 bno에 저장
			attach.setBno(bdto.getBno());
			attachdao.BoardAttachWrite(attach);
		});
	}
	public ArrayList<BoardDTO> BoardList(Criteria cri) {
		//로직
		return bdao.BoardList(cri);
	}
	@Transactional
	public BoardDTO BoardDetail(int bno) {
		//로직
		// tbl_board 테이블의 count컬럼의+1 update(조회수)
		bdao.BoardCntup(bno); //업데이트도 하고 상세내용도 보여줄껴
		//제목을 클릭했을 때 tbl_board테이블의 상세 내용을 조회
		return bdao.BoardDetail(bno);
	}
	
	public void BoardModify(BoardDTO bdto) {	
		//로직
		bdao.BoardModify(bdto);
	}

	public void BoardRemove(int bno) {
		//로직
		bdao.BoardRemove(bno);
		
	}
	public int getTotalCount(Criteria cri) {
		return bdao.getTotalCount(cri);
	}
	// 상세 내용 화면에 첨부파일 목록 리스트 조회
		public ArrayList<AttachFileDTO> AttachList(int bno){
			System.out.println(bno);
			return bdao.attachList(bno);
		}
}
