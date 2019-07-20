package org.raoul.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.raoul.domain.MemberVO;
import org.raoul.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests implements GenericMapperTests{

	@Autowired
	private MemberMapper mapper;
	
	@Override
	@Test
	public void addTest() {
		MemberVO vo = new MemberVO();
		vo.setUid("Yoon");
		vo.setPw("12345678");
		vo.setUsername("Joonho");
		vo.setMobile("010");
		log.info(vo);
		mapper.insert(vo);
		
	}

	@Override
	@Test
	public void readTest() {
		log.info(mapper.read("1"));
		
	}

	@Override
	@Test
	public void updateTest() {
		MemberVO vo = mapper.read("2");
		vo.setPw("12345678");
		
		mapper.update(vo);
		
	}

	@Override
	@Test
	public void deleteTest() {
		mapper.delete("Heo");
		
	}

	@Override
	public void getListTest() {
		// TODO Auto-generated method stub
		
	}

}
