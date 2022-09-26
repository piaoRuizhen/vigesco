package org.pyj.controller;

import java.util.ArrayList;

import org.pyj.model.ReplyDTO;
import org.pyj.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ReplyController {
	@Autowired
	ReplyService rservice;
	// consumes, produces 는 선택사항(명시하지 않아도 됨-명시를 하지 않으면 웹브라우저가 알아서 판단을 해서 타입을 결정.) value와 method는 필수
	// consumes는 화면(클라이언트) -> 서버에게 보내는 데이터 타입을 명시
	// produces는 서버 -> 화면(클라이언트)에게 반환하는 데이터 타입을 명시
	//				ajax의 url 주소			
	@RequestMapping(value="/replies/new",method=RequestMethod.POST,consumes="application/json",produces= {MediaType.TEXT_PLAIN_VALUE})
			//정상적이라는 통신상태도 같이 보내야 함
	public ResponseEntity<String> add(@RequestBody ReplyDTO rdto) { // @RequstBody 동기식의 DTO인지 비동기식의 DTO인지 구분해주는거
		//System.out.println(rdto);
		int result=rservice.add(rdto);
		
		// result값이 1이면 정상처리 //if안쓰면 간단하게 삼항연산자 사용하기
		// result 값이 1이면						정상처리
		return result==1?new ResponseEntity<>("success",HttpStatus.OK)
				// 		그렇지 않으면 에러처리
						:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		
	}
	@RequestMapping(value="/replies/list/{bno}",method=RequestMethod.GET,produces= {MediaType.APPLICATION_JSON_UTF8_VALUE, 
																					MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ArrayList<ReplyDTO>> list(@PathVariable("bno")int bno){
	//	통신이 정상적이면(HttpStatus.OK),select된 결과(rservice.list(bno))를	
	// reply.js에 ajax함수의 success에 보내라.
		return new ResponseEntity<>(rservice.list(bno),HttpStatus.OK);
	}
	//댓글목록리스트를 클릭한 후 띄워지는 모달창에 select된 결과 뿌리기 
	@RequestMapping(value="/replies/detail/{rno}",method=RequestMethod.GET,produces= {MediaType.APPLICATION_JSON_UTF8_VALUE, 
			MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReplyDTO> detail(@PathVariable("rno")int rno){
//		통신이 정상적이면(HttpStatus.OK),select된 결과(rservice.detail(rno))를	
		// reply.js에 ajax함수의 success에 보내라.
		return new ResponseEntity<>(rservice.detail(rno),HttpStatus.OK);
	}
	//댓글 내용이 수정되는 update
	@RequestMapping(value="/replies/modify",method=RequestMethod.PUT,consumes="application/json")
	public ResponseEntity<String> modify(@RequestBody ReplyDTO rdto){
		//System.out.println(rdto);
		int result=rservice.modify(rdto); //update가 되었으면 1값, 안되었으면 0값을 result에 저장
		//  		조건  ?	참 	: 	거짓		if문으로 해도 되지만 삼항연산자가 더 짧음 단순하게 if문 처리하고자 할 때 삼항연산자 사용
		return result==1?new ResponseEntity<>("success",HttpStatus.OK)
						:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 댓글내용이 삭제되는 delete
	@RequestMapping(value="/replies/remove/{rno}",method=RequestMethod.DELETE,produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String>remove(@PathVariable("rno")int rno){
		int result=rservice.remove(rno);
		return result==1?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
