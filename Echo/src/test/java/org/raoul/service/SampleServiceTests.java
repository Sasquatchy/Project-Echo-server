package org.raoul.service;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.raoul.mapper.TimeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SampleServiceTests {
	
	@Autowired
	private DataSource ds;
	@Autowired
	private TimeMapper mapper;
	
	@Test
	public void testConnection() {
		try(Connection con = ds.getConnection()){
			log.info("-------------");
			log.info(con);
			log.info("-------------");
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	@Test
	public void getime() {
		log.info(mapper.getTime());
		
	}
	
	
		
		
}
