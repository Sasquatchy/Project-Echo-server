package org.raoul.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.raoul.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MemberMapperTests implements GenericMapperTests{

	
	@Autowired
	MemberMapper mapper;
	
	@Test
	@Override
	public void addTest() {
		for (int i = 0; i < 120; i++) {
			
			MemberVO vo = new MemberVO();
			vo.setMobile("0"+i+"0");
			vo.setPw("1234");
			vo.setUid("Uid"+i);
			vo.setUsername("Uname"+i);
			
			mapper.insert(vo);
			
		}
		
		
	}

	@Override
	public void readTest() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTest() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTest() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getListTest() {
		// TODO Auto-generated method stub
		
	}

}
