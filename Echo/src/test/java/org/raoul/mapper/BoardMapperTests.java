package org.raoul.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.raoul.domain.BoardVO;
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
	public void getTime() {
		mapper2.getTime();
	}
	@Test
	@Override
	public void addTest() {
		BoardVO vo = new BoardVO();
		
	
		
		mapper.insert(vo);
		
	}

	@Test
	@Override
	public void readTest() {
		mapper.select(3);
		
	}

	@Test
	@Override
	public void updateTest() {
		// TODO Auto-generated method stub
		
	}

	@Test
	@Override
	public void deleteTest() {
		// TODO Auto-generated method stub
		
	}

	@Test
	@Override
	public void getListTest() {
		mapper.selectAll();
		
	}
	
	
	
	
	
}
