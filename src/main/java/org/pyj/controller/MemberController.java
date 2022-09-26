package org.pyj.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

//import org.pyj.dao.MemberDao;
import org.pyj.model.MemberDTO;
import org.pyj.model.ReplyDTO;
import org.pyj.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

// @의 명칭:annotation
@Controller
public class MemberController {
	@Autowired
	//MemberService mdao = new MemberService();
	MemberService mservice;
	
	// localhost:8080/member/member 주소로 
	// member 폴더안에 있는 member.jsp 를 실행
	@RequestMapping(value="member/member", method=RequestMethod.GET)
	public void memberGet() {}
	
	// member.jsp 에서 사용자가 입력한 아이디, 비밀번호, 이름 
	// 데이터를 수집.
	@RequestMapping(value="member/memberWrite", method=RequestMethod.POST)
		public String memberPost(MemberDTO mdto) {
		mservice.MemberInsert(mdto);

		return "redirect:/";
		}
	
	@RequestMapping(value="member/idchk/{id}", method=RequestMethod.GET)
	public ResponseEntity<Integer> list(@PathVariable("id") String id){
		System.out.println(id);
		return new ResponseEntity<>(mservice.idchk(id),HttpStatus.OK);
	}
	
	
	// localhost:8080/member/login 주소로
	// member폴더안에 있는 login.jsp 실행
	@RequestMapping(value="member/login", method=RequestMethod.GET)
	public void loginGet() {}
	@RequestMapping(value="member/login", method=RequestMethod.POST)
											// session 사용하겟다.
	public String loginPost(MemberDTO mdto, HttpSession session) {
		// select(mservice.Login(mdto))된 결과가 있으면(null이 아니면)
		//if(mservice.Login(mdto)!=null){//변수 만들지 않고 조건
		String result="";
		MemberDTO log=mservice.Login(mdto);
		if(log!=null) {//log변수 만든 후 조건
		// session 영역에 select( mservice.Login(mdto))된 결과  member변수에 저장
			session.setAttribute("session", mservice.Login(mdto));
		// 메인페이지(index.jsp)로 이동...
			//return "redirect:/";
			result="redirect:/";
		}else {
			// 그렇지 않으면(select(mservice.Login(mdto))된 결과가 없으면 (null이 아니면)
			//로그인 페이지(member/login.jsp)로 이동
			//return "redirect:/member/login";
			result="redirect:/member/login";
		}
		return result;
				
	}
	
	// 로그아웃
	@RequestMapping(value="member/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}


