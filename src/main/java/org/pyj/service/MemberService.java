package org.pyj.service;

import org.pyj.model.MemberDTO;

public interface MemberService {
	// 회원가입 화면에서 회원가입 버튼을 클릭했을 때 tbl_member테이블 insert
	public void MemberInsert(MemberDTO mdto);
	// 로그인 화면에서 로그인 버튼을 클릭했을 때 tbl_member테이블에 select 하는것이 지금하고자 하는거
	public MemberDTO Login(MemberDTO mdto);
	
	public int idchk(String id);
}
