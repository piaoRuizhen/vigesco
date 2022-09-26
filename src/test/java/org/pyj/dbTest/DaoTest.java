package org.pyj.dbTest;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.pyj.dao.TestDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DaoTest {
	@Autowired
	private TestDao tdao;
	
	@Test
	public void testDao() {
		System.out.println(tdao.getTime());
	}
}
