package org.raoul.mapper;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.raoul.domain.BoardVO;
import org.raoul.domain.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class BoardMapperTests implements GenericMapperTests{

	
	@Autowired
	BoardMapper mapper;

	@Autowired
	TimeMapper mapper2;
	
	
	@Test
	public void testcountList() {
		Criteria cri = new Criteria();
		mapper.countList(cri);
		
	}
	
	@Test
	public void getTime() {
		log.info(mapper2.getTime());
	}
	@Test
	@Override
	public void addTest() {
		BoardVO vo = new BoardVO();
		vo.setUid("Yoon");
		for (int i = 0; i < 20; i++) {
			
			
			
			
			mapper.insert(vo);
		}
		
	}

	@Test
	@Override
	public void readTest() {
		mapper.select(3);
		
	}

	@Test
	@Override
	public void updateTest() {
		BoardVO vo = new BoardVO();
		
		vo.setBno(4);
		
		mapper.update(vo);
		
	}

	@Test
	@Override
	public void deleteTest() {
		
			mapper.delete(1);
		
		
	}

	@Test
	@Override
	public void getListTest() {
		log.info (mapper.selectAll());
		
	}
	
}
