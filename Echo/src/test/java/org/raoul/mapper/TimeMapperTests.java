package org.raoul.mapper;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.log4j.Log4j;


@Log4j
public class TimeMapperTests {

	@Autowired
	
	TimeMapper tmapper;
	// Test dummy to verify if DB is connected
	@Test
	public void testGetTime() {
		log.info(tmapper.getTime());
	}
}
