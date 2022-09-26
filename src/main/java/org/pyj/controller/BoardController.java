package org.pyj.controller;

import java.util.ArrayList;

import org.pyj.model.AttachFileDTO;
//import org.pyj.dao.BoardDao;
import org.pyj.model.BoardDTO;
import org.pyj.model.Criteria;
import org.pyj.model.PageDTO;
import org.pyj.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	@Autowired
	//BoardDao bdao;
	BoardService bservice;
	//게시판 글쓰기 화면을 실행하기 위한...
	@RequestMapping(value="board/write", method=RequestMethod.GET)
	public String boardWrite() {
		return "board/boardWrite";
	}
	
	//게시판 글쓰기 화면에서 실제로 글쓰기가 이루어지는 영역
	@RequestMapping(value="board/write", method=RequestMethod.POST)
	public String boardWritePost(BoardDTO bdto) {
		System.out.println(bdto);
		// bdao에 있는 BoardWrite 매서드를 호출해라  bdao == BoardDao
		if(bdto.getAttach()!=null) {
			bdto.getAttach().forEach(attach->System.out.println(attach));
		}
		bservice.BoardWrite(bdto);	
		return "redirect:/board/list";
	}
	// 게시판 글 목록 리스트 화면을 실행하기 위한...
	@RequestMapping(value="board/list",method=RequestMethod.GET)
	// Model : Controller 에서 .jsp로 데이터를 전송하는 역할.
	public String boardListGet(Model model,Criteria cri) {
		//model.addAttribute(jsp로 데이터를 보내고자 하는 변수명, jsp로 데이터를 보내고자 하는 값)
		model.addAttribute("blist", bservice.BoardList(cri));
		// boardList.jsp에 페이징 처리를 하기 위한 데이터를 boardList.jsp에 보내고자 함
		model.addAttribute("pageMaker",new PageDTO(cri,bservice.getTotalCount(cri)));
		return "board/boardList";
	}
	
	
	
	
	//boardList.jsp에서 제목을 클릭 했을 때, 상세내용을 보여주는 화면으로...
	//a 태그니까 get방식<boardList.jsp에서...>
	@RequestMapping(value="board/detail",method=RequestMethod.GET)
	public String boardDetail(int bno,Model model) {
		//System.out.println(bno);
		model.addAttribute("bdetail", bservice.BoardDetail(bno));
		return "board/boardDetail";
	}
	//boardDetail.jsp 에서 수정버튼을 클릭했을 때 수정 할 수 있는 화면으로....
	@RequestMapping(value="board/modify",method=RequestMethod.GET)
	public String boardModifyGet(int bno,Model model) {
		model.addAttribute("modify", bservice.BoardDetail(bno));
		return "board/boardModify";
	}
	//boardModify.jsp에서 수정버튼을 클릭하면 실제 update가 실행되게...
	@RequestMapping(value="board/modify",method=RequestMethod.POST)
	public String boardModifyGet(BoardDTO bdto) {
		//update 할 수 있게 Dao연결
		bservice.BoardModify(bdto);
		//detail의 select 결과를 실행하고 난 후, boardDetail.jsp를 실행.(redirect)
		return "redirect:/board/detail?bno="+bdto.getBno();
		
	}
	//boardDetail.jsp에서 삭제버튼을 클릭하면 실제 delete가 실행되게...
	@RequestMapping(value="board/remove",method=RequestMethod.GET)
	public String boardRemoveGet(int bno) {
		bservice.BoardRemove(bno);
		//list의 select결과를 실행하고 난 후, boardList.jsp를 실행.(redirect)
		return "redirect:/board/list";
	}
	@RequestMapping(value="board/attach", produces=MediaType.APPLICATION_JSON_UTF8_VALUE, method=RequestMethod.GET)
	public ResponseEntity<ArrayList<AttachFileDTO>>getAttachList(int bno){
		System.out.println(bno);
		
		return new ResponseEntity<>(bservice.AttachList(bno),HttpStatus.OK);
	}
}
