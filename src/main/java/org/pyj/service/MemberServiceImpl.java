package org.pyj.service;

import org.pyj.dao.MemberDao;
import org.pyj.model.MemberDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDao mdao;
	// 회원가입 화면에서 회원가입 버튼을 클릭했을 때 tbl_member테이블 insert
		public void MemberInsert(MemberDTO mdto) {
			// 해당 dao 연결
			mdao.MemberInsert(mdto);
		}
		// 로그인 화면에서 로그인 버튼을 클릭했을 때 tbl_member테이블에 select 하는것이 지금하고자 하는거
		public MemberDTO Login(MemberDTO mdto) {
			// 해당 dao 연결
			return mdao.Login(mdto);
		}
		
		public int idchk(String id) {
			return mdao.idchk(id);
		}
		
}
