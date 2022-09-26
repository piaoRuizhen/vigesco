package org.pyj.dao;

import org.pyj.model.MemberDTO;

public interface MemberDao {
	public void MemberInsert(MemberDTO mdto);
	public MemberDTO Login(MemberDTO mdto);
	
	public int idchk(String id);
}
