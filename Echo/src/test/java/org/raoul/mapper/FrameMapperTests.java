package org.raoul.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.raoul.domain.FrameVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FrameMapperTests implements GenericMapperTests {

	@Autowired
	FrameMapper fMapper;

	
	@Test
	@Override
	public void addTest() {
		FrameVO vo = new FrameVO();
		vo.setAddress("192.0.0.02");
		vo.setMac("Min");
		fMapper.insert(vo);

	}

	@Test
	@Override
	public void readTest() {
		
		log.info(fMapper.select(3));

	}
	
	@Test
	@Override
	public void updateTest() {
		FrameVO vo = fMapper.select(3);
		log.info(vo);
		vo.setAddress("123.456.789.456");
		vo.setMac("GI");
		fMapper.update(vo);
		
	}
	
	@Test
	@Override
	public void deleteTest() {
		fMapper.delete(4);

	}
	
	
	@Test
	@Override
	public void getListTest() {
		// TODO Auto-generated method stub

	}

}
