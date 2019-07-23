package org.raoul.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.raoul.domain.PhotoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PhotoMapperTests implements GenericMapperTests{

	@Autowired
	PhotoMapper pMapper;
	
	@Test
	@Override
	public void addTest() {
		PhotoVO vo = new PhotoVO();
		vo.setPath("123456789");
		vo.setUid("Yoon");
		vo.setBno("106");
		vo.setPhotoName("그임");
		pMapper.insert(vo);
		
	}

	@Test
	@Override
	public void readTest() {
		log.info(pMapper.select(1));
		
	}

	@Test
	@Override
	public void updateTest() {
		PhotoVO vo = pMapper.select(1);
		vo.setPhotoName("끼요옷");
		pMapper.update(vo);
		
		
	}

	@Test
	@Override
	public void deleteTest() {
		pMapper.delete(1);
		
	}

	@Test
	@Override
	public void getListTest() {
		// TODO Auto-generated method stub
		
	}

}
