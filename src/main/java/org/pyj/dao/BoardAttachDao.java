package org.pyj.dao;

import org.pyj.model.AttachFileDTO;

public interface BoardAttachDao {
	//파일첨부테이블(tbl_attach) insert
	public void BoardAttachWrite(AttachFileDTO bdto);

}
